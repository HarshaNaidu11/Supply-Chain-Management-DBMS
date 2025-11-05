-- Transaction Control Examples (TCL - Transaction Control Language)

-- Example 1: Successful order creation with commit
BEGIN
    -- Start transaction
    INSERT INTO orders (order_id, supplier_id, warehouse_id, order_date, status, total_amount)
    VALUES (order_seq.NEXTVAL, 1, 1, SYSDATE, 'PENDING', 0);
    
    -- Add order items
    INSERT INTO order_details (detail_id, order_id, product_id, quantity, unit_price, subtotal)
    VALUES (detail_seq.NEXTVAL, order_seq.CURRVAL, 1, 5, 899.99, 4499.95);
    
    -- Update order total
    UPDATE orders 
    SET total_amount = (SELECT SUM(subtotal) FROM order_details WHERE order_id = order_seq.CURRVAL)
    WHERE order_id = order_seq.CURRVAL;
    
    -- Commit the transaction
    COMMIT;
END;
/

-- Example 2: Rollback on error
BEGIN
    -- Start transaction
    INSERT INTO inventory (inventory_id, product_id, warehouse_id, quantity)
    VALUES (inventory_seq.NEXTVAL, 1, 1, 100);
    
    -- Simulate error condition
    -- If something goes wrong, rollback
    ROLLBACK;
END;
/

-- Example 3: Update inventory with transaction control
BEGIN
    -- Reduce inventory when order is shipped
    UPDATE inventory 
    SET quantity = quantity - 10
    WHERE product_id = 1 AND warehouse_id = 1;
    
    -- Check if inventory went below zero
    DECLARE
        v_qty NUMBER;
    BEGIN
        SELECT quantity INTO v_qty 
        FROM inventory 
        WHERE product_id = 1 AND warehouse_id = 1;
        
        IF v_qty < 0 THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Insufficient inventory, transaction rolled back');
        ELSE
            COMMIT;
            DBMS_OUTPUT.PUT_LINE('Inventory updated successfully');
        END IF;
    END;
END;
/

-- Example 4: Savepoint usage
BEGIN
    -- Create savepoint
    SAVEPOINT before_update;
    
    UPDATE products SET unit_price = unit_price * 1.1;
    
    -- If we want to undo this specific update
    ROLLBACK TO SAVEPOINT before_update;
    
    -- Continue with other operations
    INSERT INTO suppliers (supplier_id, name) 
    VALUES (supplier_seq.NEXTVAL, 'New Supplier');
    
    COMMIT;
END;
/

-- Example 5: Set transaction read only
SET TRANSACTION READ ONLY;
SELECT * FROM suppliers;
SELECT * FROM products;
COMMIT;

-- Example 6: Batch processing with transaction control
DECLARE
    v_error_count NUMBER := 0;
BEGIN
    FOR rec IN (SELECT product_id FROM products WHERE unit_price < 50) LOOP
        BEGIN
            UPDATE products 
            SET unit_price = unit_price * 1.05 
            WHERE product_id = rec.product_id;
        EXCEPTION
            WHEN OTHERS THEN
                v_error_count := v_error_count + 1;
        END;
    END LOOP;
    
    IF v_error_count = 0 THEN
        COMMIT;
    ELSE
        ROLLBACK;
    END IF;
END;
/
