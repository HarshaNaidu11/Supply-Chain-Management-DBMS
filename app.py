from flask import Flask, render_template, request, redirect, url_for, flash, session, jsonify
from flask_socketio import SocketIO, emit, join_room, leave_room
from database import Database
from auth import AuthManager, login_required, role_required, get_permissions
from chat_manager import ChatManager
import os
from pathlib import Path

env_path = Path('.') / '.env'
if env_path.exists():
    with open(env_path) as f:
        for line in f:
            line = line.strip()
            if line and not line.startswith('#') and '=' in line:
                key, value = line.split('=', 1)
                os.environ[key.strip()] = value.strip()

app = Flask(__name__)
app.secret_key = os.getenv('SECRET_KEY', 'your-secret-key-change-this')
app.config['SECRET_KEY'] = app.secret_key

# Initialize Socket.IO with gevent for Python 3.12 compatibility
socketio = SocketIO(app, cors_allowed_origins="*", async_mode='gevent')

DB_USER = os.getenv('DB_USER', 'your_username')
DB_PASSWORD = os.getenv('DB_PASSWORD', 'your_password')
DB_DSN = os.getenv('DB_DSN', 'localhost:1521/XEPDB1')

print(f"Connecting to Oracle as: {DB_USER}@{DB_DSN}")

db = Database(DB_USER, DB_PASSWORD, DB_DSN)
auth = AuthManager(db)
chat = ChatManager(db)

@app.before_request
def before_request():
    if not db.connection:
        if not db.connect():
            flash('Database connection failed. Check credentials and Oracle service.', 'error')

@app.context_processor
def inject_permissions():
    context = {}
    if 'role' in session:
        context['permissions'] = get_permissions(session['role'])
        context['user_id'] = session.get('user_id')
        # Get unread message count
        if 'user_id' in session:
            context['unread_count'] = chat.get_unread_count(session['user_id'])
        else:
            context['unread_count'] = 0
    else:
        context['permissions'] = None
        context['unread_count'] = 0
    return context

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        
        user = auth.authenticate(username, password)
        
        if user:
            session['user_id'] = user['user_id']
            session['username'] = user['username']
            session['full_name'] = user['full_name']
            session['email'] = user['email']
            session['role'] = user['role']
            
            auth.log_action(user['user_id'], user['username'], 'LOGIN', 'app_users', 
                          ip_address=request.remote_addr)
            
            flash(f'Welcome back, {user["full_name"]}!', 'success')
            return redirect(url_for('index'))
        else:
            flash('Invalid username or password', 'error')
    
    return render_template('login.html')

@app.route('/logout')
@login_required
def logout():
    username = session.get('username')
    user_id = session.get('user_id')
    
    if user_id and username:
        auth.log_action(user_id, username, 'LOGOUT', 'app_users', ip_address=request.remote_addr)
    
    session.clear()
    flash('You have been logged out', 'success')
    return redirect(url_for('login'))

@app.route('/')
@login_required
def index():
    return render_template('index.html')

@app.route('/suppliers')
@login_required
def suppliers():
    suppliers = db.get_all_suppliers()
    if suppliers is None:
        suppliers = []
        flash('Could not retrieve suppliers. Check database connection.', 'error')
    return render_template('suppliers.html', suppliers=suppliers)

@app.route('/suppliers/add', methods=['GET', 'POST'])
@role_required('ADMIN', 'MANAGER')
def add_supplier():
    if request.method == 'POST':
        name = request.form['name']
        contact = request.form['contact']
        email = request.form['email']
        phone = request.form['phone']
        address = request.form['address']
        city = request.form['city']
        country = request.form['country']
        rating = float(request.form['rating'])
        
        if db.add_supplier(name, contact, email, phone, address, city, country, rating):
            auth.log_action(session['user_id'], session['username'], 'ADD SUPPLIER', 
                          'suppliers', ip_address=request.remote_addr)
            flash('Supplier added successfully', 'success')
            return redirect(url_for('suppliers'))
        else:
            flash('Failed to add supplier', 'error')
    
    return render_template('add_supplier.html')

