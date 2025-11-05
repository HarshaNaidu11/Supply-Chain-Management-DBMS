# Supply Chain Management System with Real-Time Chat# Supply Chain Management System with Real-Time Chat# Supply Chain Management System with Real-Time Chat# Supply Chain Management System with Real-Time Chat



A full-stack web application for managing supply chain operations with **role-based access control**, **user authentication**, **real-time chat system**, and comprehensive **Oracle Database** integration.



---A full-stack web application for managing supply chain operations with **role-based access control**, **user authentication**, **real-time chat system**, and comprehensive **Oracle Database** integration.



## Documentation Index



| Document | Description |---A full-stack web application for managing supply chain operations with **role-based access control**, **user authentication**, **real-time chat system**, and comprehensive **Oracle Database** integration.A full-stack web application for managing supply chain operations with **role-based access control**, **user authentication**, **real-time chat system**, and comprehensive **Oracle Database** integration.

|----------|-------------|

| [README.md](README.md) | Complete system documentation (this file) |

| [ARCHITECTURE_DIAGRAMS.md](ARCHITECTURE_DIAGRAMS.md) | System architecture, database schema, and flow diagrams |

| [schema.sql](schema.sql) | Main database schema (DDL) |## 📑 Documentation Index

| [chat_schema.sql](chat_schema.sql) | Chat system database schema with triggers |

| [sample_data.sql](sample_data.sql) | Basic sample data for testing (DML) |

| [large_sample_data.sql](large_sample_data.sql) | **NEW:** 500+ records for analytics and presentation |

| [migrate_viewer_to_customer.sql](migrate_viewer_to_customer.sql) | VIEWER to CUSTOMER role migration script || Document | Description |------



---|----------|-------------|



## Features| **[README.md](README.md)** | Complete system documentation (this file) |



### Core Functionality| **[ARCHITECTURE_DIAGRAMS.md](ARCHITECTURE_DIAGRAMS.md)** | System architecture, database schema, and flow diagrams |

- **User Authentication**: Secure login with SHA-256 password hashing and session management

- **Role-Based Access Control**: 4 user roles with granular permissions (Admin, Manager, Warehouse, Customer)| **[schema.sql](schema.sql)** | Main database schema (DDL) |## 📑 Documentation Index## 📑 Documentation Index

- **Supplier Management**: Track and manage supplier information with ratings

- **Product Catalog**: Maintain product inventory with categories and pricing| **[chat_schema.sql](chat_schema.sql)** | Chat system database schema with triggers |

- **Warehouse Operations**: Manage multiple warehouse locations with capacity tracking

- **Inventory Tracking**: Real-time stock monitoring with low-stock alerts and reorder levels| **[sample_data.sql](sample_data.sql)** | Sample data for testing (DML) |

- **Order Processing**: Create and track purchase orders with status updates

- **Analytics Dashboard**: Visualize data with advanced SQL queries and aggregations| **[migrate_viewer_to_customer.sql](migrate_viewer_to_customer.sql)** | VIEWER→CUSTOMER role migration script |

- **Audit Logging**: Complete audit trail tracking all user actions with timestamps and IP addresses

| Document | Description |- **[README.md](README.md)** - This file: Complete system documentation

### Real-Time Chat System

- **Instant Messaging**: WebSocket-based real-time communication using Flask-SocketIO---

- **Role-Based Messaging**: Hierarchical messaging based on user roles

- **Broadcast Messages**: Admins/Managers can send to all users or specific roles|----------|-------------|- **[ARCHITECTURE_DIAGRAMS.md](ARCHITECTURE_DIAGRAMS.md)** - System architecture and flow diagrams

- **Automatic Notifications**: Database triggers for low stock alerts and order updates

- **Message Types**: General, Announcements, System Alerts, Order Updates, Low Stock Alerts## 🌟 Features

- **Priority Levels**: Low, Normal, High, Urgent (with visual indicators)

- **Read Receipts**: Track message read status| **[README.md](README.md)** | Complete system documentation (this file) |- **[schema.sql](schema.sql)** - Main database schema (DDL)

- **Typing Indicators**: See when users are typing

- **Desktop Notifications**: Browser-based notifications for new messages### Core Functionality

- **Message Filtering**: Filter by all, unread, or alerts

- **Modern UI**: Beautiful gradient design with smooth animations- **User Authentication**: Secure login with SHA-256 password hashing and session management| **[ARCHITECTURE_DIAGRAMS.md](ARCHITECTURE_DIAGRAMS.md)** | System architecture, database schema, and flow diagrams |- **[chat_schema.sql](chat_schema.sql)** - Chat system database schema



### Database Features- **Role-Based Access Control**: 4 user roles with granular permissions (Admin, Manager, Warehouse, Customer)

- **DDL**: Table creation with constraints, foreign keys, and indexes

- **DML**: Insert, Update, Delete operations with data validation- **Supplier Management**: Track and manage supplier information with ratings| **[schema.sql](schema.sql)** | Main database schema (DDL) |- **[sample_data.sql](sample_data.sql)** - Sample data for testing (DML)

- **DQL**: Complex SELECT queries with multi-table joins

- **DCL**: User permissions and role-based access control (GRANT, REVOKE)- **Product Catalog**: Maintain product inventory with categories and pricing

- **TCL**: Transaction management (COMMIT, ROLLBACK, SAVEPOINT)

- **Advanced SQL**: Aggregates, GROUP BY, HAVING, nested subqueries, materialized views- **Warehouse Operations**: Manage multiple warehouse locations with capacity tracking| **[chat_schema.sql](chat_schema.sql)** | Chat system database schema with triggers |- **[migrate_viewer_to_customer.sql](migrate_viewer_to_customer.sql)** - Role migration script

- **Triggers**: Automatic message generation for business events (low stock, order updates)

- **Inventory Tracking**: Real-time stock monitoring with low-stock alerts and reorder levels

---

- **Order Processing**: Create and track purchase orders with status updates| **[sample_data.sql](sample_data.sql)** | Sample data for testing (DML) |

## Tech Stack

- **Analytics Dashboard**: Visualize data with advanced SQL queries and aggregations

| Layer | Technology | Version | Purpose |

|-------|------------|---------|---------|- **Audit Logging**: Complete audit trail tracking all user actions with timestamps and IP addresses| **[migrate_viewer_to_customer.sql](migrate_viewer_to_customer.sql)** | VIEWER→CUSTOMER role migration script |---

| **Backend** | Python | 3.8+ | Application logic |

| **Web Framework** | Flask | 3.0.0 | HTTP routing and templating |

| **Real-Time** | Flask-SocketIO | 5.3.6 | WebSocket communication |

| **Async Server** | gevent | 25.5.1 | WebSocket support for Python 3.12+ |### 💬 Real-Time Chat System

| **Database** | Oracle Database | 11g+ | Enterprise RDBMS |

| **DB Driver** | python-oracledb | Latest | Pure Python Oracle client |- **Instant Messaging**: WebSocket-based real-time communication using Flask-SocketIO

| **Frontend** | HTML5, CSS3, JavaScript | - | User interface |

| **Templates** | Jinja2 | - | Server-side rendering |- **Role-Based Messaging**: Hierarchical messaging based on user roles---## 🌟 Features

| **Security** | SHA-256 | - | Password hashing |

- **Broadcast Messages**: Admins/Managers can send to all users or specific roles

---

- **Automatic Notifications**: Database triggers for low stock alerts and order updates

## Installation

- **Message Types**: General, Announcements, System Alerts, Order Updates, Low Stock Alerts

### Prerequisites

- **Priority Levels**: Low, Normal, High, Urgent (with visual indicators)## 🌟 Features### Core Functionality

| Requirement | Minimum Version | Download Link |

|------------|-----------------|---------------|- **Read Receipts**: Track message read status

