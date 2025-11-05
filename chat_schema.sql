DROP TABLE message_recipients CASCADE CONSTRAINTS;
DROP TABLE messages CASCADE CONSTRAINTS;
DROP TABLE chat_rooms CASCADE CONSTRAINTS;


CREATE TABLE chat_rooms (
    room_id NUMBER PRIMARY KEY,
    room_name VARCHAR2(100) NOT NULL,
    room_type VARCHAR2(20) CHECK (room_type IN ('DIRECT', 'GROUP', 'ANNOUNCEMENT')),
    created_by NUMBER NOT NULL,
    created_at DATE DEFAULT SYSDATE,
    is_active NUMBER(1) DEFAULT 1 CHECK (is_active IN (0, 1)),
    FOREIGN KEY (created_by) REFERENCES app_users(user_id)
);

-- Messages table
CREATE TABLE messages (
    message_id NUMBER PRIMARY KEY,
    sender_id NUMBER NOT NULL,
    message_text CLOB NOT NULL,
    message_type VARCHAR2(30) DEFAULT 'GENERAL',
    priority VARCHAR2(20) DEFAULT 'NORMAL',
    reference_type VARCHAR2(50),
    reference_id NUMBER,
    sent_at DATE DEFAULT SYSDATE,
    is_broadcast NUMBER(1) DEFAULT 0 CHECK (is_broadcast IN (0, 1)),
    FOREIGN KEY (sender_id) REFERENCES app_users(user_id),
    CHECK (message_type IN ('GENERAL', 'LOW_STOCK_ALERT', 'ORDER_UPDATE', 
                             'DELIVERY_NOTICE', 'SYSTEM_ALERT', 'ANNOUNCEMENT')),
    CHECK (priority IN ('LOW', 'NORMAL', 'HIGH', 'URGENT'))
);

