-- =====================================================
-- LARGE SAMPLE DATA FOR SUPPLY CHAIN MANAGEMENT DBMS
-- 500+ Records for Better Analytics and Demonstration
-- =====================================================

-- Clear existing data (optional - comment out if you want to keep existing data)
-- DELETE FROM shipments;
-- DELETE FROM order_details;
-- DELETE FROM orders;
-- DELETE FROM inventory;
-- DELETE FROM products;
-- DELETE FROM warehouses;
-- DELETE FROM suppliers;

-- Reset sequences
-- ALTER SEQUENCE supplier_seq RESTART START WITH 1;
-- ALTER SEQUENCE warehouse_seq RESTART START WITH 1;
-- ALTER SEQUENCE product_seq RESTART START WITH 1;
-- ALTER SEQUENCE inventory_seq RESTART START WITH 1;
-- ALTER SEQUENCE order_seq RESTART START WITH 1;
-- ALTER SEQUENCE detail_seq RESTART START WITH 1;
-- ALTER SEQUENCE shipment_seq RESTART START WITH 1;

PROMPT ========================================
PROMPT Inserting 50 Suppliers...
PROMPT ========================================

-- 50 Suppliers from different countries
INSERT ALL
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Global Electronics Ltd', 'John Smith', 'john@globalelec.com', '+1-555-0101', '123 Tech Street, San Jose, CA', 4.5)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Asian Components Inc', 'Li Wei', 'li.wei@asiancomp.cn', '+86-21-5555-0102', '456 Manufacturing Rd, Shenzhen, China', 4.8)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Euro Parts GmbH', 'Hans Mueller', 'hans@europarts.de', '+49-89-555-0103', '789 Industrial Ave, Munich, Germany', 4.2)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Pacific Supplies Co', 'Yuki Tanaka', 'yuki@pacificsup.jp', '+81-3-5555-0104', '321 Supply Lane, Tokyo, Japan', 4.6)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'American Wholesale', 'Maria Garcia', 'maria@amwholesale.com', '+1-555-0105', '654 Commerce Blvd, Dallas, TX', 4.3)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'British Manufacturing', 'James Wilson', 'james@britishman.uk', '+44-20-5555-0106', '987 Factory St, London, UK', 4.7)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Indian Tech Solutions', 'Raj Patel', 'raj@indiatech.in', '+91-22-5555-0107', '147 IT Park, Mumbai, India', 4.4)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Canadian Resources', 'Sophie Martin', 'sophie@canresources.ca', '+1-416-555-0108', '258 Resource Ave, Toronto, Canada', 4.5)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Australian Traders', 'Jack Anderson', 'jack@austraders.au', '+61-2-5555-0109', '369 Trade St, Sydney, Australia', 4.1)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Nordic Supplies AB', 'Erik Johansson', 'erik@nordicsup.se', '+46-8-5555-0110', '741 Nordic Way, Stockholm, Sweden', 4.6)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Latin America Exports', 'Carlos Rodriguez', 'carlos@latinexp.br', '+55-11-5555-0111', '852 Export Rd, Sao Paulo, Brazil', 4.0)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Middle East Trading', 'Ahmed Hassan', 'ahmed@metrading.ae', '+971-4-555-0112', '963 Trade Center, Dubai, UAE', 4.5)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'African Commodities', 'Mandla Nkosi', 'mandla@africacom.za', '+27-11-555-0113', '159 Commodity St, Johannesburg, SA', 3.9)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Korean Electronics', 'Kim Min-jun', 'kim@koreanelec.kr', '+82-2-5555-0114', '357 Electronics Rd, Seoul, Korea', 4.9)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'French Components', 'Pierre Dubois', 'pierre@frenchcomp.fr', '+33-1-5555-0115', '486 Component Ave, Paris, France', 4.3)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Italian Designs', 'Giuseppe Rossi', 'giuseppe@italiandesign.it', '+39-02-555-0116', '753 Design Blvd, Milan, Italy', 4.7)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Spanish Distributors', 'Juan Martinez', 'juan@spandist.es', '+34-91-555-0117', '951 Distribution St, Madrid, Spain', 4.2)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Dutch Logistics', 'Jan van der Berg', 'jan@dutchlog.nl', '+31-20-555-0118', '842 Logistics Way, Amsterdam, Netherlands', 4.8)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Swiss Precision Parts', 'Hans Schmidt', 'hans@swissprec.ch', '+41-44-555-0119', '673 Precision Rd, Zurich, Switzerland', 4.9)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Polish Manufacturing', 'Anna Kowalski', 'anna@polishman.pl', '+48-22-555-0120', '514 Factory Lane, Warsaw, Poland', 4.1)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Turkish Textiles', 'Mehmet Yilmaz', 'mehmet@turktext.tr', '+90-212-555-0121', '825 Textile St, Istanbul, Turkey', 4.0)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Mexican Suppliers', 'Diego Hernandez', 'diego@mexsup.mx', '+52-55-555-0122', '936 Supply Ave, Mexico City, Mexico', 4.4)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Argentine Exports', 'Isabella Fernandez', 'isabella@argexp.ar', '+54-11-555-0123', '147 Export Blvd, Buenos Aires, Argentina', 4.2)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Chilean Resources', 'Mateo Silva', 'mateo@chileresources.cl', '+56-2-555-0124', '258 Resource St, Santiago, Chile', 4.3)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Colombian Trading', 'Sofia Lopez', 'sofia@coltrade.co', '+57-1-555-0125', '369 Trading Way, Bogota, Colombia', 4.1)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Thai Components', 'Somchai Wong', 'somchai@thaicomp.th', '+66-2-555-0126', '741 Component Rd, Bangkok, Thailand', 4.5)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Vietnamese Manufacturing', 'Nguyen Van', 'nguyen@vietnamman.vn', '+84-24-555-0127', '852 Manufacturing St, Hanoi, Vietnam', 4.6)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Indonesian Supplies', 'Budi Santoso', 'budi@indosup.id', '+62-21-555-0128', '963 Supply Lane, Jakarta, Indonesia', 4.0)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Malaysian Electronics', 'Ahmad Abdullah', 'ahmad@malayelec.my', '+60-3-555-0129', '159 Electronics Ave, Kuala Lumpur, Malaysia', 4.4)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Singapore Tech', 'Tan Wei Ming', 'tan@singtech.sg', '+65-6555-0130', '357 Tech Park, Singapore', 4.8)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'New Zealand Traders', 'Oliver Brown', 'oliver@nztrade.nz', '+64-9-555-0131', '486 Trade St, Auckland, New Zealand', 4.2)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Irish Components', 'Liam O''Connor', 'liam@irishcomp.ie', '+353-1-555-0132', '753 Component Way, Dublin, Ireland', 4.5)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Portuguese Supplies', 'Joao Santos', 'joao@portsup.pt', '+351-21-555-0133', '951 Supply Blvd, Lisbon, Portugal', 4.1)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Greek Trading', 'Dimitris Papadopoulos', 'dimitris@greektrade.gr', '+30-210-555-0134', '842 Trading Rd, Athens, Greece', 3.9)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Czech Manufacturing', 'Petr Novak', 'petr@czechman.cz', '+420-2-555-0135', '673 Factory Ave, Prague, Czech Republic', 4.3)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Hungarian Electronics', 'Laszlo Nagy', 'laszlo@hunelec.hu', '+36-1-555-0136', '514 Electronics St, Budapest, Hungary', 4.4)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Romanian Components', 'Ion Popescu', 'ion@rocomp.ro', '+40-21-555-0137', '825 Component Lane, Bucharest, Romania', 4.0)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Bulgarian Supplies', 'Georgi Ivanov', 'georgi@bulsup.bg', '+359-2-555-0138', '936 Supply Way, Sofia, Bulgaria', 3.8)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Austrian Precision', 'Franz Weber', 'franz@austrianprec.at', '+43-1-555-0139', '147 Precision St, Vienna, Austria', 4.7)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Belgian Logistics', 'Marc Dubois', 'marc@belglog.be', '+32-2-555-0140', '258 Logistics Rd, Brussels, Belgium', 4.5)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Danish Components', 'Lars Nielsen', 'lars@dancomp.dk', '+45-3555-0141', '369 Component Ave, Copenhagen, Denmark', 4.6)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Finnish Tech', 'Mika Virtanen', 'mika@fintech.fi', '+358-9-555-0142', '741 Tech Blvd, Helsinki, Finland', 4.8)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Norwegian Supplies', 'Erik Hansen', 'erik@norsup.no', '+47-2255-0143', '852 Supply St, Oslo, Norway', 4.4)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Israeli Electronics', 'David Cohen', 'david@israelelec.il', '+972-3-555-0144', '963 Electronics Way, Tel Aviv, Israel', 4.7)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Egyptian Trading', 'Mohamed Ali', 'mohamed@egypttrade.eg', '+20-2-555-0145', '159 Trading Rd, Cairo, Egypt', 4.0)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Moroccan Components', 'Fatima Benali', 'fatima@moroccocomp.ma', '+212-5-555-0146', '357 Component Lane, Casablanca, Morocco', 4.2)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Kenyan Supplies', 'James Mwangi', 'james@kenyasup.ke', '+254-20-555-0147', '486 Supply Ave, Nairobi, Kenya', 3.9)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Nigerian Trading', 'Oluwaseun Adeyemi', 'oluwaseun@nigeriatrade.ng', '+234-1-555-0148', '753 Trading Blvd, Lagos, Nigeria', 4.1)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Saudi Components', 'Abdullah Al-Rashid', 'abdullah@saudicomp.sa', '+966-11-555-0149', '951 Component St, Riyadh, Saudi Arabia', 4.5)
    INTO suppliers VALUES (supplier_seq.NEXTVAL, 'Qatari Electronics', 'Khalid Al-Thani', 'khalid@qatarelec.qa', '+974-4555-0150', '842 Electronics Way, Doha, Qatar', 4.6)