@app.route('/suppliers/edit/<int:supplier_id>', methods=['GET', 'POST'])
@role_required('ADMIN', 'MANAGER')
def edit_supplier(supplier_id):
    if request.method == 'POST':
        name = request.form['name']
        contact = request.form['contact']
        email = request.form['email']
        phone = request.form['phone']
        address = request.form['address']
        city = request.form['city']
        country = request.form['country']
        rating = float(request.form['rating'])
        
        if db.update_supplier(supplier_id, name, contact, email, phone, address, city, country, rating):
            auth.log_action(session['user_id'], session['username'], 'UPDATE SUPPLIER', 
                          'suppliers', supplier_id, ip_address=request.remote_addr)
            flash('Supplier updated successfully', 'success')
            return redirect(url_for('suppliers'))
        else:
            flash('Failed to update supplier', 'error')
    
    suppliers = db.execute_query("SELECT * FROM suppliers WHERE supplier_id = :1", (supplier_id,))
    return render_template('edit_supplier.html', supplier=suppliers[0] if suppliers else None)

@app.route('/suppliers/delete/<int:supplier_id>')
@role_required('ADMIN')
def delete_supplier(supplier_id):
    if db.delete_supplier(supplier_id):
        auth.log_action(session['user_id'], session['username'], 'DELETE SUPPLIER', 
                      'suppliers', supplier_id, ip_address=request.remote_addr)
        flash('Supplier deleted successfully', 'success')
    else:
        flash('Failed to delete supplier', 'error')
    return redirect(url_for('suppliers'))

@app.route('/products')
@login_required
def products():
    try:
        products = db.get_all_products()
        if products is None:
            products = []
            flash('Could not retrieve products. Check database connection.', 'error')
        return render_template('products.html', products=products)
    except Exception as e:
        print(f"Error in products route: {e}")
        flash(f'Error loading products: {str(e)}', 'error')
        return render_template('products.html', products=[])

@app.route('/products/add', methods=['GET', 'POST'])
@role_required('ADMIN', 'MANAGER')
def add_product():
    if request.method == 'POST':
        name = request.form['name']
        category = request.form['category']
        supplier_id = int(request.form['supplier_id'])
        price = float(request.form['price'])
        description = request.form['description']
        
        if db.add_product(name, category, supplier_id, price, description):
            auth.log_action(session['user_id'], session['username'], 'ADD PRODUCT', 
                          'products', ip_address=request.remote_addr)
            flash('Product added successfully', 'success')
            return redirect(url_for('products'))
        else:
            flash('Failed to add product', 'error')
    
    suppliers = db.get_all_suppliers()
    return render_template('add_product.html', suppliers=suppliers)

@app.route('/products/delete/<int:product_id>')
@role_required('ADMIN')
def delete_product(product_id):
    if db.delete_product(product_id):
        auth.log_action(session['user_id'], session['username'], 'DELETE PRODUCT', 
                      'products', product_id, ip_address=request.remote_addr)
        flash('Product deleted successfully', 'success')
    else:
        flash('Failed to delete product', 'error')
    return redirect(url_for('products'))

@app.route('/warehouses')
@login_required
def warehouses():
    warehouses = db.get_all_warehouses()
    if warehouses is None:
        warehouses = []
        flash('Could not retrieve warehouses. Check database connection.', 'error')
    return render_template('warehouses.html', warehouses=warehouses)

@app.route('/warehouses/add', methods=['GET', 'POST'])
@role_required('ADMIN', 'MANAGER')
def add_warehouse():
    if request.method == 'POST':
        name = request.form['name']
        location = request.form['location']
        city = request.form['city']
        capacity = int(request.form['capacity'])
        manager = request.form['manager']
        phone = request.form['phone']
        
        if db.add_warehouse(name, location, city, capacity, manager, phone):
            auth.log_action(session['user_id'], session['username'], 'ADD WAREHOUSE', 
                          'warehouses', ip_address=request.remote_addr)
            flash('Warehouse added successfully', 'success')
            return redirect(url_for('warehouses'))
        else:
            flash('Failed to add warehouse', 'error')
    
    return render_template('add_warehouse.html')

