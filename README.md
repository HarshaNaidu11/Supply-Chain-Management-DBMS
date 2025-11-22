# Supply Chain Management System with Real-Time Chat

A full-stack web application for managing supply chain operations with **role-based access control**, **user authentication**, **real-time chat system**, and comprehensive **Oracle Database** integration.

![Oracle](https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Flask](https://img.shields.io/badge/Flask-000000?style=for-the-badge&logo=flask&logoColor=white)
![Socket.IO](https://img.shields.io/badge/Socket.IO-010101?style=for-the-badge&logo=socket.io&logoColor=white)

---

## 📑 Documentation Index

| Document | Description |
|----------|-------------|
| **[README.md](README.md)** | Complete system documentation (this file) |
| **[ARCHITECTURE_DIAGRAMS.md](ARCHITECTURE_DIAGRAMS.md)** | System architecture, database schema, and flow diagrams |
| **[schema.sql](schema.sql)** | Main database schema (DDL) |
| **[chat_schema.sql](chat_schema.sql)** | Chat system database schema with triggers |
| **[sample_data.sql](sample_data.sql)** | Sample data for testing (DML) |
| **[migrate_viewer_to_customer.sql](migrate_viewer_to_customer.sql)** | VIEWER→CUSTOMER role migration script |

---

## 🌟 Features

### Core Functionality

- ✅ **User Authentication**: Secure login with SHA-256 password hashing and session management
- ✅ **Role-Based Access Control**: 4 user roles with granular permissions (Admin, Manager, Warehouse, Customer)
- ✅ **Supplier Management**: Track and manage supplier information with ratings
- ✅ **Product Catalog**: Maintain product inventory with categories and pricing
- ✅ **Warehouse Operations**: Manage multiple warehouse locations with capacity tracking
- ✅ **Inventory Tracking**: Real-time stock monitoring with low-stock alerts and reorder levels
- ✅ **Order Processing**: Create and track purchase orders with status updates
- ✅ **Analytics Dashboard**: Visualize data with advanced SQL queries and aggregations
- ✅ **Audit Logging**: Complete audit trail tracking all user actions with timestamps and IP addresses

### 💬 Real-Time Chat System

- ⚡ **Instant Messaging**: WebSocket-based real-time communication using Flask-SocketIO
- 👥 **Role-Based Messaging**: Hierarchical messaging based on user roles
- 📢 **Broadcast Messages**: Admins/Managers can send to all users or specific roles
- 🤖 **Automatic Notifications**: Database triggers for low stock alerts and order updates
- 📋 **Message Types**: General, Announcements, System Alerts, Order Updates, Low Stock Alerts
- 🎯 **Priority Levels**: Low, Normal, High, Urgent (with visual indicators)
- ✅ **Read Receipts**: Track message read status
- ✍️ **Typing Indicators**: See when users are typing
- 🔔 **Desktop Notifications**: Browser-based notifications for new messages
- 🔍 **Message Filtering**: Filter by all, unread, or alerts
- 🎨 **Modern UI**: Beautiful gradient design with smooth animations

### Database Features

- **DDL**: Table creation with constraints, foreign keys, and indexes
- **DML**: Insert, Update, Delete operations with data validation
- **DQL**: Complex SELECT queries with multi-table joins
- **DCL**: User permissions and role-based access control (GRANT, REVOKE)
- **TCL**: Transaction management (COMMIT, ROLLBACK, SAVEPOINT)
- **Advanced SQL**: Aggregates, GROUP BY, HAVING, nested subqueries, materialized views
- **Triggers**: Automatic message generation for business events (low stock, order updates)

---

## 🛠️ Tech Stack

| Layer | Technology | Version | Purpose |
|-------|------------|---------|---------|
| **Backend** | Python | 3.8+ | Application logic |
| **Web Framework** | Flask | 3.0.0 | HTTP routing and templating |
| **Real-Time** | Flask-SocketIO | 5.3.6 | WebSocket communication |
| **Async Server** | gevent | 25.5.1 | WebSocket support for Python 3.12+ |
| **Database** | Oracle Database | 11g+ | Enterprise RDBMS |
| **DB Driver** | python-oracledb | Latest | Pure Python Oracle client |
| **Frontend** | HTML5, CSS3, JavaScript | - | User interface |
| **Templates** | Jinja2 | - | Server-side rendering |
| **Security** | SHA-256 | - | Password hashing |

---

## 📦 Installation

### Prerequisites

| Requirement | Minimum Version | Download Link |
|------------|-----------------|---------------|
| Python | 3.8 | [python.org/downloads](https://www.python.org/downloads/) |
| Oracle Database | 11g XE | [oracle.com/xe-downloads](https://www.oracle.com/database/technologies/xe-downloads.html) |
| Git | Latest | [git-scm.com/downloads](https://git-scm.com/downloads) |

### Quick Setup (5 Steps)

#### Step 1: Clone Repository

```bash
git clone https://github.com/HarshaNaidu11/Supply-Chain-Management-DBMS.git
cd "Supply Chain Management DBMS"
```

#### Step 2: Run Setup Script

```cmd
setup.bat
```

This will:
- Create Python virtual environment
- Install all dependencies (Flask, Flask-SocketIO, gevent, oracledb)
- Create `.env` configuration file

#### Step 3: Configure Database Connection

Edit `.env` file with your Oracle credentials:

```properties
DB_USER=system
DB_PASSWORD=your_oracle_password
DB_DSN=localhost:1521/XE
SECRET_KEY=change-this-to-random-secret-key
```

#### Step 4: Initialize Database

Connect to Oracle and run setup scripts:

```sql
sqlplus system/your_password@localhost:1521/XE

SQL> @schema.sql
SQL> @sample_data.sql
SQL> @add_authentication.sql
SQL> @chat_schema.sql
SQL> @migrate_viewer_to_customer.sql
SQL> exit
```

#### Step 5: Start Application

```cmd
run.bat
```

Or manually:

```cmd
python app.py
```

**Access the application**: Open browser at `http://localhost:5000`

### Default Login Credentials

| Username | Password | Role | Permissions |
|----------|----------|------|-------------|
| admin | password123 | ADMIN | Full system access |
| manager | password123 | MANAGER | Add/Edit (no delete) |
| warehouse | password123 | WAREHOUSE | Inventory only |
| customer | password123 | CUSTOMER | Read-only access |

---

## 👥 User Roles & Permissions

### Role Hierarchy

#### 1. ADMIN (Highest Authority) 👑

**Capabilities:**
- ✅ Full system access including user management
- ✅ Can add, edit, and delete all records
- ✅ Access to audit logs
- ✅ Can broadcast messages to everyone
- 🎯 **Suitable for**: System administrators

#### 2. MANAGER (Middle Management) 📊

**Capabilities:**
- ✅ Can view all data
- ✅ Can add and edit products, suppliers, orders
- ✅ Can broadcast to WAREHOUSE and CUSTOMER roles
- ❌ Cannot delete records or manage users
- ✅ Access to analytics and reports
- 🎯 **Suitable for**: Supply chain managers, operations managers

#### 3. WAREHOUSE (Operations Staff) 📦

**Capabilities:**
- ✅ Can view and update inventory quantities only
- ✅ Limited to inventory management
- ✅ Can receive messages from ADMIN and MANAGER
- ❌ Cannot add products or modify other data
- 🎯 **Suitable for**: Warehouse operators, stock keepers

#### 4. CUSTOMER (External Users) 👀

**Capabilities:**
- ✅ Read-only access to all data
- ✅ Can receive messages from ADMIN and MANAGER
- ❌ Cannot add, edit, or delete anything
- 🎯 **Suitable for**: External customers, vendors, auditors, partners

### Permissions Matrix

| Permission | ADMIN | MANAGER | WAREHOUSE | CUSTOMER |
|-----------|-------|---------|-----------|----------|
| 👁️ View Data | ✅ | ✅ | ✅ | ✅ |
| ➕ Add Records | ✅ | ✅ | ❌ | ❌ |
| ✏️ Edit Records | ✅ | ✅ | ✅* | ❌ |
| 🗑️ Delete Records | ✅ | ❌ | ❌ | ❌ |
| 👥 Manage Users | ✅ | ❌ | ❌ | ❌ |
| 📋 View Audit Logs | ✅ | ❌ | ❌ | ❌ |
| 📢 Broadcast Messages | All | W+C | ❌ | ❌ |

*WAREHOUSE can only edit inventory levels

### Chat System Hierarchy

```
ADMIN (Top Authority)
  ├── Can message: Everyone
  └── Can broadcast: All users, specific roles, or individuals

MANAGER
  ├── Can message: WAREHOUSE, CUSTOMER, other MANAGERs
  └── Can broadcast: WAREHOUSE staff, CUSTOMERs

WAREHOUSE
  ├── Can message: ADMIN, MANAGER
  └── Cannot broadcast

CUSTOMER
  ├── Can message: ADMIN, MANAGER
  └── Cannot broadcast
```

---

## 📂 Project Structure

```
Supply Chain Management DBMS/
│
├── 📄 Core Application Files
│   ├── app.py                      # Flask app with Socket.IO integration
│   ├── auth.py                     # Authentication and role decorators
│   ├── database.py                 # Database operations and queries
│   ├── chat_manager.py             # Chat business logic
│   └── requirements.txt            # Python dependencies
│
├── 🗄️ Database Files
│   ├── schema.sql                  # Main database schema (DDL)
│   ├── chat_schema.sql             # Chat system schema with triggers
│   ├── sample_data.sql             # Sample data (DML)
│   ├── add_authentication.sql      # User authentication setup
│   ├── user_roles_dcl.sql          # Oracle DCL implementation
│   ├── dcl_permissions.sql         # Additional permissions (DCL)
│   ├── tcl_examples.sql            # Transaction examples (TCL)
│   ├── advanced_queries.sql        # Complex queries and analytics
│   └── migrate_viewer_to_customer.sql  # Role migration script
│
├── 🎨 Templates
│   ├── base.html                   # Base template with navigation
│   ├── login.html                  # Login page
│   ├── index.html                  # Dashboard
│   ├── chat.html                   # Chat interface (1120+ lines)
│   ├── users.html                  # User management (admin)
│   ├── suppliers.html              # Supplier management
│   ├── products.html               # Product catalog
│   ├── inventory.html              # Inventory tracking
│   ├── orders.html                 # Order management
│   ├── analytics.html              # Analytics dashboard
│   └── ...                         # Other templates
│
├── 📚 Documentation
│   ├── README.md                   # This file
│   └── ARCHITECTURE_DIAGRAMS.md    # System architecture diagrams
│
└── 🔧 Configuration & Scripts
    ├── .env                        # Environment variables
    ├── .gitignore                  # Git ignore rules
    ├── setup.bat                   # Installation script
    └── run.bat                     # Start script
```

---

## 🗄️ Database Implementation

### Schema Overview

**Main Tables (9):**

1. `suppliers` - Supplier information with ratings
2. `warehouses` - Warehouse locations and capacity
3. `products` - Product catalog with categories
4. `inventory` - Stock levels with reorder points
5. `orders` - Purchase orders with status tracking
6. `order_details` - Order line items
7. `shipments` - Delivery tracking
8. `app_users` - User accounts with roles
9. `audit_log` - Action tracking with timestamps

**Chat Tables (3):**

10. `messages` - All chat messages
11. `message_recipients` - Message delivery tracking
12. `chat_rooms` - Group chat rooms (future use)

**Total Records:** 1500+ (when using large_sample_data.sql)

### Views (6)

| View | Purpose |
|------|---------|
| low_stock_items | Products below reorder level |
| order_summary | Order aggregates by status |
| supplier_performance | Supplier ratings and order counts |
| user_inbox | User's messages |
| message_details | Complete message info |
| user_unread_count | Unread message count |

### Sequences (12)

Auto-increment IDs for all tables:
- `supplier_seq`, `product_seq`, `warehouse_seq`, `inventory_seq`
- `order_seq`, `detail_seq`, `shipment_seq`
- `user_seq`, `log_seq`
- `message_seq`, `recipient_seq`, `room_seq`

### SQL Features Demonstrated

| Feature | Description | Example |
|---------|-------------|---------|
| **DDL** | CREATE TABLE, VIEW, SEQUENCE, INDEX, ALTER | Table creation with constraints |
| **DML** | INSERT, UPDATE, DELETE | Data manipulation with validation |
| **DQL** | SELECT with JOINs | Complex multi-table queries |
| **DCL** | GRANT, REVOKE | User permissions |
| **TCL** | COMMIT, ROLLBACK, SAVEPOINT | Transaction management |
| **Aggregates** | COUNT, SUM, AVG, MIN, MAX | Statistical analysis |
| **Group By & Having** | Category analysis | Status-wise grouping |
| **Subqueries** | Nested SELECT | Complex calculations |
| **Triggers** | Automatic actions | Low stock alerts, order notifications |
| **Constraints** | PK, FK, CHECK, UNIQUE | Data integrity |

---

## 🚀 Application Usage

### Dashboard Features

- 👤 User information with role badge
- 📊 Quick statistics (suppliers, products, warehouses, orders)
- 📋 Recent activity (latest 5 orders with status)
- ⚠️ Low stock alerts (products needing reorder)
- 💬 Chat notifications (unread message count with badge)

### Module-wise Capabilities

#### 👥 User Management (Admin Only)
- ➕ Create new users with role assignment
- ✏️ Edit user details
- 🔄 Activate/Deactivate users
- 📊 View last login timestamps
- 🔍 Search and filter users

#### 🏪 Supplier Management
- 📋 View all suppliers with ratings (1-5 stars)
- ➕ Add new suppliers with contact info
- ✏️ Update supplier details (Admin, Manager)
- 🗑️ Delete suppliers (Admin only)
- 📈 Performance tracking

#### 📦 Product Catalog
- 📋 Browse products by category
- ➕ Add new products with pricing
- ✏️ Update product information
- 🗑️ Remove products (Admin only)
- 🔍 Search products

#### 🏭 Warehouse Operations
- 📍 Manage multiple warehouse locations
- 📊 Track capacity utilization
- ➕ Add new warehouses
- ✏️ Update warehouse details
- 📈 Inventory distribution

#### 📊 Inventory Management
- 👁️ Monitor stock levels across warehouses
- ⚠️ View low-stock alerts (quantity ≤ reorder level)
- ✏️ Update quantities (Admin, Manager, Warehouse)
- 📅 Track last updated timestamps
- 🔔 Automatic notifications via chat

#### 🛒 Order Processing
- ➕ Create new purchase orders
- 📦 Add products to orders
- 🔄 Update order status: PENDING → CONFIRMED → SHIPPED → DELIVERED
- 📋 View complete order details and history
- 🔔 Status change notifications

#### 📈 Analytics Dashboard
- 📊 Inventory by category (GROUP BY)
- 🏆 Top suppliers by order value (aggregates)
- 🏭 Warehouse utilization (subqueries)
- ⚠️ Products needing reorder (HAVING clause)
- 📉 Order statistics by status
- 💰 Revenue analysis

---

## 🔒 Security Features

### Authentication & Authorization

1. **Password Hashing**: All passwords stored as SHA-256 hashes (never plain text)
2. **Session Management**: Secure Flask sessions with secret key
3. **Role Validation**: Decorator-based permission checks on every route
4. **Login Required**: All routes protected except login page

### Audit & Monitoring

5. **Audit Trail**: Complete log of all user actions with:
   - Username and user ID
   - Action performed (CREATE, UPDATE, DELETE, LOGIN, LOGOUT)
   - Affected table name
   - Affected record ID
   - Timestamp (accurate to seconds)
   - IP address of the user

6. **Active Status**: Deactivate users without deletion (soft delete)

### Data Protection

7. **XSS Protection**: Template escaping with Jinja2
8. **CSRF Protection**: Session-based CSRF tokens
9. **Input Validation**: Server-side validation for all inputs
10. **SQL Injection Prevention**: Parameterized queries with oracledb

---

## 🧪 Testing Guide

### Test Role-Based Access Control

Login with different accounts to verify permissions:

1. **Admin Test** (`admin/password123`):
   - ✅ Can access all modules
   - ✅ Can delete records
   - ✅ Can manage users
   - ✅ Can broadcast to everyone
   - ✅ Can view audit logs

2. **Manager Test** (`manager/password123`):
   - ✅ Can view all data
   - ✅ Can add/edit products, suppliers, orders
   - ✅ Can broadcast to WAREHOUSE and CUSTOMER
   - ❌ Cannot delete records
   - ❌ Cannot manage users

3. **Warehouse Test** (`warehouse/password123`):
   - ✅ Can view inventory
   - ✅ Can update stock quantities
   - ✅ Can message admins/managers
   - ❌ Cannot add products
   - ❌ Cannot broadcast

4. **Customer Test** (`customer/password123`):
   - ✅ Can view all data (read-only)
   - ✅ Can receive messages
   - ❌ Cannot modify anything
   - ❌ Cannot broadcast

### Test Chat System

1. **Verify Database Setup**:
```sql
-- Check tables exist
SELECT table_name FROM user_tables WHERE table_name LIKE '%MESSAGE%';

-- Check views
SELECT view_name FROM user_views;

-- Check triggers
SELECT trigger_name FROM user_triggers WHERE trigger_name LIKE '%TRG%';
```

2. **Test Real-Time Messaging**:
   - Open two browsers (or incognito + normal)
   - Login as different users
   - Send messages and verify instant delivery
   - Check typing indicators work
   - Verify read receipts update

3. **Test Broadcast**:
   - Login as Admin
   - Click "📢 Broadcast"
   - Select "All Users"
   - Send message
   - Verify all users receive it

4. **Test Automatic Notifications**:
```sql
-- Trigger low stock alert
UPDATE inventory SET quantity = 3 WHERE product_id = 1;
-- Check if admins/managers received alert in chat

-- Trigger order notification
UPDATE orders SET status = 'SHIPPED' WHERE order_id = 1;
-- Check if admins/managers received notification
```

---

## 🐛 Troubleshooting

### Database Connection Issues

**Problem**: "Database connection failed"

**Solutions**:

| Step | Command | Purpose |
|------|---------|---------|
| 1 | `net start OracleServiceXE` | Start Oracle service |
| 2 | Check `.env` file | Verify credentials |
| 3 | `sqlplus system/password@localhost:1521/XE` | Test connection |
| 4 | Verify DSN format | `localhost:1521/XE` or `XEPDB1` |

### Login Issues

**Problem**: "Invalid username or password"

**Verification Steps**:

```sql
-- Check users exist
SELECT username, role FROM app_users;

-- Verify authentication setup
SELECT table_name FROM user_tables WHERE table_name = 'APP_USERS';

-- Check active status
SELECT username, is_active FROM app_users;
```

### Permission Denied

**Problem**: "You don't have permission to perform this action"

**Diagnosis**:

```sql
-- Check user role
SELECT username, role, is_active FROM app_users WHERE username = 'your_username';

-- Verify role permissions in auth.py
-- ADMIN: all permissions
-- MANAGER: read, create, update (no delete)
-- WAREHOUSE: read, update (inventory only)
-- CUSTOMER: read only
```

### Chat Not Working

**Problem**: Chat messages not delivering in real-time

**Solutions**:

| Issue | Check | Fix |
|-------|-------|-----|
| Dependencies | `pip list \| findstr socketio` | `pip install -r requirements.txt` |
| Schema | `SELECT * FROM user_tables WHERE table_name LIKE 'MESSAGE%'` | `@chat_schema.sql` |
| WebSocket | Browser console (F12) | Check for errors, refresh |
| Firewall | Port 5000 access | Allow in firewall |
| Browser | Cache issues | Hard refresh (Ctrl+Shift+R) |

### Import Errors

**Problem**: "ModuleNotFoundError: No module named 'flask_socketio'"

**Solution**:

```cmd
# Reinstall all dependencies
setup.bat

# Or manually:
pip install -r requirements.txt
```

### Tables Not Found

**Problem**: "ORA-00942: table or view does not exist"

**Solution**:

```sql
-- Run setup scripts in order
@schema.sql
@add_authentication.sql
@chat_schema.sql

-- Verify tables exist
SELECT table_name FROM user_tables ORDER BY table_name;
```

---

## 🚀 Production Deployment Checklist

### Security Configuration

| Task | Status | Command/Action |
|------|--------|----------------|
| Change default passwords | [ ] | Update all demo account passwords |
| Generate strong SECRET_KEY | [ ] | `import secrets; print(secrets.token_hex(32))` |
| Set FLASK_ENV=production | [ ] | Update `.env` file |
| Enable HTTPS | [ ] | SSL certificate configuration |
| Password complexity | [ ] | Implement validation rules |
| Session timeouts | [ ] | Add timeout configuration |
| Rate limiting | [ ] | Configure API rate limits |
| Disable debug mode | [ ] | Set `debug=False` in app.py |
| Review DCL permissions | [ ] | Audit database user permissions |

### Database Configuration

| Task | Status | Notes |
|------|--------|-------|
| Create production DB user | [ ] | Don't use 'system' account |
| Setup backups | [ ] | Regular scheduled backups |
| Configure connection pooling | [ ] | Optimize for production load |
| Optimize indexes | [ ] | Based on query patterns |
| Archive audit logs | [ ] | Regular log rotation |

### Server Configuration

| Task | Status | Command |
|------|--------|---------|
| Production WSGI server | [ ] | `pip install waitress` then `waitress-serve --port=5000 app:app` |
| Reverse proxy | [ ] | Configure nginx/Apache |
| Firewall rules | [ ] | Allow only necessary ports |
| Application logging | [ ] | Configure logging to files |
| Monitoring & alerts | [ ] | Setup monitoring solution |

### Environment Variables (Production)

```properties
# .env (PRODUCTION)
FLASK_ENV=production
DB_USER=scm_prod_user
DB_PASSWORD=<strong-secure-password>
DB_DSN=<production-db-host>:1521/ORCL
SECRET_KEY=<generated-256-bit-key>
SESSION_TIMEOUT=3600
MAX_CONTENT_LENGTH=16777216
```

---

## 📄 License

This project is developed for **educational purposes** as a **Database Management Systems (DBMS) coursework demonstration**.

Feel free to use this project for learning, but please provide attribution if you use it in your own projects.

---

## 👨‍💻 Author

**Created by**: [HarshaNaidu11](https://github.com/HarshaNaidu11)

**Project Type**: Database Management Systems (DBMS) Academic Project

**Demonstrates**:
- ✅ Oracle SQL integration with Python Flask
- ✅ Complete DBMS features (DDL, DML, DQL, DCL, TCL)
- ✅ Enterprise-grade authentication and authorization
- ✅ Real-time WebSocket communication (Socket.IO)
- ✅ Role-based access control with 4-tier hierarchy
- ✅ Database triggers for automatic notifications
- ✅ Modern web application architecture

---

## 🔗 Quick Links

- **[View Architecture Diagrams](ARCHITECTURE_DIAGRAMS.md)** - System design and flow charts
- **[Database Schema](schema.sql)** - Main table definitions
- **[Chat Schema](chat_schema.sql)** - Chat system tables and triggers
- **[Sample Data](sample_data.sql)** - Test data for demonstration
- **[Migration Script](migrate_viewer_to_customer.sql)** - Role update SQL

---

## 📞 Support & Contact

For questions or issues:
- **GitHub Issues**: [Submit an issue](https://github.com/HarshaNaidu11/Supply-Chain-Management-DBMS/issues)
- **GitHub Profile**: [@HarshaNaidu11](https://github.com/HarshaNaidu11)
- **Documentation**: Check ARCHITECTURE_DIAGRAMS.md for detailed diagrams

---

## 🤝 Contributing

This is an academic project, but suggestions and improvements are welcome!

If you find this project helpful, please:
- ⭐ **Star the repository**
- 🔀 **Fork for your own learning**
- 📢 **Share with classmates**
- 💬 **Provide feedback via Issues**

---

## ⭐ Key Highlights

✅ **Oracle SQL** - Complete DBMS integration with DDL, DML, DQL, DCL, TCL  
✅ **Flask** - Modern Python web framework with Jinja2 templates  
✅ **Real-Time Chat** - WebSocket-based messaging with Socket.IO  
✅ **Role-Based Access** - 4-tier hierarchical permission system  
✅ **Auto Notifications** - Database triggers for business events  
✅ **Production Ready** - Authentication, audit logs, security features  
✅ **Comprehensive Documentation** - Architecture diagrams, setup guides, API docs  

---

**⭐ If this project helped you with your DBMS course, please star the repository!**

**Built with ❤️ for Database Management Systems coursework**

For detailed architecture and flow diagrams, see **[ARCHITECTURE_DIAGRAMS.md](ARCHITECTURE_DIAGRAMS.md)**