SELECT * FROM dual;

COMMIT;

PROMPT ========================================
PROMPT Inserting 20 Warehouses...
PROMPT ========================================

-- 20 Warehouses across different locations
INSERT ALL
    INTO warehouses VALUES (warehouse_seq.NEXTVAL, 'North America Hub', 'Los Angeles, CA', 50000, 'Main distribution center for West Coast')
    INTO warehouses VALUES (warehouse_seq.NEXTVAL, 'East Coast Depot', 'New York, NY', 45000, 'Primary hub for East Coast operations')
    INTO warehouses VALUES (warehouse_seq.NEXTVAL, 'Central Warehouse', 'Chicago, IL', 40000, 'Midwest distribution center')
    INTO warehouses VALUES (warehouse_seq.NEXTVAL, 'Texas Distribution', 'Dallas, TX', 35000, 'Southern region hub')
    INTO warehouses VALUES (warehouse_seq.NEXTVAL, 'Pacific Northwest', 'Seattle, WA', 30000, 'Northwest operations center')
    INTO warehouses VALUES (warehouse_seq.NEXTVAL, 'European Hub', 'Rotterdam, Netherlands', 55000, 'Main European distribution center')
    INTO warehouses VALUES (warehouse_seq.NEXTVAL, 'UK Distribution', 'London, UK', 38000, 'British Isles operations')
    INTO warehouses VALUES (warehouse_seq.NEXTVAL, 'German Logistics', 'Hamburg, Germany', 42000, 'Central European hub')
    INTO warehouses VALUES (warehouse_seq.NEXTVAL, 'Asian Pacific Hub', 'Shanghai, China', 60000, 'Largest Asian distribution center')
    INTO warehouses VALUES (warehouse_seq.NEXTVAL, 'Southeast Asia Depot', 'Singapore', 35000, 'ASEAN region hub')
    INTO warehouses VALUES (warehouse_seq.NEXTVAL, 'Japanese Warehouse', 'Tokyo, Japan', 32000, 'Japan operations center')
    INTO warehouses VALUES (warehouse_seq.NEXTVAL, 'Australian Hub', 'Sydney, Australia', 28000, 'Oceania distribution')
    INTO warehouses VALUES (warehouse_seq.NEXTVAL, 'Middle East Center', 'Dubai, UAE', 40000, 'Gulf region hub')
    INTO warehouses VALUES (warehouse_seq.NEXTVAL, 'South American Hub', 'Sao Paulo, Brazil', 38000, 'Latin America distribution')
    INTO warehouses VALUES (warehouse_seq.NEXTVAL, 'Mexican Depot', 'Mexico City, Mexico', 30000, 'North Latin America hub')
    INTO warehouses VALUES (warehouse_seq.NEXTVAL, 'Canadian Warehouse', 'Toronto, Canada', 35000, 'Canadian operations')
    INTO warehouses VALUES (warehouse_seq.NEXTVAL, 'Indian Logistics', 'Mumbai, India', 45000, 'South Asian hub')
    INTO warehouses VALUES (warehouse_seq.NEXTVAL, 'Korean Center', 'Seoul, South Korea', 32000, 'Korean peninsula operations')
    INTO warehouses VALUES (warehouse_seq.NEXTVAL, 'African Hub', 'Johannesburg, South Africa', 28000, 'African continent distribution')
    INTO warehouses VALUES (warehouse_seq.NEXTVAL, 'Nordic Warehouse', 'Stockholm, Sweden', 25000, 'Scandinavian operations')