@app.route('/inventory')
@login_required
def inventory():
    inventory = db.get_inventory_status()
    if inventory is None:
        inventory = []
        flash('Could not retrieve inventory. Check database connection.', 'error')
    return render_template('inventory.html', inventory=inventory)

@app.route('/inventory/low-stock')
@login_required
def low_stock():
    items = db.get_low_stock()
    if items is None:
        items = []
        flash('Could not retrieve low stock items.', 'error')
    return render_template('low_stock.html', items=items)

@app.route('/inventory/update/<int:inventory_id>', methods=['POST'])
@role_required('ADMIN', 'MANAGER', 'WAREHOUSE')
def update_inventory(inventory_id):
    quantity = int(request.form['quantity'])
    if db.update_inventory(inventory_id, quantity):
        auth.log_action(session['user_id'], session['username'], 'UPDATE INVENTORY', 
                      'inventory', inventory_id, ip_address=request.remote_addr)
        flash('Inventory updated successfully', 'success')
    else:
        flash('Failed to update inventory', 'error')
    return redirect(url_for('inventory'))

@app.route('/orders')
@login_required
def orders():
    orders = db.get_all_orders()
    if orders is None:
        orders = []
        flash('Could not retrieve orders. Check database connection.', 'error')
    return render_template('orders.html', orders=orders)

@app.route('/orders/create', methods=['GET', 'POST'])
@role_required('ADMIN', 'MANAGER')
def create_order():
    if request.method == 'POST':
        supplier_id = int(request.form['supplier_id'])
        warehouse_id = int(request.form['warehouse_id'])
        delivery_date = request.form['delivery_date']
        
        order_id = db.create_order(supplier_id, warehouse_id, delivery_date)
        if order_id:
            auth.log_action(session['user_id'], session['username'], 'CREATE ORDER', 
                          'orders', order_id, ip_address=request.remote_addr)
            flash('Order created successfully', 'success')
            return redirect(url_for('orders'))
        else:
            flash('Failed to create order', 'error')
    
    suppliers = db.get_all_suppliers()
    warehouses = db.get_all_warehouses()
    
    if suppliers is None:
        suppliers = []
    if warehouses is None:
        warehouses = []
    
    return render_template('create_order.html', suppliers=suppliers, warehouses=warehouses)

@app.route('/orders/<int:order_id>')
@login_required
def order_details(order_id):
    order = db.execute_query("SELECT * FROM orders WHERE order_id = :1", (order_id,))
    details = db.get_order_details(order_id)
    return render_template('order_details.html', order=order[0] if order else None, details=details)

@app.route('/orders/status/<int:order_id>', methods=['POST'])
@role_required('ADMIN', 'MANAGER')
def update_order_status(order_id):
    status = request.form['status']
    if db.update_order_status(order_id, status):
        auth.log_action(session['user_id'], session['username'], 'UPDATE ORDER STATUS', 
                      'orders', order_id, ip_address=request.remote_addr)
        flash('Order status updated', 'success')
    else:
        flash('Failed to update status', 'error')
    return redirect(url_for('orders'))

@app.route('/analytics')
@login_required
def analytics():
    # Get summary KPIs
    summary = db.get_analytics_summary()
    
    # Get detailed analytics
    category_data = db.get_inventory_by_category()
    top_suppliers = db.get_top_suppliers()
    warehouse_util = db.get_warehouse_utilization()
    order_status = db.get_orders_by_status()
    reorder_needed = db.get_products_needing_reorder()
    recent_orders = db.get_recent_orders(10)
    revenue_by_month = db.get_revenue_by_month(6)
    top_products = db.get_top_products_by_value(10)
    
    # Handle None values with empty lists
    if category_data is None:
        category_data = []
    if top_suppliers is None:
        top_suppliers = []
    if warehouse_util is None:
        warehouse_util = []
    if order_status is None:
        order_status = []
    if reorder_needed is None:
        reorder_needed = []
    if recent_orders is None:
        recent_orders = []
    if revenue_by_month is None:
        revenue_by_month = []
    if top_products is None:
        top_products = []
    
    return render_template('analytics.html', 
                         summary=summary,
                         category_data=category_data,
                         top_suppliers=top_suppliers,
                         warehouse_util=warehouse_util,
                         order_status=order_status,
                         reorder_needed=reorder_needed,
                         recent_orders=recent_orders,
                         revenue_by_month=revenue_by_month,
                         top_products=top_products)