| Python | 3.8 | [python.org/downloads](https://www.python.org/downloads/) |

| Oracle Database | 11g XE | [oracle.com/xe-downloads](https://www.oracle.com/database/technologies/xe-downloads.html) |- **Typing Indicators**: See when users are typing- **User Authentication**: Secure login with SHA-256 password hashing and session management

| Git | Latest | [git-scm.com/downloads](https://git-scm.com/downloads) |

- **Desktop Notifications**: Browser-based notifications for new messages

### Quick Setup (5 Steps)

- **Message Filtering**: Filter by all, unread, or alerts### Core Functionality- **Role-Based Access Control**: 4 user roles with granular permissions (Admin, Manager, Warehouse, Customer)

#### Step 1: Clone Repository

```bash- **Modern UI**: Beautiful gradient design with smooth animations

git clone https://github.com/jvkousthub/Supply-Chain-Management-DBMS.git

cd "Supply Chain Management DBMS"- **User Authentication**: Secure login with SHA-256 password hashing and session management- **Supplier Management**: Track and manage supplier information with ratings

```

### Database Features

#### Step 2: Run Setup Script

```cmd- **DDL**: Table creation with constraints, foreign keys, and indexes- **Role-Based Access Control**: 4 user roles with granular permissions (Admin, Manager, Warehouse, Customer)- **Product Catalog**: Maintain product inventory with categories and pricing

setup.bat

```- **DML**: Insert, Update, Delete operations with data validation



This will:- **DQL**: Complex SELECT queries with multi-table joins- **Supplier Management**: Track and manage supplier information with ratings- **Warehouse Operations**: Manage multiple warehouse locations with capacity tracking

- Create Python virtual environment

- Install all dependencies (Flask, Flask-SocketIO, gevent, oracledb)- **DCL**: User permissions and role-based access control (GRANT, REVOKE)

- Create `.env` configuration file

- **TCL**: Transaction management (COMMIT, ROLLBACK, SAVEPOINT)- **Product Catalog**: Maintain product inventory with categories and pricing- **Inventory Tracking**: Real-time stock monitoring with low-stock alerts and reorder levels

#### Step 3: Configure Database Connection

- **Advanced SQL**: Aggregates, GROUP BY, HAVING, nested subqueries, materialized views

Edit `.env` file with your Oracle credentials:

- **Triggers**: Automatic message generation for business events (low stock, order updates)- **Warehouse Operations**: Manage multiple warehouse locations with capacity tracking- **Order Processing**: Create and track purchase orders with status updates

```properties

DB_USER=system

DB_PASSWORD=your_oracle_password

DB_DSN=localhost:1521/XE---- **Inventory Tracking**: Real-time stock monitoring with low-stock alerts and reorder levels- **Analytics Dashboard**: Visualize data with advanced SQL queries and aggregations

SECRET_KEY=change-this-to-random-secret-key

```



#### Step 4: Initialize Database## 🛠️ Tech Stack- **Order Processing**: Create and track purchase orders with status updates- **Audit Logging**: Complete audit trail tracking all user actions with timestamps and IP addresses



Connect to Oracle and run setup scripts:



```sql- **Backend**: Python 3.8+, Flask 3.0.0, Flask-SocketIO 5.3.6- **Analytics Dashboard**: Visualize data with advanced SQL queries and aggregations

sqlplus system/your_password@localhost:1521/XE

- **Real-Time**: Socket.IO, gevent 25.5.1 (WebSocket support for Python 3.12+)

SQL> @schema.sql

SQL> @sample_data.sql- **Database**: Oracle Database 11g or higher- **Audit Logging**: Complete audit trail tracking all user actions with timestamps and IP addresses### 💬 Real-Time Chat System

SQL> @add_authentication.sql

SQL> @chat_schema.sql- **Driver**: python-oracledb (pure Python implementation - no Oracle client needed!)

SQL> @migrate_viewer_to_customer.sql

SQL> @large_sample_data.sql- **Frontend**: HTML5, CSS3 with professional gradient theme, Jinja2 templates, Socket.IO Client- **Instant Messaging**: WebSocket-based real-time communication using Flask-SocketIO

SQL> exit

```- **Security**: SHA-256 password hashing, session-based authentication, CSRF protection



**Note**: Run `large_sample_data.sql` for 500+ records for better analytics and demonstration.### 💬 Real-Time Chat System- **Role-Based Messaging**: Hierarchical messaging based on user roles



#### Step 5: Start Application---



```cmd- **Instant Messaging**: WebSocket-based real-time communication using Flask-SocketIO- **Broadcast Messages**: Admins/Managers can send to all users or specific roles

run.bat

```## 📦 Installation



Or manually:- **Role-Based Messaging**: Hierarchical messaging based on user roles- **Automatic Notifications**: Database triggers for low stock alerts and order updates

```cmd

python app.py### Prerequisites

```

- **Broadcast Messages**: Admins/Managers can send to all users or specific roles- **Message Types**: General, Announcements, System Alerts, Order Updates, Low Stock Alerts

**Access the application**: Open browser at `http://localhost:5000`

- **Python 3.8 or higher** ([Download](https://www.python.org/downloads/))

### Default Login Credentials

- **Oracle Database** - XE 11g/18c/21c recommended ([Download Oracle XE](https://www.oracle.com/database/technologies/xe-downloads.html))- **Automatic Notifications**: Database triggers for low stock alerts and order updates- **Priority Levels**: Low, Normal, High, Urgent (with visual indicators)

| Username | Password | Role | Permissions |

|----------|----------|------|-------------|- **Git** ([Download](https://git-scm.com/downloads))

| admin | password123 | ADMIN | Full system access |

| manager | password123 | MANAGER | Add/Edit (no delete) |- **Message Types**: General, Announcements, System Alerts, Order Updates, Low Stock Alerts- **Read Receipts**: Track message read status

| warehouse | password123 | WAREHOUSE | Inventory only |

| customer | password123 | CUSTOMER | Read-only access |### Quick Setup (5 Steps)



---- **Priority Levels**: Low, Normal, High, Urgent (with visual indicators)- **Typing Indicators**: See when users are typing



## User Roles & Permissions#### Step 1: Clone Repository



### Role Hierarchy```bash- **Read Receipts**: Track message read status- **Desktop Notifications**: Browser-based notifications for new messages



#### 1. ADMIN (Highest Authority)git clone https://github.com/jvkousthub/Supply-Chain-Management-DBMS.git



**Capabilities:**cd "Supply Chain Management DBMS"- **Typing Indicators**: See when users are typing- **Message Filtering**: Filter by all, unread, or alerts

- Full system access including user management

- Can add, edit, and delete all records```

- Access to audit logs

- Can broadcast messages to everyone- **Desktop Notifications**: Browser-based notifications for new messages- **Modern UI**: Beautiful gradient design with smooth animations



**Suitable for**: System administrators#### Step 2: Run Setup Script



#### 2. MANAGER (Middle Management)```cmd- **Message Filtering**: Filter by all, unread, or alerts



**Capabilities:**setup.bat

- Can view all data

- Can add and edit products, suppliers, orders```- **Modern UI**: Beautiful gradient design with smooth animations### Database Features

- Can broadcast to WAREHOUSE and CUSTOMER roles

- Cannot delete records or manage usersThis will:

- Access to analytics and reports

- Create Python virtual environment- **DDL**: Table creation with constraints, foreign keys, and indexes

**Suitable for**: Supply chain managers, operations managers

- Install all dependencies (Flask, Flask-SocketIO, gevent, oracledb)

#### 3. WAREHOUSE (Operations Staff)

- Create `.env` configuration file### Database Features- **DML**: Insert, Update, Delete operations with data validation

**Capabilities:**

- Can view and update inventory quantities only

- Limited to inventory management

- Can receive messages from ADMIN and MANAGER#### Step 3: Configure Database Connection- **DDL**: Table creation with constraints, foreign keys, and indexes- **DQL**: Complex SELECT queries with multi-table joins

- Cannot add products or modify other data



**Suitable for**: Warehouse operators, stock keepers

Edit `.env` file with your Oracle credentials:- **DML**: Insert, Update, Delete operations with data validation- **DCL**: User permissions and role-based access control (GRANT, REVOKE)

#### 4. CUSTOMER (External Users/Read-Only)

```properties

**Capabilities:**

- Read-only access to all dataDB_USER=system- **DQL**: Complex SELECT queries with multi-table joins- **TCL**: Transaction management (COMMIT, ROLLBACK, SAVEPOINT)

- Can receive messages from ADMIN and MANAGER

- Cannot add, edit, or delete anythingDB_PASSWORD=your_oracle_password



**Suitable for**: External customers, vendors, auditors, partnersDB_DSN=localhost:1521/XE- **DCL**: User permissions and role-based access control (GRANT, REVOKE)- **Advanced SQL**: Aggregates, GROUP BY, HAVING, nested subqueries, materialized views



### Permissions MatrixSECRET_KEY=change-this-to-random-secret-key



| Permission | ADMIN | MANAGER | WAREHOUSE | CUSTOMER |```- **TCL**: Transaction management (COMMIT, ROLLBACK, SAVEPOINT)- **Triggers**: Automatic message generation for business events (low stock, order updates)

|-----------|-------|---------|-----------|----------|

| View Data | Yes | Yes | Yes | Yes |

| Add Records | Yes | Yes | No | No |

| Edit Records | Yes | Yes | Inventory Only | No |#### Step 4: Initialize Database- **Advanced SQL**: Aggregates, GROUP BY, HAVING, nested subqueries, materialized views

| Delete Records | Yes | No | No | No |

| Manage Users | Yes | No | No | No |

| View Audit Logs | Yes | No | No | No |

| Broadcast Messages | All Users | WAREHOUSE + CUSTOMER | No | No |Connect to Oracle and run setup scripts:- **Triggers**: Automatic message generation for business events (low stock, order updates)## 🛠️ Tech Stack

| Direct Messages | Everyone | Everyone | ADMIN + MANAGER | ADMIN + MANAGER |

```sql

### Chat System Hierarchy

sqlplus system/your_password@localhost:1521/XE

```

ADMIN (Top Authority)

  |

  |-- Can message: EveryoneSQL> @schema.sql---- **Backend**: Python 3.8+, Flask 3.0.0, Flask-SocketIO 5.3.6

  |-- Can broadcast: All users, specific roles, or individuals

  SQL> @sample_data.sql

MANAGER

  |SQL> @add_authentication.sql- **Real-Time**: Socket.IO, Eventlet (WebSocket support)

  |-- Can message: WAREHOUSE, CUSTOMER, other MANAGERs

  |-- Can broadcast: WAREHOUSE staff, CUSTOMERsSQL> @chat_schema.sql

  

WAREHOUSESQL> @migrate_viewer_to_customer.sql## 🛠️ Tech Stack- **Database**: Oracle Database 11g or higher

  |

  |-- Can message: ADMIN, MANAGERSQL> exit

  |-- Cannot broadcast

  ```- **Driver**: python-oracledb (pure Python implementation)

CUSTOMER

  |

  |-- Can message: ADMIN, MANAGER

  |-- Cannot broadcast#### Step 5: Start Application- **Backend**: Python 3.8+, Flask 3.0.0, Flask-SocketIO 5.3.6- **Frontend**: HTML5, CSS3 with professional navy blue theme, Jinja2 templates, Socket.IO Client

```

```cmd

---

run.bat- **Real-Time**: Socket.IO, gevent 25.5.1 (WebSocket support for Python 3.12+)- **Security**: SHA-256 password hashing, session-based authentication, CSRF protection

## Project Structure

```

```

Supply Chain Management DBMS/- **Database**: Oracle Database 11g or higher

│

├── Core Application Files**Access the application**: Open browser at `http://localhost:5000`

│   ├── app.py                      # Flask app with Socket.IO integration

│   ├── auth.py                     # Authentication and role decorators- **Driver**: python-oracledb (pure Python implementation)## 📦 Installation

│   ├── database.py                 # Database operations and queries

│   ├── chat_manager.py             # Chat business logic### Default Login Credentials

│   └── requirements.txt            # Python dependencies

│- **Frontend**: HTML5, CSS3 with professional gradient theme, Jinja2 templates, Socket.IO Client

├── Database Files

│   ├── schema.sql                  # Main database schema (DDL)| Username | Password | Role | Permissions |

│   ├── chat_schema.sql             # Chat system schema with triggers

│   ├── sample_data.sql             # Basic sample data (DML)|----------|----------|------|-------------|- **Security**: SHA-256 password hashing, session-based authentication, CSRF protection### Prerequisites

│   ├── large_sample_data.sql       # 500+ records for analytics (NEW!)

│   ├── add_authentication.sql      # User authentication setup| **admin** | password123 | ADMIN | Full system access |

│   ├── user_roles_dcl.sql          # Oracle DCL implementation

│   ├── dcl_permissions.sql         # Additional permissions| **manager** | password123 | MANAGER | Add/Edit (no delete) |

│   ├── tcl_examples.sql            # Transaction examples (TCL)

│   ├── advanced_queries.sql        # Complex queries| **warehouse** | password123 | WAREHOUSE | Inventory only |

│   ├── test_chat_system.sql        # Chat system verification

│   ├── chat_examples.sql           # Chat usage examples| **customer** | password123 | CUSTOMER | Read-only access |---- Python 3.8 or higher

│   └── migrate_viewer_to_customer.sql  # Role migration script

│

├── Templates

│   ├── base.html                   # Base template with navigation---- Oracle Database (XE 11g/18c/21c recommended)

│   ├── login.html                  # Login page

│   ├── index.html                  # Dashboard

│   ├── chat.html                   # Chat interface (1120+ lines)

│   ├── users.html                  # User management## 👥 User Roles & Permissions## 📦 Installation- Git

│   ├── suppliers.html              # Supplier management

│   ├── products.html               # Product catalog

│   ├── inventory.html              # Inventory tracking

│   ├── orders.html                 # Order management### Role Hierarchy

│   ├── analytics.html              # Analytics dashboard

│   └── (other templates)

│

├── Documentation#### 1. **ADMIN** (Highest Authority) 👑### Prerequisites### Setup Steps

│   ├── README.md                   # This file

│   └── ARCHITECTURE_DIAGRAMS.md    # System architecture diagrams- ✅ **Full system access** including user management

│

└── Configuration & Scripts- ✅ Can **add, edit, and delete** all records

    ├── .env                        # Environment variables

    ├── .env.example                # Environment template- ✅ Access to **audit logs**

    ├── .gitignore                  # Git ignore rules

    ├── setup.bat                   # Installation script- ✅ Can **broadcast messages to everyone**- Python 3.8 or higher1. **Clone the repository**

    ├── run.bat                     # Start script

    └── install_chat.bat            # Chat dependencies installer- 🎯 **Suitable for**: System administrators

```

- Oracle Database (XE 11g/18c/21c recommended)   ```bash

---

#### 2. **MANAGER** (Middle Management) 📊

## Chat System

- ✅ Can **view all data**- Git   git clone https://github.com/jvkousthub/Supply-Chain-Management-DBMS.git

### Features Overview

- ✅ Can **add and edit** products, suppliers, orders

#### 1. Real-time Messaging

- ✅ Can **broadcast to WAREHOUSE and CUSTOMER** roles   cd "Supply Chain Management DBMS"

| Feature | Description |

|---------|-------------|- ❌ **Cannot delete** records or manage users

| Instant Delivery | WebSocket-based real-time communication |

| Direct Messaging | 1-on-1 conversations between users |- ✅ Access to **analytics and reports**### Quick Setup   ```

| Broadcast | Send to multiple users simultaneously |

| Typing Indicators | See when users are typing |- 🎯 **Suitable for**: Supply chain managers, operations managers

| Read Receipts | Track message read status |

| Desktop Notifications | Browser-based notifications for new messages |



#### 2. Role-Based Access Control#### 3. **WAREHOUSE** (Operations Staff) 📦



| Role | Can Send To | Broadcast Capability |- ✅ Can **view and update inventory** quantities only1. **Clone the repository**2. **Run setup script**

|------|-------------|---------------------|

| ADMIN | Everyone | All users, specific roles, or individuals |- ✅ Limited to **inventory management**

| MANAGER | Warehouse, Customer, Managers | Warehouse staff, customers |

| WAREHOUSE | Admin, Managers | No broadcast |- ✅ Can **receive messages** from ADMIN and MANAGER   ```bash   ```cmd

| CUSTOMER | Admin, Managers | No broadcast |

- ❌ **Cannot add products** or modify other data

#### 3. Automatic Notifications

- 🎯 **Suitable for**: Warehouse operators, stock keepers   git clone https://github.com/jvkousthub/Supply-Chain-Management-DBMS.git   setup.bat

Database triggers automatically send messages for business events:



**Low Stock Alerts:**

```sql#### 4. **CUSTOMER** (External Users) 👀   cd "Supply Chain Management DBMS"   ```

-- Automatically triggered when inventory <= reorder_level

UPDATE inventory SET quantity = 5 WHERE inventory_id = 1;- ✅ **Read-only access** to all data

-- If quantity <= reorder_level, alert sent to all Admins & Managers

```- ✅ Can **receive messages** from ADMIN and MANAGER   ```   This installs all dependencies and creates virtual environment.



**Order Status Updates:**- ❌ **Cannot add, edit, or delete** anything

```sql

-- Automatically triggered on order status change- 🎯 **Suitable for**: External customers, vendors, auditors, partners

UPDATE orders SET status = 'SHIPPED' WHERE order_id = 123;

-- Notification sent to Admins & Managers

```

### Permissions Matrix2. **Run setup script**3. **Configure database**

#### 4. Message Types & Priorities



**Message Types:**

| Permission | ADMIN | MANAGER | WAREHOUSE | CUSTOMER |   ```cmd   

| Type | Usage | Auto-Generated |

|------|-------|----------------||-----------|-------|---------|-----------|----------|

| GENERAL | Regular chat messages | No |

| LOW_STOCK_ALERT | Inventory alerts | Yes (trigger) || 👁️ View Data | ✅ | ✅ | ✅ | ✅ |   setup.bat   Edit `.env` file with your Oracle credentials:

| ORDER_UPDATE | Order status notifications | Yes (trigger) |

| DELIVERY_NOTICE | Delivery updates | No || ➕ Add Records | ✅ | ✅ | ❌ | ❌ |

| SYSTEM_ALERT | System-wide alerts | No |

| ANNOUNCEMENT | Important announcements | No || ✏️ Edit Records | ✅ | ✅ | ✅* | ❌ |   ```   ```properties



**Priority Levels:**| 🗑️ Delete Records | ✅ | ❌ | ❌ | ❌ |



| Priority | Visual Indicator | Use Case || 👥 Manage Users | ✅ | ❌ | ❌ | ❌ |   This installs all dependencies including Flask-SocketIO and gevent.   DB_USER=system

|----------|-----------------|----------|

| LOW | Blue | Regular messages || 📋 View Audit Logs | ✅ | ❌ | ❌ | ❌ |

| NORMAL | White | Standard priority |

| HIGH | Orange border | Important messages || 📢 Broadcast Messages | All | W+C | ❌ | ❌ |   DB_PASSWORD=your_password

| URGENT | Red border + pulse | Critical alerts |



### Database Schema

*WAREHOUSE can only edit inventory levels3. **Configure database**   DB_DSN=localhost:1521/XE

**Main Tables:**



| Table | Purpose | Key Fields |

|-------|---------|------------|### Chat System Hierarchy      SECRET_KEY=your-secret-key-here

| messages | Stores all messages | message_id, sender_id, message_text, message_type, priority |

| message_recipients | Tracks message delivery | recipient_id, message_id, user_id, is_read |

| chat_rooms | Group chat rooms | room_id, room_name, created_by (future use) |

```   Create/edit `.env` file with your Oracle credentials:   ```

**Views:**

ADMIN (Top Authority)

| View | Purpose |

|------|---------|  ├── Can message: Everyone   ```properties

| user_inbox | Messages for a specific user |

| message_details | Complete message info with sender/recipient details |  └── Can broadcast: All users, specific roles, or individuals

| user_unread_count | Count of unread messages per user |

   DB_USER=system4. **Run SQL scripts**

**Triggers:**

MANAGER

| Trigger | Event | Action |

|---------|-------|--------|  ├── Can message: WAREHOUSE, CUSTOMER, other MANAGERs   DB_PASSWORD=your_password   

| trg_low_stock_alert | Inventory UPDATE | Sends alert when quantity <= reorder_level |

| trg_order_status_notification | Order status UPDATE | Sends notification on status change |  └── Can broadcast: WAREHOUSE staff, CUSTOMERs



**Indexes:**   DB_DSN=localhost:1521/XE   Connect to Oracle as system user:



- Message sender/recipient lookupsWAREHOUSE

- Timestamp-based queries

- Read status filtering  ├── Can message: ADMIN, MANAGER   SECRET_KEY=your-secret-key-here   ```sql



### Chat API Routes  └── Cannot broadcast



**REST API:**   ```   sqlplus system/your_password@localhost:1521/XE



| Method | Endpoint | Description | Authentication |CUSTOMER

|--------|----------|-------------|----------------|

| GET | /chat | Main chat interface | Required |  ├── Can message: ADMIN, MANAGER   

| GET | /api/messages | Get user messages | Required |

| POST | /api/messages/send | Send message | Required |  └── Cannot broadcast

| POST | /api/messages/<id>/read | Mark message as read | Required |

| POST | /api/messages/read-all | Mark all messages as read | Required |```4. **Initialize database**   SQL> @schema.sql

| GET | /api/users/role/<role> | Get users by role | Required |

| GET | /api/conversation/<user_id> | Get conversation with specific user | Required |



**Socket.IO Events:**---      SQL> @sample_data.sql



| Event | Direction | Purpose |

|-------|-----------|---------|

| connect | Client -> Server | Establish WebSocket connection |## 📂 Project Structure   Connect to Oracle and run setup scripts:   SQL> @add_authentication.sql

| disconnect | Client -> Server | Close WebSocket connection |

| send_message | Client -> Server | Real-time message sending |

| new_message | Server -> Client | Receive new messages |

| mark_read | Client -> Server | Mark message as read |```   ```sql   SQL> exit

| typing | Client -> Server | Send typing indicator |

| user_typing | Server -> Client | Receive typing notifications |Supply Chain Management DBMS/



### Usage Guide│   sqlplus system/your_password@localhost:1521/XE   ```



#### Sending Direct Messages:├── 📄 Core Application Files

1. Login to the system

2. Click on **Chat** in the navigation bar│   ├── app.py                      # Flask app with Socket.IO integration   

3. Select a user from the left sidebar

4. Type your message in the input field│   ├── auth.py                     # Authentication and role decorators

5. Press **Enter** or click **Send**

│   ├── database.py                 # Database operations and queries   SQL> @schema.sql5. **Setup Chat System (NEW!)**

#### Broadcasting Messages (Admin/Manager only):

1. Click **Broadcast** button in chat interface│   ├── chat_manager.py             # Chat business logic

2. Select target audience:

   - All Users│   └── requirements.txt            # Python dependencies   SQL> @sample_data.sql   ```cmd

   - Specific Role (MANAGER, WAREHOUSE, CUSTOMER)

   - Custom user selection│

3. Choose **message type** and **priority level**

4. Type message and send├── 🗄️ Database Files   SQL> @add_authentication.sql   install_chat.bat



#### Message Filtering:│   ├── schema.sql                  # Main database schema (DDL)

- **All**: View all messages

- **Unread**: View only unread messages│   ├── chat_schema.sql             # Chat system schema with triggers   SQL> @chat_schema.sql   ```

- **Alerts**: View only system alerts and notifications

│   ├── sample_data.sql             # Sample data (DML)

---

│   ├── add_authentication.sql      # User authentication setup   SQL> @migrate_viewer_to_customer.sql   

## Database Implementation

│   ├── user_roles_dcl.sql          # Oracle DCL implementation

### Schema Overview

│   ├── dcl_permissions.sql         # Additional permissions   SQL> exit   Then run in SQL:

**Main Tables (9):**

│   ├── tcl_examples.sql            # Transaction examples (TCL)

| # | Table | Records | Purpose |

|---|-------|---------|---------|│   ├── advanced_queries.sql        # Complex queries   ```   ```sql

| 1 | suppliers | 50+ | Supplier information with ratings |

| 2 | warehouses | 20+ | Warehouse locations and capacity |│   ├── test_chat_system.sql        # Chat system verification

| 3 | products | 100+ | Product catalog with categories |

| 4 | inventory | 400+ | Stock levels with reorder points |│   ├── chat_examples.sql           # Chat usage examples   SQL> @chat_schema.sql

| 5 | orders | 200+ | Purchase orders with status tracking |

| 6 | order_details | 600+ | Order line items |│   └── migrate_viewer_to_customer.sql  # Role migration script

| 7 | shipments | 150+ | Delivery tracking |

| 8 | app_users | 10+ | User accounts with roles |│5. **Start the application**   SQL> exit

| 9 | audit_log | - | Action tracking with timestamps |

├── 🎨 Templates

**Chat Tables (3):**

│   ├── base.html                   # Base template with navigation   ```cmd   ```

| # | Table | Purpose |

|---|-------|---------|│   ├── login.html                  # Login page

| 10 | messages | All chat messages |

| 11 | message_recipients | Message delivery tracking |│   ├── index.html                  # Dashboard   run.bat

| 12 | chat_rooms | Group chat rooms (future use) |

│   ├── chat.html                   # Chat interface (1120+ lines)

**Total Records:** 1500+ (when using large_sample_data.sql)

│   ├── users.html                  # User management   ```6. **Start the application**

### Views (6)

│   ├── suppliers.html              # Supplier management

| View | Purpose | Base Tables |

|------|---------|-------------|│   ├── products.html               # Product catalog      ```cmd

| low_stock_items | Products below reorder level | products, inventory |

| order_summary | Order aggregates by status | orders, order_details |│   ├── inventory.html              # Inventory tracking

| supplier_performance | Supplier ratings and order counts | suppliers, orders |

| user_inbox | User's messages | messages, message_recipients |│   ├── orders.html                 # Order management   Or manually:   run.bat

| message_details | Complete message info | messages, app_users |

| user_unread_count | Unread message count | message_recipients |│   ├── analytics.html              # Analytics dashboard



### Sequences (12)│   └── ...                         # Other templates   ```cmd   ```



| Sequence | Table | Purpose |│

|----------|-------|---------|

| supplier_seq | suppliers | Auto-increment supplier_id |├── 📚 Documentation   python app.py   

| warehouse_seq | warehouses | Auto-increment warehouse_id |

| product_seq | products | Auto-increment product_id |│   ├── README.md                   # This file

| inventory_seq | inventory | Auto-increment inventory_id |

| order_seq | orders | Auto-increment order_id |│   └── ARCHITECTURE_DIAGRAMS.md    # System architecture diagrams   ```   Or manually:

| detail_seq | order_details | Auto-increment detail_id |

| shipment_seq | shipments | Auto-increment shipment_id |│

| user_seq | app_users | Auto-increment user_id |

| log_seq | audit_log | Auto-increment log_id |└── 🔧 Configuration & Scripts   ```cmd

| message_seq | messages | Auto-increment message_id |

| recipient_seq | message_recipients | Auto-increment recipient_id |    ├── .env                        # Environment variables

| room_seq | chat_rooms | Auto-increment room_id |

    ├── .env.example                # Environment template6. **Access the application**   python app.py

### SQL Features Demonstrated

    ├── .gitignore                  # Git ignore rules

| Category | Features | Example Use Cases |

|----------|----------|-------------------|    ├── setup.bat                   # Installation script      ```

| **DDL** | CREATE TABLE, VIEW, SEQUENCE, INDEX, ALTER | Schema creation, performance optimization |

| **DML** | INSERT, UPDATE, DELETE | Data manipulation with validation |    ├── run.bat                     # Start script

| **DQL** | SELECT with JOINs | Multi-table queries, aggregations |

| **DCL** | GRANT, REVOKE, CREATE USER | User permissions, access control |    └── install_chat.bat            # Chat dependencies installer   Open browser: `http://localhost:5000`

| **TCL** | COMMIT, ROLLBACK, SAVEPOINT | Transaction management |

| **Aggregates** | COUNT, SUM, AVG, MIN, MAX | Statistical analysis, reporting |```

| **GROUP BY** | HAVING clause | Category-wise, status-wise analysis |

| **Subqueries** | Nested SELECT | Complex calculations, filtering |   7. **Open browser and login**

| **Triggers** | BEFORE/AFTER triggers | Automatic alerts, notifications |

| **Constraints** | PK, FK, CHECK, UNIQUE | Data integrity, referential integrity |---



---   **Default Login Credentials:**   



## Application Usage## 💬 Chat System



### Dashboard Features   | Username | Password | Role |   Navigate to: `http://localhost:5000`



**Components:**### Features Overview

- User information with role badge

- Quick statistics (suppliers, products, warehouses, orders)   |----------|----------|------|   

- Recent activity (latest 5 orders with status)

- Low stock alerts (products needing reorder)#### 1. **Real-time Messaging** ⚡

- Chat notifications (unread message count with badge)

- 💬 Instant message delivery using WebSockets (Flask-SocketIO)   | admin | password123 | ADMIN |   **Default credentials:**

### Module-wise Capabilities

- 👥 Direct 1-on-1 conversations

#### User Management (Admin Only)

- 📢 Broadcast messages to multiple users   | manager | password123 | MANAGER |   - Admin: `admin` / `password123`

| Action | Description | Permission |

|--------|-------------|------------|- ✍️ Typing indicators

| Create User | Add new users with role assignment | ADMIN only |

| Edit User | Update user details | ADMIN only |- ✅ Read receipts   | warehouse | password123 | WAREHOUSE |   - Manager: `manager` / `password123`

| Activate/Deactivate | Enable/disable user accounts | ADMIN only |

| View Last Login | See last login timestamps | ADMIN only |- 🔔 Desktop notifications (browser-based)

| Search & Filter | Find users by criteria | ADMIN only |

   | customer | password123 | CUSTOMER |   - Warehouse: `warehouse` / `password123`

#### Supplier Management

#### 2. **Role-Based Access Control** 🔐

| Action | Permission | Notes |

|--------|------------|-------|   - Viewer: `viewer` / `password123`

| View All | All roles | See suppliers with ratings (1-5 stars) |

| Add Supplier | ADMIN, MANAGER | Include contact information || Role | Can Send To | Broadcast Capability |

| Edit Supplier | ADMIN, MANAGER | Update supplier details |

| Delete Supplier | ADMIN only | Remove from system ||------|-------------|---------------------|---

| Track Performance | All roles | Rating and order history |

| **ADMIN** | Everyone | ✅ All users, specific roles, or individuals |

#### Product Catalog

| **MANAGER** | Warehouse, Customer, Managers | ✅ Warehouse staff, customers |## 👥 User Roles & Permissions

| Action | Permission | Notes |

|--------|------------|-------|| **WAREHOUSE** | Admin, Managers | ❌ No broadcast |

| Browse Products | All roles | Filter by category |

| Add Product | ADMIN, MANAGER | Set pricing and details || **CUSTOMER** | Admin, Managers | ❌ No broadcast |## 👥 User Roles & Permissions

| Edit Product | ADMIN, MANAGER | Update information |

| Delete Product | ADMIN only | Remove from catalog |

| Search | All roles | Find products quickly |

#### 3. **Automatic Notifications** 🤖| Role          | View All | Add Items | Edit Items | Delete Items | Update Inventory | Manage Users | Chat Access |

#### Warehouse Operations



| Action | Permission | Notes |

|--------|------------|-------|Database triggers automatically send messages for business events:### Role Hierarchy|------         |----------|-----------|------------|--------------|------------------|--------------|-------------|

| View Warehouses | All roles | See locations and capacity |

| Add Warehouse | ADMIN, MANAGER | New location setup |

| Edit Warehouse | ADMIN, MANAGER | Update details |

| Delete Warehouse | ADMIN only | Remove location |**Low Stock Alerts:**| **ADMIN**     | Yes      | Yes       | Yes        | Yes          | Yes              | Yes          | Broadcast to All |

| Track Utilization | All roles | Capacity monitoring |

```sql

#### Inventory Management

-- Automatically triggered when inventory <= reorder_level#### 1. **ADMIN** (Highest Authority)| **MANAGER**   | Yes      | Yes       | Yes        | No           | Yes              | No           | Broadcast to Staff |

| Action | Permission | Notes |

|--------|------------|-------|UPDATE inventory SET quantity = 5 WHERE inventory_id = 1;

| View Stock Levels | All roles | Monitor across warehouses |

| View Low Stock Alerts | All roles | Quantity <= reorder level |-- If quantity <= reorder_level, alert sent to all Admins & Managers- **Full system access** including user management| **WAREHOUSE** | Yes      | No        | No*        | No           | Yes*             | No           | Message Admins |

| Update Quantities | ADMIN, MANAGER, WAREHOUSE | Adjust stock levels |

| Track Updates | All roles | Last updated timestamps |```

| Receive Notifications | ADMIN, MANAGER | Automatic chat alerts |

- Can **add, edit, and delete** all records| **VIEWER**    | Yes      | No        | No         | No           | No               | No           | Message Admins |

#### Order Processing

**Order Status Updates:**

| Action | Permission | Notes |

|--------|------------|-------|```sql- Access to **audit logs**

| Create Order | ADMIN, MANAGER | Purchase order with delivery date |

| Add Products | ADMIN, MANAGER | Line items to order |-- Automatically triggered on order status change

| Update Status | ADMIN, MANAGER | PENDING -> CONFIRMED -> SHIPPED -> DELIVERED |

| View Details | All roles | Complete order information |UPDATE orders SET status = 'SHIPPED' WHERE order_id = 123;- Can **broadcast messages to everyone***WAREHOUSE role can only edit/update inventory quantities, nothing else.

| Track History | All roles | Order timeline |

| Receive Notifications | ADMIN, MANAGER | Status change alerts |-- Notification sent to Admins & Managers



#### Analytics Dashboard```- **Suitable for**: System administrators



**Available Analytics:**



| Analysis | SQL Features | Insights |#### 4. **Message Types & Priorities** 🎨### Role Descriptions

|----------|--------------|----------|

| Inventory by Category | GROUP BY | Stock distribution |

| Top Suppliers | Aggregates, ORDER BY | Best performers by value |

| Warehouse Utilization | Subqueries, Joins | Capacity usage |**Message Types:**#### 2. **MANAGER** (Middle Management)

| Reorder Requirements | HAVING clause | Products needing stock |

| Order Statistics | GROUP BY status | Processing pipeline |- 📝 **GENERAL** - Regular chat messages

| Revenue Analysis | SUM, aggregates | Financial overview |

- ⚠️ **LOW_STOCK_ALERT** - Automatic inventory alerts- Can **view all data**- **ADMIN**: Complete system control including user management, all CRUD operations, audit log access, and broadcast messaging to all users

---

- 📦 **ORDER_UPDATE** - Order status notifications

## Security Features

- 🚚 **DELIVERY_NOTICE** - Delivery updates- Can **add and edit** products, suppliers, orders- **MANAGER**: Can view all data and perform most operations except deletions and user management. Can broadcast to warehouse staff

### Authentication & Authorization

- 🔴 **SYSTEM_ALERT** - System-wide alerts

| Feature | Implementation | Purpose |

|---------|---------------|---------|- 📣 **ANNOUNCEMENT** - Important announcements- Can **broadcast to WAREHOUSE and CUSTOMER** roles- **WAREHOUSE**: Specialized role limited to viewing and updating inventory stock levels only. Can message admins/managers

| Password Hashing | SHA-256 | Secure password storage (never plain text) |

| Session Management | Flask sessions with secret key | Maintain user state |

| Role Validation | Decorator-based permission checks | Route-level access control |

| Login Required | @login_required decorator | Protect all routes except login |**Priority Levels:**- **Cannot delete** records or manage users- **VIEWER**: Read-only access across all sections for reporting and analysis purposes. Can message admins/managers



### Audit & Monitoring- 🔵 **LOW** - Regular messages



**Audit Trail Features:**- ⚪ **NORMAL** - Standard priority- Access to **analytics and reports**



| Logged Information | Data Type | Purpose |- 🟠 **HIGH** - Important (orange border)

|-------------------|-----------|---------|

| Username | VARCHAR2 | User identification |- 🔴 **URGENT** - Critical (red border with pulse animation)- **Suitable for**: Supply chain managers, operations managers### Chat Role Hierarchy

| User ID | NUMBER | Unique user identifier |

| Action | VARCHAR2 | CREATE, UPDATE, DELETE, LOGIN, LOGOUT |

| Table Name | VARCHAR2 | Affected table |

| Record ID | NUMBER | Affected record identifier |### Database Schema

| Timestamp | TIMESTAMP | Exact time of action |

| IP Address | VARCHAR2 | User's IP address |



**Additional Security:**The chat system uses **3 main tables**:#### 3. **WAREHOUSE** (Operations Staff)```



| Feature | Implementation |

|---------|---------------|

| Active Status | Deactivate users without deletion (soft delete) |1. **`messages`**: Stores all messages with content, type, priority, broadcast flag- Can **view and update inventory** quantities onlyADMIN (Top Authority)

| XSS Protection | Template escaping with Jinja2 |

| CSRF Protection | Session-based CSRF tokens |2. **`message_recipients`**: Tracks who receives each message and read status

| Input Validation | Server-side validation for all inputs |

| SQL Injection Prevention | Parameterized queries with oracledb |3. **`chat_rooms`**: For future group chat functionality- Limited to **inventory management**  ├── Can message: Everyone



---



## Testing Guide**Views:**- Can **receive messages** from ADMIN and MANAGER  └── Can broadcast: All users, specific roles, or individuals



### Role-Based Access Control Testing- `user_inbox`: Messages for a specific user



**Test Matrix:**- `message_details`: Complete message information with sender/recipient details- **Cannot add products** or modify other data



| Test Case | Admin | Manager | Warehouse | Customer |- `user_unread_count`: Count of unread messages per user

|-----------|-------|---------|-----------|----------|

| Access all modules | Pass | Pass | Pass | Pass |- **Suitable for**: Warehouse operators, stock keepersMANAGER

| Delete records | Pass | Fail | Fail | Fail |

| Manage users | Pass | Fail | Fail | Fail |**Triggers:**

| Add/Edit products | Pass | Pass | Fail | Fail |

| Update inventory | Pass | Pass | Pass | Fail |- `trg_low_stock_alert`: Automatically sends alerts when inventory ≤ reorder level  ├── Can message: WAREHOUSE, VIEWER, other MANAGERs

| Broadcast messages | All Users | W+C | Fail | Fail |

| View audit logs | Pass | Fail | Fail | Fail |- `trg_order_status_notification`: Sends notifications on order status changes



### Chat System Testing#### 4. **CUSTOMER** (External Users/Read-Only)  └── Can broadcast: WAREHOUSE staff, VIEWERs



**Database Verification:****Indexes for Performance:**



```sql- Message sender/recipient lookups- **Read-only access** to all data

-- Check tables exist

SELECT table_name FROM user_tables WHERE table_name LIKE '%MESSAGE%';- Timestamp-based queries



-- Check views- Read status filtering- Can **receive messages** from ADMIN and MANAGERWAREHOUSE

SELECT view_name FROM user_views;



-- Check triggers

SELECT trigger_name FROM user_triggers WHERE trigger_name LIKE '%TRG%';### Chat API Routes- **Cannot add, edit, or delete** anything  ├── Can message: ADMIN, MANAGER



-- Verify sequences

SELECT sequence_name FROM user_sequences;

```**REST API:**- **Suitable for**: External customers, vendors, auditors, partners  └── Cannot broadcast



**Functional Tests:**- `GET /chat` - Main chat interface



| Test | Steps | Expected Result |- `GET /api/messages` - Get user messages

|------|-------|-----------------|

| Real-Time Messaging | Open 2 browsers, login as different users, send message | Instant delivery |- `POST /api/messages/send` - Send message

| Typing Indicators | Start typing in one browser | Other browser shows "typing..." |

| Read Receipts | Read a message | Sender sees read status update |- `POST /api/messages/<id>/read` - Mark message as read### Permissions MatrixVIEWER

| Broadcast | Login as Admin, send to All Users | All users receive message |

| Low Stock Alert | UPDATE inventory SET quantity = 3 | Auto-message to ADMIN & MANAGER |- `POST /api/messages/read-all` - Mark all messages as read

| Order Notification | UPDATE orders SET status = 'SHIPPED' | Auto-message to ADMIN & MANAGER |

- `GET /api/users/role/<role>` - Get users by role  ├── Can message: ADMIN, MANAGER

---

- `GET /api/conversation/<user_id>` - Get conversation with specific user

## Troubleshooting

| Permission            | ADMIN | MANAGER | WAREHOUSE | CUSTOMER |  └── Cannot broadcast

### Database Connection Issues

**Socket.IO Events:**

**Problem:** "Database connection failed"

- `connect` / `disconnect` - Connection management|-----------------------|-------|---------|-----------|----------|```

**Solutions:**

- `send_message` - Real-time message sending

| Step | Command | Purpose |

|------|---------|---------|- `new_message` - Receive new messages| View Data             | ✅    | ✅      | ✅        | ✅       |

| 1 | `net start OracleServiceXE` | Start Oracle service |

| 2 | Check `.env` file | Verify credentials |- `mark_read` - Mark message as read

| 3 | `sqlplus system/password@localhost:1521/XE` | Test connection |

| 4 | Verify DSN format | `localhost:1521/XE` or `XEPDB1` |- `typing` - Typing indicator| Add Records           | ✅    | ✅      | ❌        | ❌       |### Security Features



### Login Issues- `user_typing` - Receive typing notifications



**Problem:** "Invalid username or password"| Edit Records          | ✅    | ✅      | ✅*       | ❌       |



**Verification Steps:**### Usage Guide



```sql| Delete Records        | ✅    | ❌      | ❌        | ❌       |- **Password Security**: SHA-256 hashing for all passwords

-- Check users exist

SELECT username, role FROM app_users;#### Sending Direct Messages:



-- Verify authentication setup1. Login to the system| Manage Users          | ✅    | ❌      | ❌        | ❌       |- **Session Management**: Secure session-based authentication

SELECT table_name FROM user_tables WHERE table_name = 'APP_USERS';

2. Click on **💬 Chat** in the navigation bar

-- Check active status

SELECT username, is_active FROM app_users;3. Select a user from the left sidebar| View Audit Logs       | ✅    | ❌      | ❌        | ❌       |- **Access Control**: Route-level permission enforcement with decorators

```

4. Type your message in the input field

### Permission Denied

5. Press **Enter** or click "**Send**"| Broadcast Messages    | All   | W+C     | ❌        | ❌       |- **Audit Trail**: Complete logging of all user actions (login, logout, create, update, delete)

**Problem:** "You don't have permission to perform this action"



**Diagnosis:**

#### Broadcasting Messages (Admin/Manager only):- **UI Protection**: Dynamic button hiding based on user permissions

```sql

-- Check user role1. Click **"📢 Broadcast"** button in chat interface

SELECT username, role, is_active FROM app_users WHERE username = 'your_username';

2. Select target audience:*WAREHOUSE can only edit inventory levels- **IP Tracking**: Records IP addresses for all actions

-- Verify role permissions in auth.py

-- ADMIN: all permissions   - **All Users**

-- MANAGER: read, create, update (no delete)

-- WAREHOUSE: read, update (inventory only)   - **Specific Role** (MANAGER, WAREHOUSE, CUSTOMER)

-- CUSTOMER: read only

```   - **Custom user selection**



### Chat Not Working3. Choose **message type** and **priority level**### Chat System Hierarchy## Project Structure



**Problem:** Chat messages not delivering in real-time4. Type message and send



**Solutions:**



| Issue | Check | Fix |#### Message Filtering:

|-------|-------|-----|

| Dependencies | `pip list \| findstr socketio` | `pip install -r requirements.txt` |- **All**: View all messages``````

| Schema | `SELECT * FROM user_tables WHERE table_name LIKE 'MESSAGE%'` | `@chat_schema.sql` |

| WebSocket | Browser console (F12) | Check for errors, refresh |- **Unread**: View only unread messages

| Firewall | Port 5000 access | Allow in firewall |

| Browser | Cache issues | Hard refresh (Ctrl+Shift+R) |- **Alerts**: View only system alerts and notificationsADMIN (Top Authority)├── app.py                      # Flask application with authentication routes



### Import Errors



**Problem:** "ModuleNotFoundError: No module named 'flask_socketio'"---  ├── Can message: Everyone├── auth.py                     # Authentication manager and role decorators



**Solution:**

```cmd

# Reinstall all dependencies## 🗄️ Database Implementation  └── Can broadcast: All users, specific roles, or individuals├── database.py                 # Database operations and queries

setup.bat



# Or manually:

pip install -r requirements.txt### Schema Overview├── requirements.txt            # Python dependencies

```



### Tables Not Found

**Main Tables (9):**MANAGER├── schema.sql                  # Database schema (DDL)

**Problem:** "ORA-00942: table or view does not exist"

1. `suppliers` - Supplier information with ratings

**Solution:**

```sql2. `warehouses` - Warehouse locations and capacity  ├── Can message: WAREHOUSE, CUSTOMER, other MANAGERs├── sample_data.sql             # Sample data (DML)

-- Run setup scripts in order

@schema.sql3. `products` - Product catalog with categories

@add_authentication.sql

@chat_schema.sql4. `inventory` - Stock levels with reorder points  └── Can broadcast: WAREHOUSE staff, CUSTOMERs├── add_authentication.sql      # User authentication setup

@large_sample_data.sql

5. `orders` - Purchase orders with status tracking

-- Verify tables exist

SELECT table_name FROM user_tables ORDER BY table_name;6. `order_details` - Order line items├── user_roles_dcl.sql          # Oracle DCL implementation

```

7. `shipments` - Delivery tracking

---

8. `app_users` - User accounts with rolesWAREHOUSE├── dcl_permissions.sql         # Additional permissions (DCL)

## Production Deployment Checklist

9. `audit_log` - Action tracking with timestamps

### Security Configuration

  ├── Can message: ADMIN, MANAGER├── tcl_examples.sql            # Transaction examples (TCL)

| Task | Status | Command/Action |

|------|--------|----------------|**Chat Tables (3):**

| Change default passwords | [ ] | Update all demo account passwords |

| Generate strong SECRET_KEY | [ ] | `import secrets; print(secrets.token_hex(32))` |10. `messages` - All chat messages  └── Cannot broadcast├── advanced_queries.sql        # Complex queries and analytics

| Set FLASK_ENV=production | [ ] | Update `.env` file |

| Enable HTTPS | [ ] | SSL certificate configuration |11. `message_recipients` - Message delivery tracking

| Password complexity | [ ] | Implement validation rules |

| Session timeouts | [ ] | Add timeout configuration |12. `chat_rooms` - Group chat rooms (for future use)

| Rate limiting | [ ] | Configure API rate limits |

| Disable debug mode | [ ] | Set `debug=False` in app.py |

| Review DCL permissions | [ ] | Audit database user permissions |

### Views (6)CUSTOMER├── templates/                  # HTML templates- View low-stock alerts

### Database Configuration



| Task | Status | Notes |

|------|--------|-------|- `low_stock_items` - Products below reorder level  ├── Can message: ADMIN, MANAGER

| Create production DB user | [ ] | Don't use 'system' account |

| Setup backups | [ ] | Regular scheduled backups |- `order_summary` - Order aggregates by status

| Configure connection pooling | [ ] | Optimize for production load |

| Optimize indexes | [ ] | Based on query patterns |- `supplier_performance` - Supplier ratings and order counts  └── Cannot broadcast│   ├── base.html              # Base template with navbar- Update quantities

| Archive audit logs | [ ] | Regular log rotation |

- `user_inbox` - User's messages

### Server Configuration

- `message_details` - Complete message info```

| Task | Status | Command |

|------|--------|---------|- `user_unread_count` - Unread message count

| Production WSGI server | [ ] | `pip install waitress` then `waitress-serve --port=5000 app:app` |

| Reverse proxy | [ ] | Configure nginx/Apache |│   ├── login.html             # Login page- Track last updated timestamps

| Firewall rules | [ ] | Allow only necessary ports |

| Application logging | [ ] | Configure logging to files |### Sequences (12)

| Monitoring & alerts | [ ] | Setup monitoring solution |

---

### Environment Variables (Production)

Auto-increment IDs for all tables:

```properties

# .env (PRODUCTION)- `supplier_seq`, `product_seq`, `warehouse_seq`, `inventory_seq`│   ├── users.html             # User management (admin)

FLASK_ENV=production

DB_USER=scm_prod_user- `order_seq`, `detail_seq`, `shipment_seq`

DB_PASSWORD=<strong-secure-password>

DB_DSN=<production-db-host>:1521/ORCL- `user_seq`, `log_seq`## 📂 Project Structure

SECRET_KEY=<generated-256-bit-key>

SESSION_TIMEOUT=3600- `message_seq`, `recipient_seq`, `room_seq`

MAX_CONTENT_LENGTH=16777216

```│   ├── index.html             # Dashboard### Order Processing



---### SQL Features Demonstrated



## Sample Data Summary```



### Basic Sample Data (sample_data.sql)| Feature | Description | Example |



| Table | Records | Purpose ||---------|-------------|---------|Supply Chain Management DBMS/│   └── ...                    # Other templates- Create new orders

|-------|---------|---------|

| suppliers | 5 | Basic supplier data || **DDL** | CREATE TABLE, VIEW, SEQUENCE, INDEX, ALTER | Table creation with constraints |

| warehouses | 3 | Main warehouse locations |

| products | 10 | Sample products || **DML** | INSERT, UPDATE, DELETE | Data manipulation with validation |│

| inventory | 15 | Basic stock levels |

| orders | 5 | Sample orders || **DQL** | SELECT with JOINs | Complex multi-table queries |

| order_details | 10 | Order line items |

| app_users | 4 | Default user accounts || **DCL** | GRANT, REVOKE | User permissions |├── 📄 Core Application Files├── .env                        # Environment variables (create this)- Add products to orders



**Use for:** Quick testing, basic demonstration| **TCL** | COMMIT, ROLLBACK, SAVEPOINT | Transaction management |



### Large Sample Data (large_sample_data.sql)| **Aggregates** | COUNT, SUM, AVG, MIN, MAX | Statistical analysis |│   ├── app.py                      # Flask app with Socket.IO integration



| Table | Records | Purpose || **GROUP BY** | HAVING clause | Category-wise analysis |

|-------|---------|---------|

| suppliers | 50 | Global suppliers from different countries || **Subqueries** | Nested SELECT | Complex calculations |│   ├── auth.py                     # Authentication and role decorators├── .gitignore                  # Git ignore rules- Update order status (PENDING → CONFIRMED → SHIPPED → DELIVERED)

| warehouses | 20 | Worldwide distribution centers |

| products | 100 | Diverse product catalog (5 categories) || **Triggers** | Automatic actions | Low stock alerts, order notifications |

| inventory | 400+ | Stock across multiple warehouses |

| orders | 200 | 6 months of order history || **Constraints** | PK, FK, CHECK, UNIQUE | Data integrity |│   ├── database.py                 # Database operations and queries

| order_details | 600+ | Detailed order line items |

| shipments | 150+ | Delivery tracking records |



**Total Records:** 1500+---│   ├── chat_manager.py             # Chat business logic├── setup.bat                   # Installation script- View order details and history



**Use for:** Analytics, presentations, comprehensive testing



**Benefits:**## 🚀 Application Usage│   └── requirements.txt            # Python dependencies

- Realistic data distribution across categories

- Proper foreign key relationships

- Varied order statuses (PENDING, CONFIRMED, SHIPPED, DELIVERED)

- Multiple carriers and tracking numbers### Dashboard Features│└── run.bat                     # Start script

- Date ranges for temporal analysis

- Sufficient data for meaningful GROUP BY and aggregate queries- **User Information**: Display logged-in user with role badge



---- **Quick Stats**: Total suppliers, products, warehouses, orders├── 🗄️ Database Files



## License- **Recent Activity**: Latest 5 orders with status



This project is developed for **educational purposes** as a **Database Management Systems (DBMS) coursework demonstration**.- **Low Stock Alerts**: Products needing reorder│   ├── schema.sql                  # Main database schema (DDL)```### Analytics



Feel free to use this project for learning, but please provide attribution if you use it in your own projects.- **Chat Notifications**: Unread message count with badge



---│   ├── chat_schema.sql             # Chat system schema with triggers



## Author### Module-wise Capabilities



**Created by:** [jvkousthub](https://github.com/jvkousthub)│   ├── sample_data.sql             # Sample data (DML)- Inventory by category (GROUP BY)



**Project Type:** Database Management Systems (DBMS) Academic Project#### 👥 User Management (Admin Only)



### Demonstrates:- ➕ Create new users with role assignment│   ├── add_authentication.sql      # User authentication setup

- Oracle SQL integration with Python Flask

- Complete DBMS features (DDL, DML, DQL, DCL, TCL)- ✏️ Edit user details

- Enterprise-grade authentication and authorization

- Real-time WebSocket communication (Socket.IO)- 🔄 Activate/Deactivate users│   ├── user_roles_dcl.sql          # Oracle DCL implementation## Database Schema- Top suppliers by order value (aggregates)

- Role-based access control with 4-tier hierarchy

- Database triggers for automatic notifications- 📊 View last login timestamps

- Modern web application architecture

- 🔍 Search and filter users│   ├── dcl_permissions.sql         # Additional permissions

---



## Project Highlights for DBMS Presentation

#### 🏪 Supplier Management│   ├── tcl_examples.sql            # Transaction examples (TCL)- Warehouse utilization (subqueries)

### 1. Complete DBMS Coverage

- 📋 View all suppliers with ratings (1-5 stars)

| SQL Category | Features Demonstrated | Count |

|--------------|----------------------|-------|- ➕ Add new suppliers with contact info│   ├── advanced_queries.sql        # Complex queries

| DDL | Tables, Views, Sequences, Indexes | 12 tables, 6 views, 12 sequences |

| DML | INSERT, UPDATE, DELETE | 1500+ records |- ✏️ Update supplier details (Admin, Manager)

| DQL | SELECT with JOINs, Aggregates | 20+ queries |

| DCL | CREATE USER, GRANT, REVOKE | 4 roles, multiple permissions |- 🗑️ Delete suppliers (Admin only)│   └── migrate_viewer_to_customer.sql  # Role migration script### Main Tables- Products needing reorder (HAVING clause)

| TCL | COMMIT, ROLLBACK, SAVEPOINT | Transaction examples |

| Advanced | Triggers, Subqueries, HAVING | 2 triggers, complex analytics |- 📈 Performance tracking



### 2. Real-World Application│



**Solves actual supply chain management problems:**#### 📦 Product Catalog

- Inventory tracking across multiple warehouses

- Supplier relationship management- 📋 Browse products by category├── 🎨 Templates1. **suppliers** - Supplier information with ratings

- Order processing workflow

- Real-time communication for business operations- ➕ Add new products with pricing

- Automated notifications for critical events

- ✏️ Update product information│   ├── base.html                   # Base template with navigation

### 3. Technical Excellence

- 🗑️ Remove products (Admin only)

| Aspect | Implementation |

|--------|---------------|- 🔍 Search products│   ├── login.html                  # Login page2. **warehouses** - Warehouse locations and capacity## SQL Features Demonstrated

| Backend | Python Flask with MVC architecture |

| Database | Oracle Database with proper normalization |

| Real-Time | WebSocket with Socket.IO |

| Security | SHA-256 hashing, role-based access, audit logging |#### 🏭 Warehouse Operations│   ├── index.html                  # Dashboard

| Frontend | Responsive design with Jinja2 templates |

| Documentation | Comprehensive README + architecture diagrams |- 📍 Manage multiple warehouse locations



### 4. Easy to Demonstrate- 📊 Track capacity utilization│   ├── chat.html                   # Chat interface (1120+ lines)3. **products** - Product catalog with categories



**Setup Time:** 10 minutes (automated with setup.bat)- ➕ Add new warehouses



**Demo Flow:**- ✏️ Update warehouse details│   ├── users.html                  # User management

1. Show different user roles and permissions

2. Demonstrate CRUD operations- 📈 Inventory distribution

3. Show real-time chat with automatic notifications

4. Display analytics dashboard with complex queries│   ├── suppliers.html              # Supplier management4. **inventory** - Stock levels with reorder points- **Joins**: INNER, LEFT, RIGHT

5. Show audit logging

6. Demonstrate database triggers#### 📊 Inventory Management



**Key Selling Points:**- 👁️ Monitor stock levels across warehouses│   ├── products.html               # Product catalog

- 1500+ sample records for meaningful analytics

- Real-time features (chat, notifications)- ⚠️ View low-stock alerts (quantity ≤ reorder level)

- Professional UI with role-based access

- Complete SQL feature coverage- ✏️ Update quantities (Admin, Manager, Warehouse)│   ├── inventory.html              # Inventory tracking5. **orders** - Purchase orders with status tracking- **Aggregates**: COUNT, SUM, AVG, MIN, MAX

- Production-ready architecture

- 📅 Track last updated timestamps

---

- 🔔 Automatic notifications via chat│   ├── orders.html                 # Order management

## Quick Links



- **[View Architecture Diagrams](ARCHITECTURE_DIAGRAMS.md)** - System design and flow charts

- **[Database Schema](schema.sql)** - Main table definitions#### 🛒 Order Processing│   ├── analytics.html              # Analytics dashboard6. **order_details** - Order line items- **Group By & Having**: Category analysis

- **[Chat Schema](chat_schema.sql)** - Chat system tables and triggers

- **[Basic Sample Data](sample_data.sql)** - Quick setup data- ➕ Create new purchase orders

- **[Large Sample Data](large_sample_data.sql)** - 500+ records for analytics

- **[Migration Script](migrate_viewer_to_customer.sql)** - Role update SQL- 📦 Add products to orders│   └── ...                         # Other templates



---- 🔄 Update order status:



**If this project helped you with your DBMS course, please star the repository!**  - PENDING → CONFIRMED → SHIPPED → DELIVERED│7. **shipments** - Delivery tracking- **Subqueries**: Nested SELECT statements



**Built with dedication for Database Management Systems coursework**- 📋 View complete order details


- 📜 Order history tracking├── 📚 Documentation

- 🔔 Status change notifications

│   ├── README.md                   # This file8. **app_users** - User accounts with roles- **Views**: Reusable query abstractions

#### 📈 Analytics Dashboard

- 📊 Inventory by category (GROUP BY)│   └── ARCHITECTURE_DIAGRAMS.md    # System architecture diagrams

- 🏆 Top suppliers by order value (aggregates)

- 🏭 Warehouse utilization (subqueries)│9. **audit_log** - Action tracking with timestamps- **Indexes**: Performance optimization

- ⚠️ Products needing reorder (HAVING clause)

- 📉 Order statistics by status└── 🔧 Configuration

- 💰 Revenue analysis

    ├── .env                        # Environment variables- **Sequences**: Auto-increment IDs

---

    ├── .gitignore                  # Git ignore rules

## 🔒 Security Features

    ├── setup.bat                   # Installation script### Views- **Constraints**: PRIMARY KEY, FOREIGN KEY, CHECK

### Authentication & Authorization

1. **Password Hashing**: All passwords stored as SHA-256 hashes (never plain text)    └── run.bat                     # Start script

2. **Session Management**: Secure Flask sessions with secret key

3. **Role Validation**: Decorator-based permission checks on every route```- **low_stock_items** - Products below reorder level

4. **Login Required**: All routes protected except login page



### Audit & Monitoring

5. **Audit Trail**: Complete log of all user actions with:---- **order_summary** - Order aggregates by status## Development

   - Username and user ID

   - Action performed (CREATE, UPDATE, DELETE, LOGIN, LOGOUT)

   - Affected table name

   - Affected record ID## 💬 Chat System- **supplier_performance** - Supplier ratings and order counts

   - Timestamp (accurate to seconds)

   - IP address of the user

6. **Active Status**: Deactivate users without deletion (soft delete)

### Features### Running in Debug Mode

### Data Protection

7. **XSS Protection**: Template escaping with Jinja2

8. **CSRF Protection**: Session-based CSRF tokens

9. **Input Validation**: Server-side validation for all inputs#### 1. **Real-time Messaging**### SequencesFlask debug mode is enabled by default in `app.py`:

10. **SQL Injection Prevention**: Parameterized queries with oracledb

- ⚡ Instant message delivery using WebSockets (Flask-SocketIO)

---

- 💬 Direct 1-on-1 conversations- `supplier_seq`, `product_seq`, `warehouse_seq`, `inventory_seq````python

## 🧪 Testing Guide

- 📢 Broadcast messages to multiple users

### Test Role-Based Access Control

- ✍️ Typing indicators- `order_seq`, `detail_seq`, `shipment_seq`app.run(debug=True, port=5000)

Login with different accounts to verify permissions:

- ✅ Read receipts

1. **Admin Test** (`admin/password123`):

   - ✅ Can access all modules- 🔔 Desktop notifications (browser-based)- `user_seq`, `log_seq````

   - ✅ Can delete records

   - ✅ Can manage users

   - ✅ Can broadcast to everyone

   - ✅ Can view audit logs#### 2. **Role-Based Access Control**



2. **Manager Test** (`manager/password123`):

   - ✅ Can view all data

   - ✅ Can add/edit products, suppliers, orders| Role | Can Send To | Broadcast |## Usage### Environment Variables

   - ✅ Can broadcast to WAREHOUSE and CUSTOMER

   - ❌ Cannot delete records|------|-------------|-----------|

   - ❌ Cannot manage users

| **ADMIN** | Everyone | ✅ All users, specific roles, or individuals |- `DB_USER`: Oracle username

3. **Warehouse Test** (`warehouse/password123`):

   - ✅ Can view inventory| **MANAGER** | Warehouse, Customer, Managers | ✅ Warehouse staff, customers |

   - ✅ Can update stock quantities

   - ✅ Can message admins/managers| **WAREHOUSE** | Admin, Managers | ❌ No broadcast |### Authentication- `DB_PASSWORD`: Oracle password

   - ❌ Cannot add products

   - ❌ Cannot broadcast| **CUSTOMER** | Admin, Managers | ❌ No broadcast |



4. **Customer Test** (`customer/password123`):- All routes require login (except `/login`)- `DB_DSN`: Database connection string

   - ✅ Can view all data (read-only)

   - ✅ Can receive messages#### 3. **Automatic Notifications** 🤖

   - ❌ Cannot modify anything

   - ❌ Cannot broadcast- Sessions persist until logout- `SECRET_KEY`: Flask session secret



### Test Chat SystemDatabase triggers automatically send messages for:



1. **Verify Database Setup**:- Automatic last login tracking- `FLASK_ENV`: development/production

```sql

-- Check tables exist**Low Stock Alerts:**

SELECT table_name FROM user_tables WHERE table_name LIKE '%MESSAGE%';

```sql

-- Check views

SELECT view_name FROM user_views;-- Automatically triggered when inventory <= reorder_level



-- Check triggersUPDATE inventory SET quantity = 5 WHERE inventory_id = 1;### Managing Users (Admin Only)## Troubleshooting

SELECT trigger_name FROM user_triggers WHERE trigger_name LIKE '%TRG%';

```-- If reorder_level >= 5, alert sent to all Admins & Managers



2. **Test Real-Time Messaging**:```- Create new users with assigned roles

   - Open two browsers (or incognito + normal)

   - Login as different users

   - Send messages and verify instant delivery

   - Check typing indicators work**Order Status Updates:**- Activate/deactivate user accounts### Database Connection Failed

   - Verify read receipts update

```sql

3. **Test Broadcast**:

   - Login as Admin-- Automatically triggered on order status change- View user activity and last login1. Verify Oracle service is running

   - Click "📢 Broadcast"

   - Select "All Users"UPDATE orders SET status = 'SHIPPED' WHERE order_id = 123;

   - Send message

   - Verify all users receive it-- Notification sent to Admins & Managers2. Check credentials in `.env`



4. **Test Automatic Notifications**:```

```sql

-- Trigger low stock alert### Managing Suppliers3. Test connection with SQL*Plus:

UPDATE inventory SET quantity = 3 WHERE product_id = 1;

-- Check if admins/managers received alert in chat#### 4. **Message Types & Priorities**



-- Trigger order notification- View all suppliers with ratings   ```

UPDATE orders SET status = 'SHIPPED' WHERE order_id = 1;

-- Check if admins/managers received notification**Message Types:**

```

- 📝 GENERAL - Regular messages- Add new suppliers with contact information   sqlplus username/password@localhost:1521/XEPDB1

---

- ⚠️ LOW_STOCK_ALERT - Inventory alerts

## 🐛 Troubleshooting

- 📦 ORDER_UPDATE - Order notifications- Update supplier details   ```

### Database Connection Issues

- 🚚 DELIVERY_NOTICE - Delivery updates

**Problem**: "Database connection failed"

- 🔴 SYSTEM_ALERT - System-wide alerts- Delete suppliers (Admin only)

**Solution**:

1. Verify Oracle service is running:- 📣 ANNOUNCEMENT - Important announcements

   ```cmd

   net start OracleServiceXE### Import Errors

   ```

2. Check credentials in `.env` file**Priority Levels:**

3. Test connection with SQL*Plus:

   ```cmd- 🔵 LOW - Regular messages### Inventory ManagementRun setup again:

   sqlplus system/password@localhost:1521/XE

   ```- ⚪ NORMAL - Standard priority

4. Verify DSN format: `localhost:1521/XE` (or `XEPDB1` for newer versions)

- 🟠 HIGH - Important (orange border)- Monitor stock levels across all warehouses```cmd

### Login Issues

- 🔴 URGENT - Critical (red border with pulse animation)

**Problem**: "Invalid username or password"

- View low-stock alertssetup.bat

**Solutions**:

- Verify `add_authentication.sql` was executed### Database Schema

- Check default credentials:

  ```sql- Update quantities (Admin, Manager, Warehouse)```

  SELECT username, role FROM app_users;

  ```The chat system uses 3 main tables:

- Ensure `app_users` table exists and has data

- Clear browser cookies and try again- Track last updated timestamps



### Permission Denied1. **`messages`**: Stores all messages with content, type, priority, broadcast flag



**Problem**: "You don't have permission to perform this action"2. **`message_recipients`**: Tracks who receives each message and read status### Tables Not Found



**Solutions**:3. **`chat_rooms`**: For future group chat functionality

- Check user's role in database:

  ```sql### Order ProcessingRun the schema creation:

  SELECT username, role, is_active FROM app_users WHERE username = 'your_username';

  ```**Views:**

- Verify user is active (`is_active = 1`)

- Logout and login again- `user_inbox`: Messages for a specific user- Create new orders with delivery dates```sql

- Check if session expired

- `message_details`: Complete message information with sender/recipient details

### Chat Not Working

- `user_unread_count`: Count of unread messages per user- Add products to orders@schema.sql

**Problem**: Chat messages not delivering in real-time



**Solutions**:

1. Verify dependencies are installed:**Triggers:**- Update order status: PENDING → CONFIRMED → SHIPPED → DELIVERED```

   ```cmd

   pip list | findstr socketio- `trg_low_stock_alert`: Automatically sends alerts when inventory ≤ reorder level

   pip list | findstr gevent

   ```- `trg_order_status_notification`: Sends notifications on order status changes- View complete order details and history

2. Check chat schema exists:

   ```sql

   SELECT table_name FROM user_tables WHERE table_name LIKE 'MESSAGE%';

   ```**Indexes for Performance:**## License

3. Check browser console for WebSocket errors (F12)

4. Ensure firewall allows port 5000- Message sender/recipient lookups

5. Try hard refresh (Ctrl+Shift+R)

- Timestamp-based queries### Analytics

### Import Errors

- Read status filtering

**Problem**: "ModuleNotFoundError: No module named 'flask_socketio'"

- Inventory by category (GROUP BY)This project is for educational purposes.

**Solution**:

```cmd### Chat API Routes

# Reinstall all dependencies

setup.bat- Top suppliers by order value (aggregates)



# Or manually:**REST API:**

pip install -r requirements.txt

```- `GET /chat` - Main chat interface- Warehouse utilization (subqueries)## Author



### Tables Not Found- `GET /api/messages` - Get user messages



**Problem**: "ORA-00942: table or view does not exist"- `POST /api/messages/send` - Send message- Products needing reorder (HAVING clause)



**Solution**:- `POST /api/messages/<id>/read` - Mark message as read

```sql

-- Run setup scripts in order- `POST /api/messages/read-all` - Mark all messages as read- Order statistics by statusCreated as a Database Management Systems (DBMS) project demonstrating Oracle SQL and Flask integration.

@schema.sql

@add_authentication.sql- `GET /api/users/role/<role>` - Get users by role

@chat_schema.sql

- `GET /api/conversation/<user_id>` - Get conversation with specific user

-- Verify tables exist

SELECT table_name FROM user_tables;## Oracle DCL Implementation

```

**Socket.IO Events:**

### Gevent Issues (Python 3.12+)

- `connect` / `disconnect` - Connection managementThe system demonstrates comprehensive Oracle DCL features:

**Problem**: "eventlet doesn't support Python 3.12"

- `send_message` - Real-time message sending

**Solution**:

Already fixed! Using `gevent` instead of `eventlet` in `requirements.txt`- `new_message` - Receive new messages### User Creation

```cmd

pip uninstall eventlet -y- `mark_read` - Mark message as read```sql

pip install gevent==25.5.1

```- `typing` - Typing indicatorCREATE USER scm_admin IDENTIFIED BY Admin@123;



---- `user_typing` - Receive typing notificationsCREATE USER scm_manager IDENTIFIED BY Manager@123;



## 🚀 Production Deployment ChecklistCREATE USER scm_warehouse IDENTIFIED BY Warehouse@123;



### Security### Usage GuideCREATE USER scm_viewer IDENTIFIED BY Viewer@123;



- [ ] Change all default passwords```

- [ ] Generate strong `SECRET_KEY` (256-bit random):

  ```python#### Sending Direct Messages:

  import secrets

  print(secrets.token_hex(32))1. Login to the system### Grant Permissions

  ```

- [ ] Set `FLASK_ENV=production` in `.env`2. Click on 💬 **Chat** in the navigation bar```sql

- [ ] Enable HTTPS with SSL certificate

- [ ] Implement password complexity requirements3. Select a user from the left sidebar-- Admin gets full access

- [ ] Add session timeouts (default: unlimited)

- [ ] Configure rate limiting for API endpoints4. Type your message in the input fieldGRANT CONNECT, RESOURCE TO scm_admin;

- [ ] Disable Flask debug mode (`debug=False` in `app.py`)

- [ ] Review and restrict DCL permissions5. Press Enter or click "Send"



### Database-- Manager gets selective permissions



- [ ] Create production database user (not system)#### Broadcasting Messages (Admin/Manager only):GRANT SELECT, INSERT, UPDATE ON suppliers TO scm_manager;

- [ ] Set up regular database backups

- [ ] Configure connection pooling1. Click **"📢 Broadcast"** button in chat interface

- [ ] Optimize indexes for production data volume

- [ ] Review and archive audit logs regularly2. Select target audience:-- Warehouse limited to inventory



### Server Configuration   - All UsersGRANT SELECT, UPDATE ON inventory TO scm_warehouse;



- [ ] Use production WSGI server (gunicorn/waitress):   - Specific Role (MANAGER, WAREHOUSE, CUSTOMER)

  ```cmd

  pip install waitress   - Custom user selection-- Viewer read-only

  waitress-serve --port=5000 app:app

  ```3. Choose message type and priority levelGRANT SELECT ON all_tables TO scm_viewer;

- [ ] Set up reverse proxy (nginx/Apache)

- [ ] Configure firewall rules4. Type message and send```

- [ ] Enable application logging

- [ ] Set up monitoring and alerts



### Environment Variables (Production)#### Message Filtering:### Revoke Permissions



```properties- **All**: View all messages```sql

# .env (PRODUCTION)

FLASK_ENV=production- **Unread**: View only unread messagesREVOKE DELETE ON suppliers FROM scm_manager;

DB_USER=scm_prod_user

DB_PASSWORD=<strong-secure-password>- **Alerts**: View only system alerts and notificationsREVOKE INSERT ON products FROM scm_warehouse;

DB_DSN=<production-db-host>:1521/ORCL

SECRET_KEY=<generated-256-bit-key>```

SESSION_TIMEOUT=3600

MAX_CONTENT_LENGTH=16777216---

```

## SQL Features Demonstrated

---

## 🗄️ Database Features

## 📄 License

- **DDL**: CREATE TABLE, CREATE VIEW, CREATE SEQUENCE, CREATE INDEX, ALTER TABLE

This project is developed for **educational purposes** as a **Database Management Systems (DBMS) coursework demonstration**.

### Schema Overview- **DML**: INSERT, UPDATE, DELETE with constraints

Feel free to use this project for learning, but please provide attribution if you use it in your own projects.

- **DQL**: Complex SELECT with JOINs (INNER, LEFT, RIGHT)

---

**Main Tables:**- **DCL**: CREATE USER, GRANT, REVOKE permissions

## 👨‍💻 Author

1. `suppliers` - Supplier information with ratings- **TCL**: COMMIT, ROLLBACK, SAVEPOINT

**Created by**: [jvkousthub](https://github.com/jvkousthub)

2. `warehouses` - Warehouse locations and capacity- **Aggregates**: COUNT, SUM, AVG, MIN, MAX

**Project Type**: Database Management Systems (DBMS) Academic Project

3. `products` - Product catalog with categories- **Group By & Having**: Category and status analysis

**Demonstrates**:

- ✅ Oracle SQL integration with Python Flask4. `inventory` - Stock levels with reorder points- **Subqueries**: Nested SELECT for complex calculations

- ✅ Complete DBMS features (DDL, DML, DQL, DCL, TCL)

- ✅ Enterprise-grade authentication and authorization5. `orders` - Purchase orders with status tracking- **Views**: Reusable query abstractions

- ✅ Real-time WebSocket communication (Socket.IO)

- ✅ Role-based access control with 4-tier hierarchy6. `order_details` - Order line items- **Indexes**: Performance optimization

- ✅ Database triggers for automatic notifications

- ✅ Modern web application architecture7. `shipments` - Delivery tracking- **Sequences**: Auto-increment primary keys



---8. `app_users` - User accounts with roles- **Constraints**: PRIMARY KEY, FOREIGN KEY, CHECK, UNIQUE



## 📸 Application Screenshots9. `audit_log` - Action tracking with timestamps



### Login Page## Security Features

- Role-based authentication

- Default credentials for testing**Chat Tables:**

- Secure password hashing

10. `messages` - All chat messages1. **Password Hashing**: All passwords stored as SHA-256 hashes

### Dashboard

- User information with role badge11. `message_recipients` - Message delivery tracking2. **Session Management**: Secure Flask sessions with secret key

- Quick statistics

- Recent orders12. `chat_rooms` - Group chat rooms3. **Role Validation**: Decorator-based permission checks on every route

- Low stock alerts

- Unread message notifications4. **Audit Trail**: Complete log of all user actions with IP addresses



### User Management (Admin)### Views5. **Active Status**: Ability to deactivate users without deletion

- Create/edit/deactivate users

- Role assignment6. **Protected Routes**: Login required for all operations

- Last login tracking

- `low_stock_items` - Products below reorder level

### Inventory Management

- Stock level monitoring- `order_summary` - Order aggregates by status## Development

- Low stock alerts

- Update quantities (role-based)- `supplier_performance` - Supplier ratings and order counts

- Warehouse distribution

- `user_inbox` - User's messages### Running in Debug Mode

### Real-Time Chat

- 3-column layout (users, chat, messages)- `message_details` - Complete message info```python

- Direct messaging

- Broadcast capabilities- `user_unread_count` - Unread message count# app.py

- Message filtering

- Typing indicatorsif __name__ == '__main__':

- Read receipts

- Priority-based visual indicators### Sequences    app.run(debug=True, port=5000)



### Analytics Dashboard```

- Inventory by category charts

- Supplier performance metricsAuto-increment IDs for all tables:

- Warehouse utilization

- Order statistics- `supplier_seq`, `product_seq`, `warehouse_seq`, `inventory_seq`### Environment Variables



---- `order_seq`, `detail_seq`, `shipment_seq`- `DB_USER`: Oracle username (e.g., system)



## ⭐ Key Project Highlights- `user_seq`, `log_seq`- `DB_PASSWORD`: Oracle password



### Technical Excellence- `message_seq`, `recipient_seq`, `room_seq`- `DB_DSN`: Database connection string (e.g., localhost:1521/XE)

✅ **Complete DBMS Implementation** - All SQL features (DDL, DML, DQL, DCL, TCL)  

✅ **Oracle Database** - Enterprise-grade RDBMS with 12 tables  - `SECRET_KEY`: Flask session secret (change in production!)

✅ **Python Flask** - Modern web framework with 15+ routes  

✅ **Real-Time Communication** - WebSocket-based chat with Socket.IO  ### SQL Features Demonstrated- `FLASK_ENV`: development or production

✅ **Role-Based Security** - 4-tier hierarchical access control  

✅ **Database Triggers** - Automatic business event notifications  

✅ **Comprehensive Documentation** - README, architecture diagrams, code comments  

- **DDL**: CREATE TABLE, CREATE VIEW, CREATE SEQUENCE, CREATE INDEX, ALTER TABLE### Adding New Users

### Educational Value

📚 **Demonstrates Oracle SQL Mastery**:- **DML**: INSERT, UPDATE, DELETE with constraintsLogin as admin and navigate to **Users** → **Add New User**

- Complex joins (INNER, LEFT, RIGHT)

- Aggregation functions (COUNT, SUM, AVG, MIN, MAX)- **DQL**: Complex SELECT with JOINs (INNER, LEFT, RIGHT)

- Subqueries and nested SELECT

- Views for data abstraction- **DCL**: CREATE USER, GRANT, REVOKE permissions### Changing Passwords

- Triggers for automatic actions

- Sequences for auto-increment- **TCL**: COMMIT, ROLLBACK, SAVEPOINT```python

- Constraints (PK, FK, CHECK, UNIQUE)

- **Aggregates**: COUNT, SUM, AVG, MIN, MAXimport hashlib

📚 **Full-Stack Web Development**:

- MVC architecture pattern- **Group By & Having**: Category and status analysisnew_password = "your_new_password"

- RESTful API design

- WebSocket real-time communication- **Subqueries**: Nested SELECT for complex calculationshashed = hashlib.sha256(new_password.encode()).hexdigest()

- Session-based authentication

- Template rendering with Jinja2- **Triggers**: Automatic actions on data changes# Update in database: UPDATE app_users SET password = 'hash' WHERE username = 'user';

- Responsive CSS design

- **Constraints**: PRIMARY KEY, FOREIGN KEY, CHECK, UNIQUE```

📚 **Software Engineering Best Practices**:

- Clean code structure

- Comprehensive error handling

- Security-first approach---## Troubleshooting

- Audit logging

- Modular design

- Version control with Git

## 🚀 Usage### Database Connection Failed

---

1. Verify Oracle service is running:

## 🎓 Perfect for DBMS Project Presentation

### Authentication   ```cmd

This project is **ideal for academic presentations** because it demonstrates:

- All routes require login (except `/login`)   net start OracleServiceXE

### 1. Complete DBMS Coverage ✅

- **DDL**: 12 tables with proper constraints- Sessions persist until logout   ```

- **DML**: INSERT, UPDATE, DELETE operations

- **DQL**: 20+ complex SELECT queries- Automatic last login tracking2. Check credentials in `.env`

- **DCL**: User management with GRANT/REVOKE

- **TCL**: Transaction management with COMMIT/ROLLBACK- IP address logging for security3. Test connection:

- **Advanced**: Triggers, views, sequences, indexes

   ```cmd

### 2. Real-World Application 🌍

- Solves actual supply chain management problems### Managing Users (Admin Only)   sqlplus system/password@localhost:1521/XE

- Industry-standard tech stack (Oracle + Python)

- Production-ready features (auth, audit, security)- Create new users with assigned roles   ```

- Modern UI/UX with real-time updates

- Activate/deactivate user accounts

### 3. Comprehensive Documentation 📖

- Professional README with all details- View user activity and last login### Login Fails

- Architecture diagrams for visual explanation

- Code comments for understanding- Password reset capability- Verify `add_authentication.sql` was run

- Setup scripts for easy demonstration

- Test cases for verification- Check default password hash matches



### 4. Impressive Features 🚀### Managing Suppliers- Ensure `app_users` table exists

- **Real-time chat** - Shows WebSocket mastery

- **Automatic notifications** - Demonstrates trigger usage- View all suppliers with ratings

- **Role-based access** - Security implementation

- **Audit logging** - Compliance and tracking- Add new suppliers with contact information### Permission Denied

- **Analytics dashboard** - Data visualization

- Update supplier details- Check user's role in database

### 5. Easy to Demonstrate 🎯

- Quick setup with `setup.bat`- Delete suppliers (Admin only)- Verify session is active

- Sample data included

- Multiple user roles to showcase- Try logging out and back in

- Live real-time features

- Clear visual indicators### Inventory Management



---- Monitor stock levels across all warehouses### Import Errors



## 🤝 Contributing- View low-stock alerts```cmd



This is an academic project, but suggestions and improvements are welcome!- Update quantities (Admin, Manager, Warehouse)setup.bat



If you find this project helpful, please:- Track last updated timestamps```

- ⭐ **Star the repository**

- 🔀 **Fork for your own learning**

- 📢 **Share with classmates**

- 💬 **Provide feedback via Issues**### Order Processing### Tables Not Found



---- Create new orders with delivery dates```sql



## 📞 Support & Contact- Add products to orders@schema.sql



For questions or issues:- Update order status: PENDING → CONFIRMED → SHIPPED → DELIVERED@add_authentication.sql

- **GitHub Issues**: [Submit an issue](https://github.com/jvkousthub/Supply-Chain-Management-DBMS/issues)

- **Email**: Contact via GitHub profile- View complete order details and history```

- **Documentation**: Check ARCHITECTURE_DIAGRAMS.md for detailed diagrams



---

### Analytics Dashboard## Production Deployment

## 🔗 Quick Links

- Inventory by category (GROUP BY)

- **[View Architecture Diagrams](ARCHITECTURE_DIAGRAMS.md)** - System design and flow charts

- **[Database Schema](schema.sql)** - Main table definitions- Top suppliers by order value (aggregates)### Security Checklist

- **[Chat Schema](chat_schema.sql)** - Chat system tables and triggers

- **[Sample Data](sample_data.sql)** - Test data for demonstration- Warehouse utilization (subqueries)- [ ] Change all default passwords

- **[Migration Script](migrate_viewer_to_customer.sql)** - Role update SQL

- Products needing reorder (HAVING clause)- [ ] Use strong `SECRET_KEY` in `.env`

---

- Order statistics by status- [ ] Enable HTTPS

**⭐ If this project helped you with your DBMS course, please star the repository!**

- [ ] Implement password complexity requirements

**Built with ❤️ for Database Management Systems coursework**

---- [ ] Add session timeouts

- [ ] Regular audit log reviews

## 🔒 Security Features- [ ] Backup database regularly

- [ ] Use environment-specific `.env` files

1. **Password Hashing**: All passwords stored as SHA-256 hashes

2. **Session Management**: Secure Flask sessions with secret key## 💬 Chat System

3. **Role Validation**: Decorator-based permission checks on every route

4. **Audit Trail**: Complete log of all user actions with IP addresses and timestamps### Features

5. **Active Status**: Ability to deactivate users without deletion- **Real-time messaging** using WebSocket (Flask-SocketIO)

6. **Protected Routes**: Login required for all operations- **Role-based communication** with hierarchical permissions

7. **XSS Protection**: Template escaping with Jinja2- **Broadcast messaging** for admins and managers

8. **CSRF Protection**: Session-based CSRF tokens- **Automatic notifications** via database triggers

- **Message types**: General, Announcements, System Alerts, Order Updates, Low Stock Alerts

---- **Priority levels**: Low, Normal, High, Urgent (with visual indicators)

- **Read receipts** and **typing indicators**

## 🧪 Testing- **Desktop notifications** for new messages

- **Modern UI** with gradient design and smooth animations

### Test Different Roles

### Quick Start

Login with different accounts to verify access control:1. Install dependencies: `install_chat.bat`

2. Setup database: `@chat_schema.sql`

1. **Admin**: Full access, can delete records, manage users, broadcast to all3. Access chat: Click 💬 in navigation bar

2. **Manager**: Can add/edit but not delete, broadcast to staff

3. **Warehouse**: Only inventory operations, message admins### Chat Routes

4. **Customer**: Read-only everywhere, message admins- `GET /chat` - Main chat interface

- `GET /api/messages` - Get user messages

### Chat System Testing- `POST /api/messages/send` - Send message

- `POST /api/messages/<recipient_id>/read` - Mark as read

1. Run verification script in Oracle:- `POST /api/messages/read-all` - Mark all read

   ```sql- `GET /api/users/role/<role>` - Get users by role

   -- Verify chat schema setup- `GET /api/conversation/<user_id>` - Get conversation

   SELECT table_name FROM user_tables WHERE table_name LIKE '%MESSAGE%';

   SELECT view_name FROM user_views;### Socket.IO Events

   SELECT trigger_name FROM user_triggers;- `connect` / `disconnect` - Connection management

   ```- `send_message` - Real-time message sending

- `new_message` - Receive new messages

2. Test messaging:- `mark_read` - Mark message as read

   - Login as different users in multiple browsers- `typing` - Typing indicator

   - Send direct messages- `user_typing` - Receive typing notifications

   - Test broadcast functionality

   - Verify real-time delivery### Automatic Notifications

Database triggers automatically send messages for:

3. Test automatic notifications:- **Low Stock**: When inventory ≤ reorder level

   ```sql- **Order Updates**: When order status changes

   -- Trigger low stock alert

   UPDATE inventory SET quantity = 3 WHERE product_id = 1;### Documentation

   - `QUICK_START.txt` - Quick setup guide

   -- Trigger order notification- `CHAT_SETUP_README.md` - Detailed documentation

   UPDATE orders SET status = 'SHIPPED' WHERE order_id = 1;- `IMPLEMENTATION_SUMMARY.md` - Feature overview

   ```- `chat_examples.sql` - Usage examples

- `test_chat_system.sql` - Testing script

---

## 📡 API Routes

## 🐛 Troubleshooting

### Public

### Database Connection Failed- `GET/POST /login` - User authentication

1. Verify Oracle service is running:

   ```cmd### Protected (Login Required)

   net start OracleServiceXE- `GET /` - Dashboard

   ```- `GET /suppliers` - View suppliers

2. Check credentials in `.env` file- `POST /suppliers/add` - Add supplier (Admin, Manager)

3. Test connection with SQL*Plus:- `POST /suppliers/delete/<id>` - Delete supplier (Admin only)

   ```cmd- `GET /inventory` - View inventory

   sqlplus system/password@localhost:1521/XE- `POST /inventory/update/<id>` - Update stock (Admin, Manager, Warehouse)

   ```- `GET /orders` - View orders

- `GET /analytics` - View reports

### Login Fails- `GET /chat` - Chat interface (NEW!)

- Verify `add_authentication.sql` was executed

- Check default password hash matches### Admin Only

- Ensure `app_users` table exists and has data- `GET /users` - View all users

- Clear browser cache and cookies- `GET/POST /users/add` - Create new user

- `POST /users/toggle/<id>` - Activate/deactivate user

### Permission Denied

- Check user's role in database:## 🧪 Testing

  ```sql

  SELECT username, role FROM app_users;Test different roles to verify access control:

  ```

- Verify session is active1. **Admin**: Full access, can delete records, manage users, broadcast to all

- Try logging out and back in2. **Manager**: Can add/edit but not delete, broadcast to staff

3. **Warehouse**: Only inventory operations, message admins

### Chat Not Working4. **Viewer**: Read-only everywhere, message admins

- Verify Flask-SocketIO and gevent are installed:

  ```cmd### Chat System Testing

  pip list | findstr socketio1. Run `@test_chat_system.sql` to verify setup

  pip list | findstr gevent2. Login as different users in multiple browsers

  ```3. Send messages and verify real-time delivery

- Check chat schema is installed:4. Update inventory to trigger low stock alerts

  ```sql5. Change order status to trigger notifications

  SELECT table_name FROM user_tables WHERE table_name LIKE 'MESSAGE%';

  ```## 📄 License

- Check browser console for WebSocket errors

- Ensure firewall allows port 5000This project is for educational purposes as a DBMS coursework demonstration.



### Import Errors## 👨‍💻 Author

```cmd

# Reinstall dependenciesCreated by [jvkousthub](https://github.com/jvkousthub) - Database Management Systems project demonstrating Oracle SQL integration with Flask web application, enterprise-grade authentication, and real-time chat system.

setup.bat

```## 📸 Screenshots



### Tables Not Found*Login page with role-based authentication*

```sql*Dashboard with user information and role badge*

-- Run setup scripts*User management interface (admin only)*

@schema.sql*Inventory management with permission-based actions*

@add_authentication.sql*Real-time chat with broadcast messaging and automatic notifications*

@chat_schema.sql

```---



---**⭐ Star this repository if you found it helpful!**



## 🚀 Production Deployment### Key Highlights

✅ **Oracle SQL** - Complete DBMS integration  

### Security Checklist✅ **Flask** - Modern Python web framework  

- [ ] Change all default passwords✅ **Real-Time Chat** - WebSocket-based messaging  

- [ ] Use strong `SECRET_KEY` in `.env`✅ **Role-Based Access** - Hierarchical permissions  

- [ ] Enable HTTPS with SSL certificate✅ **Auto Notifications** - Database triggers  

- [ ] Implement password complexity requirements✅ **Production Ready** - Authentication, audit logs, security

- [ ] Add session timeouts (currently unlimited)
- [ ] Configure rate limiting for API endpoints
- [ ] Set up regular database backups
- [ ] Review audit logs regularly
- [ ] Use environment-specific `.env` files
- [ ] Disable Flask debug mode (`debug=False`)
- [ ] Configure production WSGI server (gunicorn/waitress)
- [ ] Set up reverse proxy (nginx/Apache)

### Recommended Environment Variables
```properties
FLASK_ENV=production
DB_USER=scm_production_user
DB_PASSWORD=<strong-password>
DB_DSN=<production-db-connection-string>
SECRET_KEY=<generate-random-256-bit-key>
SESSION_TIMEOUT=3600
```

---

## 📄 License

This project is for educational purposes as a Database Management Systems (DBMS) coursework demonstration.

---

## 👨‍💻 Author

Created by **[jvkousthub](https://github.com/jvkousthub)**

Database Management Systems project demonstrating:
- Oracle SQL integration with Python Flask
- Enterprise-grade authentication and authorization
- Real-time WebSocket communication
- Role-based access control
- Complete DBMS feature implementation (DDL, DML, DQL, DCL, TCL)

---

## 📸 Screenshots

*Login page with role-based authentication*
*Dashboard with user information and role badge*
*User management interface (admin only)*
*Inventory management with permission-based actions*
*Real-time chat with broadcast messaging and automatic notifications*

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

**⭐ Star this repository if you found it helpful!**

For detailed architecture and flow diagrams, see **[ARCHITECTURE_DIAGRAMS.md](ARCHITECTURE_DIAGRAMS.md)**
