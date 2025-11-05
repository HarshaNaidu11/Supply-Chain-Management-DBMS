# Chat System Architecture Diagram

## System Overview
```
┌─────────────────────────────────────────────────────────────────────┐
│                    SUPPLY CHAIN MANAGEMENT DBMS                     │
│                         WITH CHAT SYSTEM                            │
└─────────────────────────────────────────────────────────────────────┘
                                   │
                    ┌──────────────┴──────────────┐
                    │                             │
              ┌─────▼─────┐                 ┌────▼────┐
              │   USERS   │                 │ ORACLE  │
              │  (Roles)  │                 │   DB    │
              └─────┬─────┘                 └────┬────┘
                    │                            │
        ┌───────────┼────────────┬───────────────┘
        │           │            │
   ┌────▼───┐  ┌───▼────┐  ┌───▼────┐
   │ ADMIN  │  │MANAGER │  │WAREHOUSE│
   └────┬───┘  └───┬────┘  └───┬────┘
        │          │            │
        └──────────┴────────────┘
                   │
            ┌──────▼──────┐
            │ CHAT SYSTEM │
            └─────────────┘
```

## Role-Based Messaging Hierarchy
```
                    ┌─────────────┐
                    │    ADMIN    │ ◄── Top Authority
                    │  (Broadcast │
                    │   to All)   │
                    └──────┬──────┘
                           │
              ┌────────────┼────────────┐
              │            │            │
         ┌────▼────┐  ┌───▼────┐  ┌───▼────┐
         │ MANAGER │  │WAREHOUSE│  │ VIEWER │
         │(Broadcast│  │(Message │  │(Message│
         │to Staff) │  │Admins)  │  │Admins) │
         └─────────┘  └─────────┘  └────────┘
```

## Database Schema Relationships
```
┌──────────────┐         ┌──────────────────┐         ┌──────────────┐
│  app_users   │         │    messages      │         │  message_    │
│              │────────▶│                  │◄────────│  recipients  │
│ • user_id    │sender   │ • message_id     │message  │              │
│ • username   │         │ • sender_id      │         │ • recipient_id│
│ • role       │         │ • message_text   │         │ • message_id │
│ • full_name  │         │ • message_type   │         │ • user_id    │
└──────────────┘         │ • priority       │         │ • is_read    │
       ▲                 │ • is_broadcast   │         └──────────────┘
       │                 └──────────────────┘                │
       │                                                     │
       └─────────────────────────────────────────────────────┘
                          recipient
```

## Message Flow Diagram
```
┌────────────┐                                          ┌────────────┐
│  User A    │                                          │  User B    │
│  (Sender)  │                                          │ (Recipient)│
└─────┬──────┘                                          └─────▲──────┘
      │                                                       │
      │ 1. Send Message                                      │
      │ (via Socket.IO)                                      │
      ▼                                                       │
┌─────────────────────────────────────────────────────┐     │
│              Flask-SocketIO Server                   │     │
│  ┌──────────────────────────────────────────────┐  │     │
│  │  1. Receive message event                    │  │     │
│  │  2. Validate user & permissions              │  │     │
│  │  3. Call chat_manager.send_message()         │  │     │
│  └──────────────────────────────────────────────┘  │     │
└─────────────────┬───────────────────────────────────┘     │
                  │                                          │
                  │ 2. Save to DB                            │
                  ▼                                          │
┌─────────────────────────────────────────────────────┐     │
│              Oracle Database                         │     │
│  ┌──────────────────────────────────────────────┐  │     │
│  │  INSERT INTO messages (...)                  │  │     │
│  │  INSERT INTO message_recipients (...)        │  │     │
│  │  COMMIT                                      │  │     │
│  └──────────────────────────────────────────────┘  │     │
└─────────────────┬───────────────────────────────────┘     │
                  │                                          │
                  │ 3. Return message_id                     │
                  ▼                                          │
┌─────────────────────────────────────────────────────┐     │
│              Flask-SocketIO Server                   │     │
│  ┌──────────────────────────────────────────────┐  │     │
│  │  4. Emit 'new_message' event                 │  │     │
│  │  5. Broadcast to recipient(s)                │  │     │
│  └──────────────────────────────────────────────┘  │     │
└─────────────────────────────────────────────────────┘     │
                  │                                          │
                  │ 4. WebSocket push                        │
                  └──────────────────────────────────────────┘
                                    │
                                    │ 5. Display message
                                    ▼
                          ┌──────────────────┐
                          │   Chat UI        │
                          │  • Add to chat   │
                          │  • Show badge    │
                          │  • Play sound    │
                          │  • Notify user   │
                          └──────────────────┘
```