SELECT * FROM dual;

COMMIT;

PROMPT ========================================
PROMPT Inserting 100 Products...
PROMPT ========================================

-- 100 Products across different categories
BEGIN
    FOR i IN 1..100 LOOP
        IF MOD(i, 5) = 0 THEN
            INSERT INTO products VALUES (product_seq.NEXTVAL, 
                'Electronics Product ' || i, 
                'Electronics', 
                ROUND(DBMS_RANDOM.VALUE(50, 2000), 2),
                'High-quality electronic component #' || i);
        ELSIF MOD(i, 5) = 1 THEN
            INSERT INTO products VALUES (product_seq.NEXTVAL, 
                'Furniture Item ' || i, 
                'Furniture', 
                ROUND(DBMS_RANDOM.VALUE(100, 5000), 2),
                'Premium furniture piece #' || i);
        ELSIF MOD(i, 5) = 2 THEN
            INSERT INTO products VALUES (product_seq.NEXTVAL, 
                'Clothing Article ' || i, 
                'Clothing', 
                ROUND(DBMS_RANDOM.VALUE(20, 500), 2),
                'Fashion clothing item #' || i);
        ELSIF MOD(i, 5) = 3 THEN
            INSERT INTO products VALUES (product_seq.NEXTVAL, 
                'Food Product ' || i, 
                'Food', 
                ROUND(DBMS_RANDOM.VALUE(5, 200), 2),
                'Quality food item #' || i);
        ELSE
            INSERT INTO products VALUES (product_seq.NEXTVAL, 
                'Industrial Tool ' || i, 
                'Industrial', 
                ROUND(DBMS_RANDOM.VALUE(100, 10000), 2),
                'Professional tool #' || i);
        END IF;
    END LOOP;
    COMMIT;
