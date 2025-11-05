-- Example Usage Scenarios for Chat System

-- ============================================
-- Scenario 1: Admin Broadcasting to All Users
-- ============================================

-- Admin sends a system-wide announcement
DECLARE
    v_message_id NUMBER;
    v_admin_id NUMBER;
BEGIN
    -- Get admin user
    SELECT user_id INTO v_admin_id FROM app_users WHERE username = 'admin';
    
    -- Create broadcast message
    INSERT INTO messages (message_id, sender_id, message_text, message_type, priority, is_broadcast)
    VALUES (message_seq.NEXTVAL, v_admin_id, 
            'System maintenance scheduled for tonight at 10 PM. Please save all work.',
            'ANNOUNCEMENT', 'HIGH', 1)
    RETURNING message_id INTO v_message_id;
    
    -- Send to all active users
    FOR user_rec IN (SELECT user_id FROM app_users WHERE is_active = 1 AND user_id != v_admin_id) LOOP
        INSERT INTO message_recipients (recipient_id, message_id, user_id)
        VALUES (recipient_seq.NEXTVAL, v_message_id, user_rec.user_id);
    END LOOP;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Broadcast sent to all users!');
END;
/

-- ============================================
-- Scenario 2: Manager Sending to All Warehouse Staff
-- ============================================

DECLARE
    v_message_id NUMBER;
    v_manager_id NUMBER;
BEGIN
    -- Get manager user
    SELECT user_id INTO v_manager_id FROM app_users WHERE username = 'manager';
    
    -- Create message
    INSERT INTO messages (message_id, sender_id, message_text, message_type, priority, is_broadcast)
    VALUES (message_seq.NEXTVAL, v_manager_id,
            'Please conduct inventory count by end of day.',
            'GENERAL', 'NORMAL', 0)
    RETURNING message_id INTO v_message_id;
    
    -- Send to all warehouse staff
    FOR user_rec IN (SELECT user_id FROM app_users WHERE role = 'WAREHOUSE' AND is_active = 1) LOOP
        INSERT INTO message_recipients (recipient_id, message_id, user_id)
        VALUES (recipient_seq.NEXTVAL, v_message_id, user_rec.user_id);
    END LOOP;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Message sent to all warehouse staff!');
END;
/

-- ============================================
-- Scenario 3: Warehouse Staff Reporting to Admin
-- ============================================

DECLARE
    v_message_id NUMBER;
    v_warehouse_id NUMBER;
    v_admin_id NUMBER;
BEGIN
    -- Get user IDs
    SELECT user_id INTO v_warehouse_id FROM app_users WHERE username = 'warehouse';
    SELECT user_id INTO v_admin_id FROM app_users WHERE username = 'admin';
    
    -- Create report message
    INSERT INTO messages (message_id, sender_id, message_text, message_type, priority, is_broadcast)
    VALUES (message_seq.NEXTVAL, v_warehouse_id,
            'Inventory count completed. Found discrepancies in warehouse A - items need recount.',
            'GENERAL', 'HIGH', 0)
    RETURNING message_id INTO v_message_id;
    
    -- Send to admin
    INSERT INTO message_recipients (recipient_id, message_id, user_id)
    VALUES (recipient_seq.NEXTVAL, v_message_id, v_admin_id);
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Report sent to admin!');
END;
/

-- ============================================
-- Scenario 4: Automatic Low Stock Alert
-- ============================================

-- This happens automatically when inventory is updated
-- Let's simulate it:

DECLARE
    v_test_inventory_id NUMBER;
BEGIN
    -- Find an inventory item
    SELECT inventory_id INTO v_test_inventory_id FROM inventory WHERE ROWNUM = 1;
    
    -- Update quantity to trigger alert (below reorder level)
    UPDATE inventory 
    SET quantity = CASE 
        WHEN reorder_level > 0 THEN reorder_level - 1
        ELSE 0
    END
    WHERE inventory_id = v_test_inventory_id;
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Low stock alert automatically sent!');
    DBMS_OUTPUT.PUT_LINE('Check messages table for LOW_STOCK_ALERT type');
END;
/

-- ============================================
-- Scenario 5: Order Status Update Notification
-- ============================================

-- This happens automatically when order status changes
DECLARE
    v_test_order_id NUMBER;
BEGIN
    -- Find an order
    SELECT order_id INTO v_test_order_id FROM orders WHERE ROWNUM = 1;
    
    -- Update order status
    UPDATE orders 
    SET status = 'SHIPPED'
    WHERE order_id = v_test_order_id;
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Order status update notification sent!');
    DBMS_OUTPUT.PUT_LINE('Check messages table for ORDER_UPDATE type');
END;
/

-- ============================================
-- Scenario 6: Urgent Alert from Admin
-- ============================================

DECLARE
    v_message_id NUMBER;
    v_admin_id NUMBER;
BEGIN
    SELECT user_id INTO v_admin_id FROM app_users WHERE username = 'admin';
    
    -- Create urgent message
    INSERT INTO messages (message_id, sender_id, message_text, message_type, priority, is_broadcast)
    VALUES (message_seq.NEXTVAL, v_admin_id,
            'URGENT: Security breach detected. Change passwords immediately!',
            'SYSTEM_ALERT', 'URGENT', 1)
    RETURNING message_id INTO v_message_id;
    
    -- Send to all users
    FOR user_rec IN (SELECT user_id FROM app_users WHERE is_active = 1 AND user_id != v_admin_id) LOOP
        INSERT INTO message_recipients (recipient_id, message_id, user_id)
        VALUES (recipient_seq.NEXTVAL, v_message_id, user_rec.user_id);
    END LOOP;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Urgent alert sent!');