@app.route('/users')
@role_required('ADMIN')
def users():
    users = auth.get_all_users()
    return render_template('users.html', users=users)

@app.route('/users/add', methods=['GET', 'POST'])
@role_required('ADMIN')
def add_user():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        full_name = request.form['full_name']
        email = request.form.get('email', '')
        role = request.form['role']
        
        if auth.create_user(username, password, full_name, email, role):
            auth.log_action(session['user_id'], session['username'], f'CREATED USER: {username}', 
                          'app_users', ip_address=request.remote_addr)
            flash(f'User {username} created successfully', 'success')
            return redirect(url_for('users'))
        else:
            flash('Failed to create user - username may already exist', 'error')
    
    return render_template('add_user.html')

@app.route('/users/toggle/<int:user_id>', methods=['POST'])
@role_required('ADMIN')
def toggle_user(user_id):
    if auth.toggle_user_status(user_id):
        auth.log_action(session['user_id'], session['username'], f'TOGGLED USER STATUS', 
                      'app_users', user_id, ip_address=request.remote_addr)
        flash('User status updated', 'success')
    else:
        flash('Failed to update user status', 'error')
    return redirect(url_for('users'))

# ==================== CHAT ROUTES ====================

@app.route('/chat')
@login_required
def chat_page():
    """Main chat interface"""
    users = chat.get_all_users_for_chat(session['user_id'])
    messages = chat.get_user_messages(session['user_id'], limit=100)
    return render_template('chat.html', users=users, messages=messages)

@app.route('/api/messages')
@login_required
def get_messages():
    """API endpoint to get user messages"""
    unread_only = request.args.get('unread_only', 'false').lower() == 'true'
    messages = chat.get_user_messages(session['user_id'], limit=100, unread_only=unread_only)
    
    # Dates are already converted to strings in chat_manager.py
    return jsonify({
        'messages': messages,
        'unread_count': chat.get_unread_count(session['user_id'])
    })

@app.route('/api/messages/send', methods=['POST'])
@login_required
def send_message_api():
    """API endpoint to send message"""
    data = request.get_json()
    
    message_text = data.get('message_text')
    recipient_ids = data.get('recipient_ids', [])
    message_type = data.get('message_type', 'GENERAL')
    priority = data.get('priority', 'NORMAL')
    is_broadcast = data.get('is_broadcast', False)
    
    if not message_text:
        return jsonify({'success': False, 'error': 'Message text is required'}), 400
    
    message_id = chat.send_message(
        sender_id=session['user_id'],
        message_text=message_text,
        recipient_ids=recipient_ids if recipient_ids else None,
        message_type=message_type,
        priority=priority,
        is_broadcast=is_broadcast
    )
    
    if message_id:
        from datetime import datetime
        # Prepare message data for real-time broadcast
        message_data = {
            'message_id': message_id,
            'sender_id': session['user_id'],
            'sender_name': session['full_name'],
            'sender_username': session['username'],
            'sender_role': session['role'],
            'message_text': message_text,
            'message_type': message_type,
            'priority': priority,
            'is_broadcast': is_broadcast,
            'sent_at': datetime.now().strftime('%b %d, %H:%M'),
            'recipient_ids': recipient_ids
        }
        
        # Emit to all connected clients (they will filter on client-side)
        socketio.emit('new_message', message_data, namespace='/')
        
        return jsonify({'success': True, 'message_id': message_id})
    else:
        return jsonify({'success': False, 'error': 'Failed to send message'}), 500

@app.route('/api/messages/<int:recipient_id>/read', methods=['POST'])
@login_required
def mark_message_read(recipient_id):
    """Mark a message as read"""
    if chat.mark_as_read(recipient_id, session['user_id']):
        return jsonify({'success': True})
    return jsonify({'success': False}), 500