END;
/

PROMPT ========================================
PROMPT Inserting 400 Inventory Records...
PROMPT ========================================

-- Create inventory records for products across warehouses
DECLARE
    v_product_id NUMBER;
    v_warehouse_id NUMBER;
    v_quantity NUMBER;
    v_reorder_level NUMBER;
    v_count NUMBER := 0;
BEGIN
    -- For each product, create inventory in 4-8 random warehouses
    FOR prod IN (SELECT product_id FROM products ORDER BY product_id) LOOP
        FOR i IN 1..TRUNC(DBMS_RANDOM.VALUE(4, 9)) LOOP
            -- Get a random warehouse
            SELECT warehouse_id INTO v_warehouse_id 
            FROM (SELECT warehouse_id FROM warehouses ORDER BY DBMS_RANDOM.VALUE)
            WHERE ROWNUM = 1;
            
            -- Check if this combination already exists
            SELECT COUNT(*) INTO v_count
            FROM inventory 
            WHERE product_id = prod.product_id AND warehouse_id = v_warehouse_id;
            
            IF v_count = 0 THEN
                v_quantity := TRUNC(DBMS_RANDOM.VALUE(10, 1000));
                v_reorder_level := TRUNC(DBMS_RANDOM.VALUE(50, 200));
                
                INSERT INTO inventory VALUES (
                    inventory_seq.NEXTVAL,
                    prod.product_id,
                    v_warehouse_id,
                    v_quantity,
                    v_reorder_level,
                    SYSTIMESTAMP
                );
            END IF;
        END LOOP;
    END LOOP;
    COMMIT;
