-- Test script for chat system functionality
-- Run this after setting up chat_schema.sql

SET SERVEROUTPUT ON;

-- Test 1: Verify tables exist
DECLARE
    v_count NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Chat System Verification ===');
    DBMS_OUTPUT.PUT_LINE('');
    
    -- Check messages table
    SELECT COUNT(*) INTO v_count FROM user_tables WHERE table_name = 'MESSAGES';
    IF v_count = 1 THEN
        DBMS_OUTPUT.PUT_LINE('✓ MESSAGES table exists');
    ELSE
        DBMS_OUTPUT.PUT_LINE('✗ MESSAGES table NOT found');
    END IF;
    
    -- Check message_recipients table
    SELECT COUNT(*) INTO v_count FROM user_tables WHERE table_name = 'MESSAGE_RECIPIENTS';
    IF v_count = 1 THEN
        DBMS_OUTPUT.PUT_LINE('✓ MESSAGE_RECIPIENTS table exists');
    ELSE
        DBMS_OUTPUT.PUT_LINE('✗ MESSAGE_RECIPIENTS table NOT found');
    END IF;
    
    -- Check chat_rooms table
    SELECT COUNT(*) INTO v_count FROM user_tables WHERE table_name = 'CHAT_ROOMS';
    IF v_count = 1 THEN
        DBMS_OUTPUT.PUT_LINE('✓ CHAT_ROOMS table exists');
    ELSE
        DBMS_OUTPUT.PUT_LINE('✗ CHAT_ROOMS table NOT found');
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('');
END;
/

-- Test 2: Verify sequences exist
DECLARE
    v_count NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Sequences Check ===');
    DBMS_OUTPUT.PUT_LINE('');
    
    SELECT COUNT(*) INTO v_count FROM user_sequences WHERE sequence_name = 'MESSAGE_SEQ';
    IF v_count = 1 THEN
        DBMS_OUTPUT.PUT_LINE('✓ MESSAGE_SEQ sequence exists');
    ELSE
        DBMS_OUTPUT.PUT_LINE('✗ MESSAGE_SEQ sequence NOT found');
    END IF;
    
    SELECT COUNT(*) INTO v_count FROM user_sequences WHERE sequence_name = 'RECIPIENT_SEQ';
    IF v_count = 1 THEN
        DBMS_OUTPUT.PUT_LINE('✓ RECIPIENT_SEQ sequence exists');
    ELSE
        DBMS_OUTPUT.PUT_LINE('✗ RECIPIENT_SEQ sequence NOT found');
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('');
END;
/

-- Test 3: Verify views exist
DECLARE
    v_count NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Views Check ===');
    DBMS_OUTPUT.PUT_LINE('');
    
    SELECT COUNT(*) INTO v_count FROM user_views WHERE view_name = 'USER_UNREAD_COUNT';
    IF v_count = 1 THEN
        DBMS_OUTPUT.PUT_LINE('✓ USER_UNREAD_COUNT view exists');
    ELSE
        DBMS_OUTPUT.PUT_LINE('✗ USER_UNREAD_COUNT view NOT found');
    END IF;
    
    SELECT COUNT(*) INTO v_count FROM user_views WHERE view_name = 'MESSAGE_DETAILS';
    IF v_count = 1 THEN
        DBMS_OUTPUT.PUT_LINE('✓ MESSAGE_DETAILS view exists');
    ELSE
        DBMS_OUTPUT.PUT_LINE('✗ MESSAGE_DETAILS view NOT found');
    END IF;
    
    SELECT COUNT(*) INTO v_count FROM user_views WHERE view_name = 'USER_INBOX';
    IF v_count = 1 THEN
        DBMS_OUTPUT.PUT_LINE('✓ USER_INBOX view exists');
    ELSE
        DBMS_OUTPUT.PUT_LINE('✗ USER_INBOX view NOT found');
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('');
END;
/

-- Test 4: Verify triggers exist
DECLARE
    v_count NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Triggers Check ===');
    DBMS_OUTPUT.PUT_LINE('');
    
    SELECT COUNT(*) INTO v_count FROM user_triggers WHERE trigger_name = 'TRG_LOW_STOCK_ALERT';
    IF v_count = 1 THEN
        DBMS_OUTPUT.PUT_LINE('✓ TRG_LOW_STOCK_ALERT trigger exists');
    ELSE
        DBMS_OUTPUT.PUT_LINE('✗ TRG_LOW_STOCK_ALERT trigger NOT found');
    END IF;
    
    SELECT COUNT(*) INTO v_count FROM user_triggers WHERE trigger_name = 'TRG_ORDER_STATUS_NOTIFICATION';
    IF v_count = 1 THEN
        DBMS_OUTPUT.PUT_LINE('✓ TRG_ORDER_STATUS_NOTIFICATION trigger exists');
    ELSE
        DBMS_OUTPUT.PUT_LINE('✗ TRG_ORDER_STATUS_NOTIFICATION trigger NOT found');
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('');
END;
/

