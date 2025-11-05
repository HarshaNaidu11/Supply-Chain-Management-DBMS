-- =====================================================
-- EXPANDED SAMPLE DATA - 100+ Records Per Table
-- For Supply Chain Management DBMS
-- =====================================================

PROMPT ========================================
PROMPT Inserting 100 Suppliers...
PROMPT ========================================

-- Insert 100 suppliers
BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO suppliers VALUES (
            supplier_seq.NEXTVAL,
            'Supplier Company ' || i,
            'Contact Person ' || i,
            'contact' || i || '@supplier' || i || '.com',
            '555-' || LPAD(i, 4, '0'),
            i || ' Business Street',
            CASE MOD(i, 10)
                WHEN 0 THEN 'New York'
                WHEN 1 THEN 'Los Angeles'
                WHEN 2 THEN 'Chicago'
                WHEN 3 THEN 'Houston'
                WHEN 4 THEN 'Phoenix'
                WHEN 5 THEN 'Philadelphia'
                WHEN 6 THEN 'San Antonio'
                WHEN 7 THEN 'San Diego'
                WHEN 8 THEN 'Dallas'
                ELSE 'San Jose'
            END,
            CASE MOD(i, 5)
                WHEN 0 THEN 'USA'
                WHEN 1 THEN 'Canada'
                WHEN 2 THEN 'Mexico'
                WHEN 3 THEN 'UK'
                ELSE 'Germany'
            END,
            ROUND(DBMS_RANDOM.VALUE(3.0, 5.0), 1),
            SYSDATE - DBMS_RANDOM.VALUE(1, 365)
        );
    END LOOP;
    COMMIT;
END;
/

PROMPT ========================================
PROMPT Inserting 100 Warehouses...
PROMPT ========================================

-- Insert 100 warehouses
BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO warehouses VALUES (
            warehouse_seq.NEXTVAL,
            'Warehouse ' || i,
            i || ' Storage Avenue',
            CASE MOD(i, 15)
                WHEN 0 THEN 'New York'
                WHEN 1 THEN 'Los Angeles'
                WHEN 2 THEN 'Chicago'
                WHEN 3 THEN 'Houston'
                WHEN 4 THEN 'Phoenix'
                WHEN 5 THEN 'Philadelphia'
                WHEN 6 THEN 'San Antonio'
                WHEN 7 THEN 'San Diego'
                WHEN 8 THEN 'Dallas'
                WHEN 9 THEN 'San Jose'
                WHEN 10 THEN 'Austin'
                WHEN 11 THEN 'Jacksonville'
                WHEN 12 THEN 'Fort Worth'
                WHEN 13 THEN 'Columbus'
                ELSE 'Charlotte'
            END,
            ROUND(DBMS_RANDOM.VALUE(20000, 100000), -3),
            'Manager ' || i,
            '555-2' || LPAD(i, 3, '0')
        );
    END LOOP;
    COMMIT;
END;
/

PROMPT ========================================
PROMPT Inserting 100 Products...
PROMPT ========================================

-- Insert 100 products
BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO products VALUES (
            product_seq.NEXTVAL,
            CASE MOD(i, 10)
                WHEN 0 THEN 'Laptop Model ' || i
                WHEN 1 THEN 'Monitor ' || i
                WHEN 2 THEN 'Mouse ' || i
                WHEN 3 THEN 'Keyboard ' || i
                WHEN 4 THEN 'Cable Type ' || i
                WHEN 5 THEN 'Webcam ' || i
                WHEN 6 THEN 'Headset ' || i
                WHEN 7 THEN 'Adapter ' || i
                WHEN 8 THEN 'Storage Device ' || i
                ELSE 'Accessory ' || i
            END,
            CASE MOD(i, 5)
                WHEN 0 THEN 'Electronics'
                WHEN 1 THEN 'Accessories'
                WHEN 2 THEN 'Cables'
                WHEN 3 THEN 'Storage'
                ELSE 'Peripherals'
            END,
            MOD(i, 100) + 1, -- supplier_id (1-100)
            ROUND(DBMS_RANDOM.VALUE(9.99, 999.99), 2),
            'Product description for item ' || i
        );
    END LOOP;
    COMMIT;