END;
/

PROMPT ========================================
PROMPT Inserting 200 Orders...
PROMPT ========================================

-- Generate 200 orders with various statuses
DECLARE
    v_supplier_id NUMBER;
    v_order_date DATE;
    v_delivery_date DATE;
    v_status VARCHAR2(20);
    v_statuses SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST('PENDING', 'CONFIRMED', 'SHIPPED', 'DELIVERED');
BEGIN
    FOR i IN 1..200 LOOP
        -- Random supplier
        SELECT supplier_id INTO v_supplier_id
        FROM (SELECT supplier_id FROM suppliers ORDER BY DBMS_RANDOM.VALUE)
        WHERE ROWNUM = 1;
        
        -- Random date in last 6 months
        v_order_date := SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 180));
        v_delivery_date := v_order_date + TRUNC(DBMS_RANDOM.VALUE(5, 30));
        
        -- Random status (more delivered for older orders)
        IF v_order_date < SYSDATE - 60 THEN
            v_status := 'DELIVERED';
        ELSIF v_order_date < SYSDATE - 30 THEN
            v_status := v_statuses(TRUNC(DBMS_RANDOM.VALUE(2, 5)));
        ELSE
            v_status := v_statuses(TRUNC(DBMS_RANDOM.VALUE(1, 4)));
        END IF;
        
        INSERT INTO orders VALUES (
            order_seq.NEXTVAL,
            v_supplier_id,
            v_order_date,
            v_delivery_date,
            v_status
        );
    END LOOP;
    COMMIT;
END;
/

PROMPT ========================================
PROMPT Inserting 600 Order Details...
PROMPT ========================================

-- Add 3-5 products to each order
DECLARE
    v_product_id NUMBER;
    v_quantity NUMBER;
    v_unit_price NUMBER;
    v_items_per_order NUMBER;
BEGIN
    FOR ord IN (SELECT order_id FROM orders ORDER BY order_id) LOOP
        v_items_per_order := TRUNC(DBMS_RANDOM.VALUE(3, 6));
        
        FOR i IN 1..v_items_per_order LOOP
            -- Get random product
            SELECT product_id, price INTO v_product_id, v_unit_price
            FROM (SELECT product_id, price FROM products ORDER BY DBMS_RANDOM.VALUE)
            WHERE ROWNUM = 1;
            
            v_quantity := TRUNC(DBMS_RANDOM.VALUE(1, 100));
            
            INSERT INTO order_details VALUES (
                detail_seq.NEXTVAL,
                ord.order_id,
                v_product_id,
                v_quantity,
                v_unit_price
            );
        END LOOP;
    END LOOP;
    COMMIT;
END;
/

PROMPT ========================================
PROMPT Inserting 150 Shipments...
PROMPT ========================================

-- Create shipments for confirmed, shipped, and delivered orders
DECLARE
    v_warehouse_id NUMBER;
    v_tracking_number VARCHAR2(50);
    v_carrier VARCHAR2(50);
    v_carriers SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST('FedEx', 'UPS', 'DHL', 'USPS', 'Amazon Logistics', 'Blue Dart');
    v_shipped_date DATE;
    v_delivered_date DATE;