-- Test 5: Test sending a message
DECLARE
    v_message_id NUMBER;
    v_admin_id NUMBER;
    v_manager_id NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Testing Message Send ===');
    DBMS_OUTPUT.PUT_LINE('');
    
    -- Get admin and manager user IDs
    SELECT user_id INTO v_admin_id FROM app_users WHERE username = 'admin';
    SELECT user_id INTO v_manager_id FROM app_users WHERE username = 'manager';
    
    -- Insert test message
    INSERT INTO messages (message_id, sender_id, message_text, message_type, priority, is_broadcast)
    VALUES (message_seq.NEXTVAL, v_admin_id, 'This is a test message from the chat system!', 
            'GENERAL', 'NORMAL', 0)
    RETURNING message_id INTO v_message_id;
    
    DBMS_OUTPUT.PUT_LINE('✓ Test message created with ID: ' || v_message_id);
    
    -- Insert recipient
    INSERT INTO message_recipients (recipient_id, message_id, user_id)
    VALUES (recipient_seq.NEXTVAL, v_message_id, v_manager_id);
    
    DBMS_OUTPUT.PUT_LINE('✓ Recipient added for test message');
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('✓ Test message sent successfully!');
    DBMS_OUTPUT.PUT_LINE('');
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('✗ Error sending test message: ' || SQLERRM);
        ROLLBACK;
END;
/

-- Test 6: View unread counts
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Unread Message Counts ===');
    DBMS_OUTPUT.PUT_LINE('');
    
    FOR rec IN (SELECT * FROM user_unread_count WHERE unread_count > 0) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.full_name || ' (' || rec.username || '): ' || rec.unread_count || ' unread');
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('');
END;
/

-- Test 7: Test low stock alert trigger
DECLARE
    v_inventory_id NUMBER;
    v_old_quantity NUMBER;
    v_reorder_level NUMBER;
    v_message_count NUMBER;
    v_message_count_before NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Testing Low Stock Alert Trigger ===');
    DBMS_OUTPUT.PUT_LINE('');
    
    -- Get current message count
    SELECT COUNT(*) INTO v_message_count_before FROM messages WHERE message_type = 'LOW_STOCK_ALERT';
    
    -- Find an inventory item to test with
    SELECT inventory_id, quantity, reorder_level 
    INTO v_inventory_id, v_old_quantity, v_reorder_level
    FROM inventory 
    WHERE ROWNUM = 1;
    
    DBMS_OUTPUT.PUT_LINE('Testing with inventory_id: ' || v_inventory_id);
    DBMS_OUTPUT.PUT_LINE('Current quantity: ' || v_old_quantity);
    DBMS_OUTPUT.PUT_LINE('Reorder level: ' || v_reorder_level);
    
    -- Update to trigger alert (set quantity to reorder level - 1)
    UPDATE inventory 
    SET quantity = CASE 
        WHEN reorder_level > 1 THEN reorder_level - 1 
        ELSE 0 
    END
    WHERE inventory_id = v_inventory_id;
    
    COMMIT;
    
    -- Check if alert was created
    SELECT COUNT(*) INTO v_message_count FROM messages WHERE message_type = 'LOW_STOCK_ALERT';
    
    IF v_message_count > v_message_count_before THEN
        DBMS_OUTPUT.PUT_LINE('✓ Low stock alert trigger working! Alert created.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('⚠ No new alert created (may already be at low stock)');
    END IF;
    
    -- Restore original quantity
    UPDATE inventory SET quantity = v_old_quantity WHERE inventory_id = v_inventory_id;
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('✓ Test completed, inventory restored');
    DBMS_OUTPUT.PUT_LINE('');
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('✗ Error testing trigger: ' || SQLERRM);
        ROLLBACK;
END;
/

-- Test 8: Display recent messages
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Recent Messages ===');
    DBMS_OUTPUT.PUT_LINE('');
    
    FOR msg IN (
        SELECT sender_name, message_text, message_type, sent_at
        FROM message_details
        WHERE ROWNUM <= 5
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('From: ' || msg.sender_name);
        DBMS_OUTPUT.PUT_LINE('Type: ' || msg.message_type);
        DBMS_OUTPUT.PUT_LINE('Message: ' || SUBSTR(msg.message_text, 1, 100));
        DBMS_OUTPUT.PUT_LINE('Time: ' || TO_CHAR(msg.sent_at, 'YYYY-MM-DD HH24:MI:SS'));
        DBMS_OUTPUT.PUT_LINE('---');
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('');
END;
/

-- Summary
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Chat System Test Summary ===');
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('If all checks passed (✓), your chat system is ready!');
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('Next steps:');
    DBMS_OUTPUT.PUT_LINE('1. Install Flask-SocketIO: run install_chat.bat');
    DBMS_OUTPUT.PUT_LINE('2. Start the application: python app.py');
    DBMS_OUTPUT.PUT_LINE('3. Login and access: http://localhost:5000/chat');
    DBMS_OUTPUT.PUT_LINE('');
END;
/