END;
/

PROMPT ========================================
PROMPT Inserting 100+ Inventory Records...
PROMPT ========================================

-- Insert inventory (100 products x 100 warehouses = 10000, but we'll do 150 records)
BEGIN
    FOR i IN 1..150 LOOP
        INSERT INTO inventory VALUES (
            inventory_seq.NEXTVAL,
            MOD(i, 100) + 1, -- product_id (1-100)
            MOD(i, 100) + 1, -- warehouse_id (1-100)
            ROUND(DBMS_RANDOM.VALUE(5, 200)),
            ROUND(DBMS_RANDOM.VALUE(10, 30)),
            SYSDATE - DBMS_RANDOM.VALUE(1, 30)
        );
    END LOOP;
    COMMIT;
END;
/

PROMPT ========================================
PROMPT Inserting 100 Orders...
PROMPT ========================================

-- Insert 100 orders
BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO orders VALUES (
            order_seq.NEXTVAL,
            MOD(i, 100) + 1, -- supplier_id (1-100)
            MOD(i, 100) + 1, -- warehouse_id (1-100)
            SYSDATE - DBMS_RANDOM.VALUE(1, 90),
            CASE MOD(i, 5)
                WHEN 0 THEN 'PENDING'
                WHEN 1 THEN 'CONFIRMED'
                WHEN 2 THEN 'SHIPPED'
                WHEN 3 THEN 'DELIVERED'
                ELSE 'CANCELLED'
            END,
            ROUND(DBMS_RANDOM.VALUE(500, 10000), 2),
            CASE WHEN MOD(i, 5) IN (2, 3) THEN SYSDATE + DBMS_RANDOM.VALUE(1, 30) ELSE NULL END
        );
    END LOOP;
    COMMIT;
END;
/

PROMPT ========================================
PROMPT Inserting 150 Order Details...
PROMPT ========================================

-- Insert 150 order details (multiple items per order)
BEGIN
    FOR i IN 1..150 LOOP
        DECLARE
            v_unit_price NUMBER;
            v_quantity NUMBER;
        BEGIN
            v_quantity := ROUND(DBMS_RANDOM.VALUE(1, 20));
            v_unit_price := ROUND(DBMS_RANDOM.VALUE(10, 500), 2);
            
            INSERT INTO order_details VALUES (
                detail_seq.NEXTVAL,
                MOD(i, 100) + 1, -- order_id (1-100)
                MOD(i, 100) + 1, -- product_id (1-100)
                v_quantity,
                v_unit_price,
                v_quantity * v_unit_price
            );
        END;
    END LOOP;
    COMMIT;
END;
/

PROMPT ========================================
PROMPT Inserting 100 Shipments...
PROMPT ========================================

-- Insert 100 shipments
BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO shipments VALUES (
            shipment_seq.NEXTVAL,
            i, -- order_id
            CASE MOD(i, 5)
                WHEN 0 THEN 'FedEx'
                WHEN 1 THEN 'UPS'
                WHEN 2 THEN 'DHL'
                WHEN 3 THEN 'USPS'
                ELSE 'Local Courier'
            END,
            'TRACK' || LPAD(i, 10, '0'),
            SYSDATE - DBMS_RANDOM.VALUE(1, 60),
            CASE WHEN MOD(i, 3) = 0 THEN SYSDATE - DBMS_RANDOM.VALUE(1, 30) ELSE NULL END,
            CASE MOD(i, 4)
                WHEN 0 THEN 'PREPARING'
                WHEN 1 THEN 'IN_TRANSIT'
                WHEN 2 THEN 'DELIVERED'
                ELSE 'DELAYED'
            END
        );
    END LOOP;
    COMMIT;
END;
/

PROMPT ========================================
PROMPT Data Loading Complete!
PROMPT ========================================
PROMPT
PROMPT Summary:
PROMPT - 100 Suppliers
PROMPT - 100 Warehouses  
PROMPT - 100 Products
PROMPT - 150 Inventory Records
PROMPT - 100 Orders
PROMPT - 150 Order Details
PROMPT - 100 Shipments
PROMPT ========================================

COMMIT;