BEGIN
    FOR ord IN (SELECT order_id, order_date, status FROM orders 
                WHERE status IN ('CONFIRMED', 'SHIPPED', 'DELIVERED')) LOOP
        
        -- Random warehouse
        SELECT warehouse_id INTO v_warehouse_id
        FROM (SELECT warehouse_id FROM warehouses ORDER BY DBMS_RANDOM.VALUE)
        WHERE ROWNUM = 1;
        
        -- Random carrier
        v_carrier := v_carriers(TRUNC(DBMS_RANDOM.VALUE(1, 7)));
        
        -- Generate tracking number
        v_tracking_number := v_carrier || '-' || LPAD(TRUNC(DBMS_RANDOM.VALUE(100000000, 999999999)), 9, '0');
        
        -- Set dates
        v_shipped_date := ord.order_date + TRUNC(DBMS_RANDOM.VALUE(2, 7));
        
        IF ord.status = 'DELIVERED' THEN
            v_delivered_date := v_shipped_date + TRUNC(DBMS_RANDOM.VALUE(3, 15));
        ELSE
            v_delivered_date := NULL;
        END IF;
        
        INSERT INTO shipments VALUES (
            shipment_seq.NEXTVAL,
            ord.order_id,
            v_warehouse_id,
            v_carrier,
            v_tracking_number,
            v_shipped_date,
            v_delivered_date
        );
    END LOOP;
    COMMIT;
END;
/

PROMPT ========================================
PROMPT Data Summary
PROMPT ========================================

SELECT 'Suppliers' AS table_name, COUNT(*) AS record_count FROM suppliers
UNION ALL
SELECT 'Warehouses', COUNT(*) FROM warehouses
UNION ALL
SELECT 'Products', COUNT(*) FROM products
UNION ALL
SELECT 'Inventory', COUNT(*) FROM inventory
UNION ALL
SELECT 'Orders', COUNT(*) FROM orders
UNION ALL
SELECT 'Order Details', COUNT(*) FROM order_details
UNION ALL
SELECT 'Shipments', COUNT(*) FROM shipments;

PROMPT ========================================
PROMPT Sample Analytics Queries
PROMPT ========================================

PROMPT Top 10 Products by Total Order Quantity:
SELECT p.product_name, SUM(od.quantity) AS total_quantity, COUNT(DISTINCT od.order_id) AS order_count
FROM products p
JOIN order_details od ON p.product_id = od.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC
FETCH FIRST 10 ROWS ONLY;

PROMPT
PROMPT Top 10 Suppliers by Order Value:
SELECT s.supplier_name, COUNT(DISTINCT o.order_id) AS total_orders, 
       TO_CHAR(SUM(od.quantity * od.unit_price), '$999,999,999.99') AS total_revenue
FROM suppliers s
JOIN orders o ON s.supplier_id = o.supplier_id
JOIN order_details od ON o.order_id = od.order_id
GROUP BY s.supplier_name
ORDER BY SUM(od.quantity * od.unit_price) DESC
FETCH FIRST 10 ROWS ONLY;

PROMPT
PROMPT Warehouse Utilization:
SELECT w.warehouse_name, w.location,
       SUM(i.quantity) AS total_items,
       w.capacity,
       ROUND((SUM(i.quantity) / w.capacity) * 100, 2) AS utilization_percent
FROM warehouses w
LEFT JOIN inventory i ON w.warehouse_id = i.warehouse_id
GROUP BY w.warehouse_name, w.location, w.capacity
ORDER BY utilization_percent DESC;

PROMPT
PROMPT Order Status Distribution:
SELECT status, COUNT(*) AS order_count, 
       TO_CHAR(SUM(od.quantity * od.unit_price), '$999,999,999.99') AS total_value
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
GROUP BY status
ORDER BY order_count DESC;

PROMPT ========================================
PROMPT Large Sample Data Generation Complete!
PROMPT Total Records: 1500+
PROMPT ========================================
