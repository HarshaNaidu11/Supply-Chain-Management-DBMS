import oracledb
import hashlib
from datetime import datetime
from functools import wraps
from flask import session, redirect, url_for, flash

class AuthManager:
    def __init__(self, db):
        self.db = db
    
    @staticmethod
    def hash_password(password):
        """Hash password using SHA-256"""
        return hashlib.sha256(password.encode()).hexdigest()
    
    def authenticate(self, username, password):
        """Authenticate user and return user data if valid"""
        try:
            hashed_password = self.hash_password(password)
            
            query = """
            SELECT user_id, username, full_name, email, role, is_active
            FROM app_users
            WHERE username = :1 AND password = :2 AND is_active = 1
            """
            
            result = self.db.execute_query(query, (username, hashed_password))
            
            if result and len(result) > 0:
                user = result[0]
                self.update_last_login(user[0])
                
                return {
                    'user_id': user[0],
                    'username': user[1],
                    'full_name': user[2],
                    'email': user[3],
                    'role': user[4],
                    'is_active': user[5]
                }
            return None
        except Exception as e:
            print(f"Authentication error: {e}")
            return None
    
    def update_last_login(self, user_id):
        """Update last login timestamp"""
        query = "UPDATE app_users SET last_login = SYSDATE WHERE user_id = :1"
        self.db.execute_update(query, (user_id,))
    
    def create_user(self, username, password, full_name, email, role):
        """Create a new user"""
        try:
            hashed_password = self.hash_password(password)
            
            query = """
            INSERT INTO app_users (user_id, username, password, full_name, email, role)
            VALUES (user_seq.NEXTVAL, :1, :2, :3, :4, :5)
            """
            
            return self.db.execute_update(query, (username, hashed_password, full_name, email, role))
        except Exception as e:
            print(f"User creation error: {e}")
            return False
    
    def get_all_users(self):
        """Get all users (for admin panel)"""
        query = """
        SELECT user_id, username, full_name, email, role, is_active, 
               TO_CHAR(created_at, 'YYYY-MM-DD') as created,
               TO_CHAR(last_login, 'YYYY-MM-DD HH24:MI:SS') as last_login
        FROM app_users
        ORDER BY user_id
        """
        return self.db.execute_query(query)
    
    def toggle_user_status(self, user_id):
        """Activate/deactivate user"""
        query = """
        UPDATE app_users 
        SET is_active = CASE WHEN is_active = 1 THEN 0 ELSE 1 END
        WHERE user_id = :1
        """
        return self.db.execute_update(query, (user_id,))
    
    def log_action(self, user_id, username, action, table_name, record_id=None, ip_address=None):
        """Log user actions for audit trail"""
        query = """
        INSERT INTO audit_log (log_id, user_id, username, action, table_name, record_id, ip_address)
        VALUES (log_seq.NEXTVAL, :1, :2, :3, :4, :5, :6)
        """
        self.db.execute_update(query, (user_id, username, action, table_name, record_id, ip_address))
    
    def get_audit_logs(self, limit=100):
        """Get recent audit logs"""
        query = """
        SELECT log_id, username, action, table_name, record_id, 
               TO_CHAR(action_time, 'YYYY-MM-DD HH24:MI:SS') as time, ip_address
        FROM audit_log
        ORDER BY log_id DESC
        FETCH FIRST :1 ROWS ONLY
        """
        return self.db.execute_query(query, (limit,))


def login_required(f):
    """Decorator to require login for routes"""
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if 'user_id' not in session:
            flash('Please login to access this page', 'error')
            return redirect(url_for('login'))
        return f(*args, **kwargs)
    return decorated_function


def role_required(*roles):
    """Decorator to require specific role(s)"""
    def decorator(f):
        @wraps(f)
        def decorated_function(*args, **kwargs):
            if 'user_id' not in session:
                flash('Please login to access this page', 'error')
                return redirect(url_for('login'))
            
            if session.get('role') not in roles:
                flash('You do not have permission to access this page', 'error')
                return redirect(url_for('index'))
            
            return f(*args, **kwargs)
        return decorated_function
    return decorator


def get_permissions(role):
    """Get permissions for a role"""
    permissions = {
        'ADMIN': {
            'can_view': True,
            'can_add': True,
            'can_edit': True,
            'can_delete': True,
            'can_manage_users': True,
            'can_view_audit': True
        },
        'MANAGER': {
            'can_view': True,
            'can_add': True,  # Can add products and orders
            'can_edit': True,
            'can_delete': False,
            'can_manage_users': False,
            'can_view_audit': False
        },
        'WAREHOUSE': {
            'can_view': True,  # Only inventory related
            'can_add': False,
            'can_edit': True,  # Only inventory
            'can_delete': False,
            'can_manage_users': False,
            'can_view_audit': False
        },
        'CUSTOMER': {
            'can_view': True,
            'can_add': False,
            'can_edit': False,
            'can_delete': False,
            'can_manage_users': False,
            'can_view_audit': False
        }
    }
    
    return permissions.get(role, permissions['CUSTOMER'])
