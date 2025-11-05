import oracledb
from datetime import datetime

class ChatManager:
    def __init__(self, db):
        """Initialize ChatManager with database connection"""
        self.db = db
    
    def send_message(self, sender_id, message_text, message_type='GENERAL', 
                    priority='NORMAL', recipient_ids=None, is_broadcast=False,
                    reference_type=None, reference_id=None):
        """Send a message to one or more recipients"""
        cursor = None
        try:
            cursor = self.db.connection.cursor()
            
            # Convert to string to avoid CLOB serialization issues
            message_text_str = str(message_text)
            
            # Insert message
            query = """
            INSERT INTO messages (message_id, sender_id, message_text, message_type, 
                                 priority, reference_type, reference_id, is_broadcast)
            VALUES (message_seq.NEXTVAL, :1, :2, :3, :4, :5, :6, :7)
            RETURNING message_id INTO :8
            """
            
            message_id_var = cursor.var(oracledb.NUMBER)
            cursor.execute(query, [sender_id, message_text_str, message_type, priority,
                                  reference_type, reference_id, 1 if is_broadcast else 0,
                                  message_id_var])
            
            message_id = int(message_id_var.getvalue()[0])
            
            # Get recipients
            if is_broadcast or not recipient_ids:
                recipient_ids = self._get_broadcast_recipients(sender_id)
            
            # Insert recipients
            if recipient_ids:
                for recipient_id in recipient_ids:
                    if recipient_id != sender_id:
                        cursor.execute(
                            "INSERT INTO message_recipients (recipient_id, message_id, user_id) VALUES (recipient_seq.NEXTVAL, :1, :2)",
                            [message_id, recipient_id]
                        )
            
            self.db.connection.commit()
            return message_id
            
        except Exception as e:
            print(f"Error sending message: {e}")
            if self.db.connection:
                self.db.connection.rollback()
            return None
        finally:
            if cursor:
                cursor.close()
    
    def _get_broadcast_recipients(self, sender_id):
        """Get list of users to receive broadcast based on sender's role"""
        try:
            # Get sender role
            result = self.db.execute_query(
                "SELECT role FROM app_users WHERE user_id = :1",
                [sender_id]
            )
            
            if not result:
                return []
            
            sender_role = result[0][0]
            
            # Get recipients based on hierarchy
            if sender_role == 'ADMIN':
                recipients = self.db.execute_query(
                    "SELECT user_id FROM app_users WHERE is_active = 1 AND user_id != :1",
                    [sender_id]
                )
            elif sender_role == 'MANAGER':
                recipients = self.db.execute_query(
                    "SELECT user_id FROM app_users WHERE is_active = 1 AND role IN ('WAREHOUSE', 'CUSTOMER', 'MANAGER') AND user_id != :1",
                    [sender_id]
                )
            else:
                recipients = self.db.execute_query(
                    "SELECT user_id FROM app_users WHERE is_active = 1 AND role IN ('ADMIN', 'MANAGER')",
                    []
                )
            
            return [r[0] for r in recipients] if recipients else []
            
        except Exception as e:
            print(f"Error getting broadcast recipients: {e}")
            return []
    
    def get_user_messages(self, user_id, limit=50, unread_only=False):
        """Get messages for a specific user"""
        try:
            query = """
            SELECT 
                mr.recipient_id,
                m.message_id,
                m.sender_id,
                sender.username,
                sender.full_name,
                sender.role,
                m.message_text,
                m.message_type,
                m.priority,
                m.reference_type,
                m.reference_id,
                m.sent_at,
                mr.is_read,
                mr.read_at
            FROM message_recipients mr
            JOIN messages m ON mr.message_id = m.message_id
            JOIN app_users sender ON m.sender_id = sender.user_id
            WHERE mr.user_id = :1
            """
            
            if unread_only:
                query += " AND mr.is_read = 0"
            
            query += " ORDER BY m.sent_at DESC FETCH FIRST :2 ROWS ONLY"
            
            results = self.db.execute_query(query, [user_id, limit])
            
            messages = []
            if results:
                for row in results:
                    # Format date for display (e.g., "Nov 02, 14:30")
                    sent_at_str = None
                    if row[11]:
                        sent_at_str = row[11].strftime('%b %d, %H:%M')
                    
                    read_at_str = None
                    if row[13]:
                        read_at_str = row[13].strftime('%Y-%m-%d %H:%M:%S')
                    
                    messages.append({
                        'recipient_id': int(row[0]),
                        'message_id': int(row[1]),
                        'sender_id': int(row[2]),
                        'sender_username': str(row[3]),
                        'sender_name': str(row[4]),
                        'sender_role': str(row[5]),
                        'message_text': str(row[6]),
                        'message_type': str(row[7]),
                        'priority': str(row[8]),
                        'reference_type': str(row[9]) if row[9] else None,
                        'reference_id': int(row[10]) if row[10] else None,
                        'sent_at': sent_at_str,
                        'is_read': int(row[12]),
                        'read_at': read_at_str
                    })
            
            return messages
            
        except Exception as e:
            print(f"Error getting user messages: {e}")
            return []
    
    def get_unread_count(self, user_id):
        """Get count of unread messages"""
        try:
            result = self.db.execute_query(
                "SELECT COUNT(*) FROM message_recipients WHERE user_id = :1 AND is_read = 0",
                [user_id]
            )
            return int(result[0][0]) if result else 0
        except Exception as e:
            print(f"Error getting unread count: {e}")
            return 0
    
    def mark_as_read(self, recipient_id, user_id):
        """Mark a message as read"""
        try:
            return self.db.execute_update(
                "UPDATE message_recipients SET is_read = 1, read_at = SYSDATE WHERE recipient_id = :1 AND user_id = :2",
                [recipient_id, user_id]
            )
        except Exception as e:
            print(f"Error marking as read: {e}")
            return False
    
    def mark_all_as_read(self, user_id):
        """Mark all messages as read for a user"""
        try:
            return self.db.execute_update(
                "UPDATE message_recipients SET is_read = 1, read_at = SYSDATE WHERE user_id = :1 AND is_read = 0",
                [user_id]
            )
        except Exception as e:
            print(f"Error marking all as read: {e}")
            return False
    
    def get_conversation(self, user1_id, user2_id, limit=50):
        """Get conversation between two users"""
        try:
            query = """
            SELECT 
                m.message_id,
                m.sender_id,
                sender.username,
                sender.full_name,
                m.message_text,
                m.message_type,
                m.priority,
                m.sent_at
            FROM messages m
            JOIN app_users sender ON m.sender_id = sender.user_id
            JOIN message_recipients mr ON m.message_id = mr.message_id
            WHERE (m.sender_id = :1 AND mr.user_id = :2)
               OR (m.sender_id = :3 AND mr.user_id = :4)
            ORDER BY m.sent_at DESC
            FETCH FIRST :5 ROWS ONLY
            """
            
            results = self.db.execute_query(query, [user1_id, user2_id, user2_id, user1_id, limit])
            
            messages = []
            if results:
                for row in results:
                    messages.append({
                        'message_id': int(row[0]),
                        'sender_id': int(row[1]),
                        'sender_username': str(row[2]),
                        'sender_name': str(row[3]),
                        'message_text': str(row[4]),
                        'message_type': str(row[5]),
                        'priority': str(row[6]),
                        'sent_at': row[7].strftime('%Y-%m-%d %H:%M:%S') if row[7] else None
                    })
            
            return list(reversed(messages))
            
        except Exception as e:
            print(f"Error getting conversation: {e}")
            return []
    
    def get_all_users_for_chat(self, current_user_id):
        """Get list of users that current user can chat with"""
        try:
            result = self.db.execute_query(
                "SELECT role FROM app_users WHERE user_id = :1",
                [current_user_id]
            )
            
            if not result:
                return []
            
            current_role = result[0][0]
            
            # Everyone can chat with everyone
            users = self.db.execute_query(
                "SELECT user_id, username, full_name, role FROM app_users WHERE is_active = 1 AND user_id != :1 ORDER BY username",
                [current_user_id]
            )
            
            user_list = []
            if users:
                for row in users:
                    user_list.append({
                        'user_id': int(row[0]),
                        'username': str(row[1]),
                        'full_name': str(row[2]),
                        'role': str(row[3])
                    })
            
            return user_list
            
        except Exception as e:
            print(f"Error getting users for chat: {e}")
            return []
    
    def get_users_by_role(self, role):
        """Get list of users filtered by role"""
        try:
            users = self.db.execute_query(
                "SELECT user_id, username, full_name, role FROM app_users WHERE is_active = 1 AND role = :1 ORDER BY username",
                [role]
            )
            
            user_list = []
            if users:
                for row in users:
                    user_list.append({
                        'user_id': int(row[0]),
                        'username': str(row[1]),
                        'full_name': str(row[2]),
                        'role': str(row[3])
                    })
            
            return user_list
            
        except Exception as e:
            print(f"Error getting users by role: {e}")
            return []