-- Message Recipients table (for tracking who should receive messages)
CREATE TABLE message_recipients (
    recipient_id NUMBER PRIMARY KEY,
    message_id NUMBER NOT NULL,
    user_id NUMBER NOT NULL,
    is_read NUMBER(1) DEFAULT 0 CHECK (is_read IN (0, 1)),
    read_at DATE,
    received_at DATE DEFAULT SYSDATE,
    FOREIGN KEY (message_id) REFERENCES messages(message_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES app_users(user_id),
    UNIQUE (message_id, user_id)
);

-- Create sequences
CREATE SEQUENCE room_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE message_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE recipient_seq START WITH 1 INCREMENT BY 1;

-- Create indexes for performance
CREATE INDEX idx_message_sender ON messages(sender_id);
CREATE INDEX idx_message_type ON messages(message_type);
CREATE INDEX idx_message_sent ON messages(sent_at);
CREATE INDEX idx_recipient_user ON message_recipients(user_id);
CREATE INDEX idx_recipient_msg ON message_recipients(message_id);
CREATE INDEX idx_recipient_read ON message_recipients(is_read);

-- View for unread message count per user
CREATE OR REPLACE VIEW user_unread_count AS
SELECT 
    u.user_id,
    u.username,
    u.full_name,
    COUNT(mr.recipient_id) AS unread_count
FROM app_users u
LEFT JOIN message_recipients mr ON u.user_id = mr.user_id AND mr.is_read = 0
GROUP BY u.user_id, u.username, u.full_name;

-- View for recent messages with sender info
CREATE OR REPLACE VIEW message_details AS
SELECT 
    m.message_id,
    m.sender_id,
    u.username AS sender_username,
    u.full_name AS sender_name,
    u.role AS sender_role,
    m.message_text,
    m.message_type,
    m.priority,
    m.reference_type,
    m.reference_id,
    m.sent_at,
    m.is_broadcast
FROM messages m
JOIN app_users u ON m.sender_id = u.user_id
ORDER BY m.sent_at DESC;

-- View for user's inbox
CREATE OR REPLACE VIEW user_inbox AS
SELECT 
    mr.recipient_id,
    mr.user_id AS recipient_user_id,
    m.message_id,
    m.sender_id,
    sender.username AS sender_username,
    sender.full_name AS sender_name,
    sender.role AS sender_role,
    m.message_text,
    m.message_type,
    m.priority,
    m.reference_type,
    m.reference_id,
    m.sent_at,
    mr.is_read,
    mr.read_at,
    mr.received_at
FROM message_recipients mr
JOIN messages m ON mr.message_id = m.message_id
JOIN app_users sender ON m.sender_id = sender.user_id
ORDER BY m.sent_at DESC;

-- Trigger to auto-create low stock alert messages
CREATE OR REPLACE TRIGGER trg_low_stock_alert
AFTER UPDATE OF quantity ON inventory
FOR EACH ROW
WHEN (NEW.quantity <= NEW.reorder_level AND OLD.quantity > OLD.reorder_level)
DECLARE
    v_message_id NUMBER;
    v_product_name VARCHAR2(100);
    v_warehouse_name VARCHAR2(100);
    v_message_text CLOB;
    v_admin_id NUMBER;
BEGIN
    -- Get product and warehouse names
    SELECT name INTO v_product_name FROM products WHERE product_id = :NEW.product_id;
    SELECT name INTO v_warehouse_name FROM warehouses WHERE warehouse_id = :NEW.warehouse_id;
    
    -- Get admin user (first admin in the system)
    SELECT user_id INTO v_admin_id FROM app_users WHERE role = 'ADMIN' AND is_active = 1 AND ROWNUM = 1;
    
    -- Create message text
    v_message_text := 'LOW STOCK ALERT: Product "' || v_product_name || '" at warehouse "' || 
                      v_warehouse_name || '" has reached reorder level. Current quantity: ' || 
                      :NEW.quantity || ', Reorder level: ' || :NEW.reorder_level;
    
    -- Insert message (from system admin)
    INSERT INTO messages (message_id, sender_id, message_text, message_type, priority, 
                         reference_type, reference_id, is_broadcast)
    VALUES (message_seq.NEXTVAL, v_admin_id, v_message_text, 'LOW_STOCK_ALERT', 'HIGH', 
            'INVENTORY', :NEW.inventory_id, 0)
    RETURNING message_id INTO v_message_id;
    
    -- Send to all ADMIN and MANAGER users
    FOR admin_user IN (SELECT user_id FROM app_users WHERE role IN ('ADMIN', 'MANAGER') AND is_active = 1) LOOP
        INSERT INTO message_recipients (recipient_id, message_id, user_id)
        VALUES (recipient_seq.NEXTVAL, v_message_id, admin_user.user_id);
    END LOOP;
    
EXCEPTION
    WHEN OTHERS THEN
        NULL; -- Silently fail to not interrupt inventory updates
END;
/

-- Trigger to notify about order status changes
CREATE OR REPLACE TRIGGER trg_order_status_notification
AFTER UPDATE OF status ON orders
FOR EACH ROW
WHEN (NEW.status != OLD.status)
DECLARE
    v_message_id NUMBER;
    v_message_text CLOB;
    v_admin_id NUMBER;
    v_supplier_name VARCHAR2(100);
BEGIN
    -- Get admin user
    SELECT user_id INTO v_admin_id FROM app_users WHERE role = 'ADMIN' AND is_active = 1 AND ROWNUM = 1;
    
    -- Get supplier name if exists
    IF :NEW.supplier_id IS NOT NULL THEN
        SELECT name INTO v_supplier_name FROM suppliers WHERE supplier_id = :NEW.supplier_id;
    ELSE
        v_supplier_name := 'N/A';
    END IF;
    
    -- Create notification message
    v_message_text := 'Order #' || :NEW.order_id || ' status changed from ' || :OLD.status || 
                      ' to ' || :NEW.status || '. Supplier: ' || v_supplier_name;
    
    -- Insert message
    INSERT INTO messages (message_id, sender_id, message_text, message_type, priority, 
                         reference_type, reference_id, is_broadcast)
    VALUES (message_seq.NEXTVAL, v_admin_id, v_message_text, 'ORDER_UPDATE', 'NORMAL', 
            'ORDER', :NEW.order_id, 0)
    RETURNING message_id INTO v_message_id;
    
    -- Send to relevant users
    FOR user_rec IN (SELECT user_id FROM app_users WHERE role IN ('ADMIN', 'MANAGER') AND is_active = 1) LOOP
        INSERT INTO message_recipients (recipient_id, message_id, user_id)
        VALUES (recipient_seq.NEXTVAL, v_message_id, user_rec.user_id);
    END LOOP;
    
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

COMMIT;

SELECT 'Chat system schema created successfully!' AS status FROM DUAL;