@app.route('/api/messages/read-all', methods=['POST'])
@login_required
def mark_all_read():
    """Mark all messages as read"""
    if chat.mark_all_as_read(session['user_id']):
        return jsonify({'success': True})
    return jsonify({'success': False}), 500

@app.route('/api/users/role/<role>')
@login_required
def get_users_by_role(role):
    """Get users by role - for admin broadcasting"""
    if session.get('role') not in ['ADMIN', 'MANAGER']:
        return jsonify({'error': 'Unauthorized'}), 403
    
    users = chat.get_users_by_role(role)
    return jsonify({'users': users})

@app.route('/api/conversation/<int:user_id>')
@login_required
def get_conversation(user_id):
    """Get conversation with a specific user"""
    messages = chat.get_conversation(session['user_id'], user_id, limit=50)
    
    # sent_at is already converted to string in chat_manager.py
    return jsonify({'messages': messages})

# ==================== SOCKET.IO EVENTS ====================

@socketio.on('connect')
def handle_connect():
    """Handle client connection"""
    if 'user_id' in session:
        join_room(f"user_{session['user_id']}")
        emit('connected', {'user_id': session['user_id']})
        print(f"User {session['username']} connected to chat")

@socketio.on('disconnect')
def handle_disconnect():
    """Handle client disconnection"""
    if 'user_id' in session:
        leave_room(f"user_{session['user_id']}")
        print(f"User {session['username']} disconnected from chat")

@socketio.on('send_message')
def handle_send_message(data):
    """Handle real-time message sending via Socket.IO"""
    if 'user_id' not in session:
        emit('error', {'message': 'Not authenticated'})
        return
    
    message_text = data.get('message_text')
    recipient_ids = data.get('recipient_ids', [])
    message_type = data.get('message_type', 'GENERAL')
    priority = data.get('priority', 'NORMAL')
    is_broadcast = data.get('is_broadcast', False)
    
    message_id = chat.send_message(
        sender_id=session['user_id'],
        message_text=message_text,
        recipient_ids=recipient_ids if recipient_ids else None,
        message_type=message_type,
        priority=priority,
        is_broadcast=is_broadcast
    )
    
    if message_id:
        from datetime import datetime
        message_data = {
            'message_id': message_id,
            'sender_id': session['user_id'],
            'sender_name': session['full_name'],
            'sender_username': session['username'],
            'sender_role': session['role'],
            'message_text': message_text,
            'message_type': message_type,
            'priority': priority,
            'is_broadcast': is_broadcast,
            'sent_at': datetime.now().strftime('%b %d, %H:%M'),
            'recipient_ids': recipient_ids  # Include recipient_ids for client-side filtering
        }
        
        # Send to sender first so they see it immediately
        emit('new_message', message_data)
        
        # Send to specific recipients or broadcast
        if is_broadcast or not recipient_ids:
            emit('new_message', message_data, broadcast=True, include_self=False)
        else:
            # Send to each recipient
            for recipient_id in recipient_ids:
                if recipient_id != session['user_id']:  # Don't send to self again
                    emit('new_message', message_data, room=f"user_{recipient_id}")
        
        # Confirm message sent
        emit('message_sent', {'success': True, 'message_id': message_id})
    else:
        emit('message_sent', {'success': False, 'error': 'Failed to send message'})

@socketio.on('mark_read')
def handle_mark_read(data):
    """Mark message as read"""
    recipient_id = data.get('recipient_id')
    if recipient_id and chat.mark_as_read(recipient_id, session['user_id']):
        emit('marked_read', {'success': True, 'recipient_id': recipient_id})

@socketio.on('typing')
def handle_typing(data):
    """Broadcast typing indicator"""
    recipient_id = data.get('recipient_id')
    if recipient_id:
        emit('user_typing', {
            'user_id': session['user_id'],
            'username': session['username']
        }, room=f"user_{recipient_id}")

if __name__ == '__main__':
    socketio.run(app, debug=True, port=5000, host='0.0.0.0')