END;
/

-- ============================================
-- Scenario 7: Viewing Unread Messages
-- ============================================

-- Query to see unread messages for a specific user
SELECT 
    sender_name,
    message_text,
    message_type,
    priority,
    sent_at
FROM user_inbox
WHERE recipient_user_id = (SELECT user_id FROM app_users WHERE username = 'manager')
AND is_read = 0
ORDER BY sent_at DESC;

-- ============================================
-- Scenario 8: Conversation Between Two Users
-- ============================================

-- View conversation between admin and manager
SELECT 
    CASE 
        WHEN m.sender_id = (SELECT user_id FROM app_users WHERE username = 'admin') 
        THEN 'Admin' 
        ELSE 'Manager' 
    END AS sender,
    m.message_text,
    m.sent_at
FROM messages m
JOIN message_recipients mr ON m.message_id = mr.message_id
WHERE (m.sender_id = (SELECT user_id FROM app_users WHERE username = 'admin')
       AND mr.user_id = (SELECT user_id FROM app_users WHERE username = 'manager'))
   OR (m.sender_id = (SELECT user_id FROM app_users WHERE username = 'manager')
       AND mr.user_id = (SELECT user_id FROM app_users WHERE username = 'admin'))
ORDER BY m.sent_at;

-- ============================================
-- Scenario 9: Mark Messages as Read
-- ============================================

DECLARE
    v_user_id NUMBER;
BEGIN
    -- Get user
    SELECT user_id INTO v_user_id FROM app_users WHERE username = 'manager';
    
    -- Mark all messages as read
    UPDATE message_recipients
    SET is_read = 1, read_at = SYSDATE
    WHERE user_id = v_user_id AND is_read = 0;
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('All messages marked as read!');
END;
/

-- ============================================
-- Scenario 10: Get Message Statistics
-- ============================================

-- Total messages by type
SELECT message_type, COUNT(*) as total
FROM messages
GROUP BY message_type
ORDER BY total DESC;

-- Messages by priority
SELECT priority, COUNT(*) as total
FROM messages
GROUP BY priority
ORDER BY 
    CASE priority
        WHEN 'URGENT' THEN 1
        WHEN 'HIGH' THEN 2
        WHEN 'NORMAL' THEN 3
        WHEN 'LOW' THEN 4
    END;

-- Most active senders
SELECT 
    u.full_name,
    u.role,
    COUNT(m.message_id) as messages_sent
FROM app_users u
LEFT JOIN messages m ON u.user_id = m.sender_id
GROUP BY u.full_name, u.role
ORDER BY messages_sent DESC;

-- Users with most unread messages
SELECT * FROM user_unread_count
WHERE unread_count > 0
ORDER BY unread_count DESC;

-- ============================================
-- Scenario 11: Cleanup Old Messages
-- ============================================

-- Delete messages older than 90 days (optional maintenance)
/*
DELETE FROM messages
WHERE sent_at < SYSDATE - 90;

COMMIT;
*/

-- Or archive them instead
/*
CREATE TABLE messages_archive AS 
SELECT * FROM messages 
WHERE sent_at < SYSDATE - 90;

DELETE FROM messages
WHERE sent_at < SYSDATE - 90;

COMMIT;
*/

-- ============================================
-- Scenario 12: Custom Delivery Notification
-- ============================================

DECLARE
    v_message_id NUMBER;
    v_admin_id NUMBER;
    v_order_id NUMBER := 1; -- Example order ID
BEGIN
    SELECT user_id INTO v_admin_id FROM app_users WHERE username = 'admin';
    
    -- Create delivery notification
    INSERT INTO messages (message_id, sender_id, message_text, message_type, 
                         priority, reference_type, reference_id, is_broadcast)
    VALUES (message_seq.NEXTVAL, v_admin_id,
            'Order #' || v_order_id || ' has been delivered successfully to the warehouse.',
            'DELIVERY_NOTICE', 'NORMAL', 'ORDER', v_order_id, 0)
    RETURNING message_id INTO v_message_id;
    
    -- Send to managers and warehouse staff
    FOR user_rec IN (SELECT user_id FROM app_users 
                     WHERE role IN ('MANAGER', 'WAREHOUSE') AND is_active = 1) LOOP
        INSERT INTO message_recipients (recipient_id, message_id, user_id)
        VALUES (recipient_seq.NEXTVAL, v_message_id, user_rec.user_id);
    END LOOP;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Delivery notification sent!');
END;
/

-- ============================================
-- Useful Queries
-- ============================================

-- View all messages with full details
SELECT * FROM message_details ORDER BY sent_at DESC;

-- View user inbox
SELECT * FROM user_inbox 
WHERE recipient_user_id = (SELECT user_id FROM app_users WHERE username = 'your_username')
ORDER BY sent_at DESC;

-- View unread counts for all users
SELECT * FROM user_unread_count ORDER BY unread_count DESC;

-- Recent broadcasts
SELECT * FROM message_details 
WHERE is_broadcast = 1 
ORDER BY sent_at DESC 
FETCH FIRST 10 ROWS ONLY;

-- High priority messages
SELECT * FROM message_details 
WHERE priority IN ('HIGH', 'URGENT')
ORDER BY sent_at DESC;