## Automatic Alert Trigger Flow
```
┌───────────────┐
│  DML Event    │
│  (UPDATE)     │
└───────┬───────┘
        │
        │ UPDATE inventory SET quantity = 5
        │ WHERE inventory_id = 1
        ▼
┌─────────────────────────────────────────────┐
│        Oracle Database Trigger               │
│  trg_low_stock_alert                        │
│  ┌──────────────────────────────────────┐  │
│  │  1. Check: quantity <= reorder_level │  │
│  │  2. Get product & warehouse names    │  │
│  │  3. Create alert message text        │  │
│  │  4. INSERT into messages table       │  │
│  │  5. INSERT recipients (admins,mgrs)  │  │
│  │  6. COMMIT                           │  │
│  └──────────────────────────────────────┘  │
└─────────────────┬───────────────────────────┘
                  │
                  │ Trigger fires automatically
                  ▼
┌─────────────────────────────────────────────┐
│           messages table                     │
│  • message_id: 123                          │
│  • message_type: 'LOW_STOCK_ALERT'          │
│  • priority: 'HIGH'                         │
│  • message_text: "Low stock alert..."       │
└─────────────────┬───────────────────────────┘
                  │
                  │ Recipients notified
                  ▼
┌──────────────────────────────────────────────┐
│      message_recipients table                │
│  • Admin receives alert                      │
│  • Manager receives alert                    │
│  • is_read = 0 (unread)                      │
└──────────────────────────────────────────────┘
                  │
                  │ Real-time push
                  ▼
┌──────────────────────────────────────────────┐
│         WebSocket Broadcast                  │
│  Socket.IO emits to all connected admins/mgrs│
└──────────────────────────────────────────────┘
```

## Broadcast Message Flow
```
┌────────────┐
│   ADMIN    │
│  Clicks    │
│"Broadcast" │
└─────┬──────┘
      │
      │ 1. Open modal, select recipients
      ▼
┌─────────────────────────────────────┐
│      Broadcast Modal                │
│  ┌──────────────────────────────┐  │
│  │ Target: [All Users ▼]        │  │
│  │ Type: [Announcement ▼]       │  │
│  │ Priority: [High ▼]           │  │
│  │ Message: [____________]      │  │
│  │                              │  │
│  │  [Cancel]  [Send Broadcast]  │  │
│  └──────────────────────────────┘  │
└─────────────────┬───────────────────┘
                  │
                  │ 2. Submit
                  ▼
┌─────────────────────────────────────────────┐
│         POST /api/messages/send              │
│  {                                          │
│    recipient_ids: [1,2,3,4...],             │
│    message_text: "Important update...",     │
│    message_type: "ANNOUNCEMENT",            │
│    priority: "HIGH",                        │
│    is_broadcast: true                       │
│  }                                          │
└─────────────────┬───────────────────────────┘
                  │
                  │ 3. Process
                  ▼
┌─────────────────────────────────────────────┐
│     chat_manager.send_message()              │
│  ┌──────────────────────────────────────┐  │
│  │ 1. Insert into messages              │  │
│  │ 2. Loop through recipients           │  │
│  │ 3. Insert into message_recipients    │  │
│  │ 4. COMMIT                            │  │
│  └──────────────────────────────────────┘  │
└─────────────────┬───────────────────────────┘
                  │
                  │ 4. Broadcast
                  ▼
┌─────────────────────────────────────────────┐
│         Socket.IO Broadcast                  │
│  emit('new_message', data, broadcast=True)  │
└─────────────────┬───────────────────────────┘
                  │
        ┌─────────┼─────────┐
        │         │         │
   ┌────▼───┐ ┌──▼────┐ ┌─▼─────┐
   │Manager │ │Warehouse│ │Viewer │
   │Receives│ │Receives│ │Receives│
   └────────┘ └────────┘ └───────┘
```

