-- Drop existing tables
DROP TABLE shipments CASCADE CONSTRAINTS;
DROP TABLE order_details CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE inventory CASCADE CONSTRAINTS;
DROP TABLE products CASCADE CONSTRAINTS;
DROP TABLE warehouses CASCADE CONSTRAINTS;
DROP TABLE suppliers CASCADE CONSTRAINTS;

-- Suppliers table
CREATE TABLE suppliers (
    supplier_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    contact_person VARCHAR2(100),
    email VARCHAR2(100),
    phone VARCHAR2(20),
    address VARCHAR2(200),
    city VARCHAR2(50),
    country VARCHAR2(50),
    rating NUMBER(2,1) CHECK (rating BETWEEN 0 AND 5),
    created_at DATE DEFAULT SYSDATE
);

-- Warehouses table
CREATE TABLE warehouses (
    warehouse_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    location VARCHAR2(100),
    city VARCHAR2(50),
    capacity NUMBER NOT NULL,
    manager VARCHAR2(100),
    phone VARCHAR2(20)
);

-- Products table
CREATE TABLE products (
    product_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    category VARCHAR2(50),
    supplier_id NUMBER,
    unit_price NUMBER(10,2) CHECK (unit_price >= 0),
    description VARCHAR2(255),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

-- Inventory table
CREATE TABLE inventory (
    inventory_id NUMBER PRIMARY KEY,
    product_id NUMBER NOT NULL,
    warehouse_id NUMBER NOT NULL,
    quantity NUMBER DEFAULT 0 CHECK (quantity >= 0),
    reorder_level NUMBER DEFAULT 10,
    last_updated DATE DEFAULT SYSDATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id),
    UNIQUE (product_id, warehouse_id)
);

-- Orders table
CREATE TABLE orders (
    order_id NUMBER PRIMARY KEY,
    supplier_id NUMBER,
    warehouse_id NUMBER,
    order_date DATE DEFAULT SYSDATE,
    status VARCHAR2(20) DEFAULT 'PENDING',
    total_amount NUMBER(12,2) DEFAULT 0,
    delivery_date DATE,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id),
    CHECK (status IN ('PENDING', 'CONFIRMED', 'SHIPPED', 'DELIVERED', 'CANCELLED'))
);

-- Order Details table
CREATE TABLE order_details (
    detail_id NUMBER PRIMARY KEY,
    order_id NUMBER NOT NULL,
    product_id NUMBER NOT NULL,
    quantity NUMBER CHECK (quantity > 0),
    unit_price NUMBER(10,2),
    subtotal NUMBER(12,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Shipments table
CREATE TABLE shipments (
    shipment_id NUMBER PRIMARY KEY,
    order_id NUMBER NOT NULL,
    carrier VARCHAR2(100),
    tracking_number VARCHAR2(50),
    ship_date DATE DEFAULT SYSDATE,
    delivery_date DATE,
    status VARCHAR2(20) DEFAULT 'IN_TRANSIT',
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    CHECK (status IN ('PREPARING', 'IN_TRANSIT', 'DELIVERED', 'DELAYED'))
);

-- Create sequences for auto-increment
CREATE SEQUENCE supplier_seq START WITH 1;
CREATE SEQUENCE warehouse_seq START WITH 1;
CREATE SEQUENCE product_seq START WITH 1;
CREATE SEQUENCE inventory_seq START WITH 1;
CREATE SEQUENCE order_seq START WITH 1;
CREATE SEQUENCE detail_seq START WITH 1;
CREATE SEQUENCE shipment_seq START WITH 1;

-- Indexes for performance
CREATE INDEX idx_product_supplier ON products(supplier_id);
CREATE INDEX idx_inventory_product ON inventory(product_id);
CREATE INDEX idx_inventory_warehouse ON inventory(warehouse_id);
CREATE INDEX idx_order_supplier ON orders(supplier_id);
CREATE INDEX idx_detail_order ON order_details(order_id);

-- Views for common queries
CREATE OR REPLACE VIEW low_stock_items AS
SELECT 
    i.inventory_id,
    p.name AS product_name,
    w.name AS warehouse_name,
    i.quantity,
    i.reorder_level
FROM inventory i
JOIN products p ON i.product_id = p.product_id
JOIN warehouses w ON i.warehouse_id = w.warehouse_id
WHERE i.quantity <= i.reorder_level;

CREATE OR REPLACE VIEW order_summary AS
SELECT 
    o.order_id,
    s.name AS supplier_name,
    w.name AS warehouse_name,
    o.order_date,
    o.status,
    o.total_amount,
    COUNT(od.detail_id) AS total_items
FROM orders o
LEFT JOIN suppliers s ON o.supplier_id = s.supplier_id
LEFT JOIN warehouses w ON o.warehouse_id = w.warehouse_id
LEFT JOIN order_details od ON o.order_id = od.order_id
GROUP BY o.order_id, s.name, w.name, o.order_date, o.status, o.total_amount;

CREATE OR REPLACE VIEW supplier_performance AS
SELECT 
    s.supplier_id,
    s.name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_value,
    AVG(o.total_amount) AS avg_order_value,
    s.rating
FROM suppliers s
LEFT JOIN orders o ON s.supplier_id = o.supplier_id
GROUP BY s.supplier_id, s.name, s.rating;

COMMIT;