## Technology Stack Layers
```
┌─────────────────────────────────────────────────┐
│              PRESENTATION LAYER                  │
│  ┌──────────────────────────────────────────┐  │
│  │  HTML5 + CSS3 + JavaScript               │  │
│  │  • chat.html (700+ lines)                │  │
│  │  • Socket.IO Client Library              │  │
│  │  • Responsive gradient design            │  │
│  └──────────────────────────────────────────┘  │
└─────────────────────────────────────────────────┘
                      ▲ │
                      │ ▼
┌─────────────────────────────────────────────────┐
│               APPLICATION LAYER                  │
│  ┌──────────────────────────────────────────┐  │
│  │  Flask + Flask-SocketIO                  │  │
│  │  • app.py (routes & socket handlers)    │  │
│  │  • chat_manager.py (business logic)     │  │
│  │  • auth.py (authentication)             │  │
│  └──────────────────────────────────────────┘  │
└─────────────────────────────────────────────────┘
                      ▲ │
                      │ ▼
┌─────────────────────────────────────────────────┐
│              DATA ACCESS LAYER                   │
│  ┌──────────────────────────────────────────┐  │
│  │  database.py (Oracle connection)         │  │
│  │  python-oracledb driver                  │  │
│  │  • execute_query()                       │  │
│  │  • execute_update()                      │  │
│  └──────────────────────────────────────────┘  │
└─────────────────────────────────────────────────┘
                      ▲ │
                      │ ▼
┌─────────────────────────────────────────────────┐
│               DATABASE LAYER                     │
│  ┌──────────────────────────────────────────┐  │
│  │  Oracle Database 11g/12c/19c/21c         │  │
│  │  • Tables (messages, recipients, rooms)  │  │
│  │  • Views (inbox, unread_count, details)  │  │
│  │  • Triggers (alerts, notifications)      │  │
│  │  • Sequences (auto-increment IDs)        │  │
│  └──────────────────────────────────────────┘  │
└─────────────────────────────────────────────────┘
```

## File Dependencies
```
app.py
  ├── Imports: flask, flask_socketio
  ├── Imports: database.py
  ├── Imports: auth.py
  ├── Imports: chat_manager.py
  └── Uses: templates/chat.html

chat_manager.py
  ├── Imports: oracledb
  └── Uses: database.py instance

templates/chat.html
  ├── Extends: templates/base.html
  ├── Uses: Socket.IO Client (CDN)
  └── Renders: Jinja2 variables

chat_schema.sql
  ├── Creates: Tables
  ├── Creates: Sequences
  ├── Creates: Views
  └── Creates: Triggers

Oracle Database
  ├── Runs: chat_schema.sql
  ├── Stores: Messages
  ├── Fires: Triggers
  └── Serves: Queries
```

## Real-Time Communication Flow
```
Browser A          Flask Server         Oracle DB         Browser B
   │                    │                    │                │
   │  1. Connect        │                    │                │
   ├───────────────────▶│                    │                │
   │  ◄Socket.IO        │                    │                │
   │  join_room()       │                    │                │
   │                    │                    │                │
   │                    │                    │  2. Connect    │
   │                    │◄───────────────────┤                │
   │                    │   Socket.IO        │                │
   │                    │   join_room()      │                │
   │                    │                    │                │
   │  3. Send msg       │                    │                │
   ├───────────────────▶│                    │                │
   │  emit('send_msg')  │  4. Save to DB     │                │
   │                    ├───────────────────▶│                │
   │                    │  INSERT messages   │                │
   │                    │  INSERT recipients │                │
   │                    │                    │                │
   │                    │  5. Broadcast      │                │
   │                    ├────────────────────┼───────────────▶│
   │                    │  emit('new_msg')   │  6. Receive    │
   │                    │                    │  Display in UI │
   │                    │                    │                │
```

## Deployment Architecture (Production Ready)
```
┌─────────────────────────────────────────────────┐
│               Load Balancer                      │
│             (nginx/Apache)                       │
└─────────────────┬───────────────────────────────┘
                  │
        ┌─────────┴─────────┐
        │                   │
┌───────▼──────┐    ┌──────▼────────┐
│ Flask App 1  │    │ Flask App 2   │
│ (Socket.IO)  │    │ (Socket.IO)   │
└───────┬──────┘    └──────┬────────┘
        │                  │
        └──────────┬───────┘
                   │
        ┌──────────▼───────────┐
        │  Redis/Message Queue │
        │  (for Socket.IO      │
        │   coordination)      │
        └──────────┬───────────┘
                   │
        ┌──────────▼───────────┐
        │   Oracle Database    │
        │   (with replication) │
        └──────────────────────┘
```
