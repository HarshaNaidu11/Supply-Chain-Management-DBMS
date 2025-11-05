-- Enhanced User and Role Management System (DCL)
-- Run this as SYSTEM or DBA user

-- ======================
-- 1. CREATE ORACLE USERS
-- ======================

-- Admin User (Full Access)
CREATE USER scm_admin IDENTIFIED BY Admin@123;
GRANT CONNECT, RESOURCE TO scm_admin;
GRANT CREATE TABLE, CREATE VIEW, CREATE SEQUENCE, CREATE TRIGGER, CREATE PROCEDURE TO scm_admin;
GRANT UNLIMITED TABLESPACE TO scm_admin;

-- Manager User (Read + Update, No Delete)
CREATE USER scm_manager IDENTIFIED BY Manager@123;
GRANT CONNECT TO scm_manager;

-- Warehouse User (Inventory Management Only)
CREATE USER scm_warehouse IDENTIFIED BY Warehouse@123;
GRANT CONNECT TO scm_warehouse;

-- Viewer User (Read-Only Access)
CREATE USER scm_viewer IDENTIFIED BY Viewer@123;
GRANT CONNECT TO scm_viewer;

COMMIT;

-- ====================================
-- 2. CREATE APPLICATION USERS TABLE
-- ====================================
-- This table stores user credentials for the web application
-- Run this as scm_admin user

CREATE TABLE app_users (
    user_id NUMBER PRIMARY KEY,
    username VARCHAR2(50) UNIQUE NOT NULL,
    password VARCHAR2(255) NOT NULL,  -- Store hashed passwords
    full_name VARCHAR2(100) NOT NULL,
    email VARCHAR2(100),
    role VARCHAR2(20) CHECK (role IN ('ADMIN', 'MANAGER', 'WAREHOUSE', 'VIEWER')),
    is_active NUMBER(1) DEFAULT 1 CHECK (is_active IN (0, 1)),
    created_at DATE DEFAULT SYSDATE,
    last_login DATE
);

CREATE SEQUENCE user_seq START WITH 1 INCREMENT BY 1;

-- Insert default users (passwords are plain text here - will be hashed in Python)
-- Default password for all: password123
INSERT INTO app_users (user_id, username, password, full_name, email, role, is_active)
VALUES (user_seq.NEXTVAL, 'admin', 'password123', 'System Administrator', 'admin@scm.com', 'ADMIN', 1);

INSERT INTO app_users (user_id, username, password, full_name, email, role, is_active)
VALUES (user_seq.NEXTVAL, 'manager', 'password123', 'Operations Manager', 'manager@scm.com', 'MANAGER', 1);

INSERT INTO app_users (user_id, username, password, full_name, email, role, is_active)
VALUES (user_seq.NEXTVAL, 'warehouse', 'password123', 'Warehouse Staff', 'warehouse@scm.com', 'WAREHOUSE', 1);

INSERT INTO app_users (user_id, username, password, full_name, email, role, is_active)
VALUES (user_seq.NEXTVAL, 'viewer', 'password123', 'Guest Viewer', 'viewer@scm.com', 'VIEWER', 1);

COMMIT;

-- ====================================
-- 3. GRANT PERMISSIONS TO MANAGERS
-- ====================================
-- Managers can view all, update most, but not delete

GRANT SELECT ON scm_admin.suppliers TO scm_manager;
GRANT SELECT ON scm_admin.products TO scm_manager;
GRANT SELECT ON scm_admin.warehouses TO scm_manager;
GRANT SELECT ON scm_admin.inventory TO scm_manager;
GRANT SELECT ON scm_admin.orders TO scm_manager;
GRANT SELECT ON scm_admin.order_details TO scm_manager;
GRANT SELECT ON scm_admin.shipments TO scm_manager;

GRANT UPDATE ON scm_admin.suppliers TO scm_manager;
GRANT UPDATE ON scm_admin.products TO scm_manager;
GRANT UPDATE ON scm_admin.inventory TO scm_manager;
GRANT UPDATE ON scm_admin.orders TO scm_manager;

GRANT INSERT ON scm_admin.products TO scm_manager;
GRANT INSERT ON scm_admin.orders TO scm_manager;
GRANT INSERT ON scm_admin.order_details TO scm_manager;

-- ====================================
-- 4. GRANT PERMISSIONS TO WAREHOUSE
-- ====================================
-- Warehouse users can only manage inventory

GRANT SELECT ON scm_admin.inventory TO scm_warehouse;
GRANT SELECT ON scm_admin.products TO scm_warehouse;
GRANT SELECT ON scm_admin.warehouses TO scm_warehouse;

GRANT UPDATE ON scm_admin.inventory TO scm_warehouse;

GRANT SELECT ON scm_admin.low_stock_items TO scm_warehouse;

-- ====================================
-- 5. GRANT PERMISSIONS TO VIEWERS
-- ====================================
-- Viewers can only read data

GRANT SELECT ON scm_admin.suppliers TO scm_viewer;
GRANT SELECT ON scm_admin.products TO scm_viewer;
GRANT SELECT ON scm_admin.warehouses TO scm_viewer;
GRANT SELECT ON scm_admin.inventory TO scm_viewer;
GRANT SELECT ON scm_admin.orders TO scm_viewer;
GRANT SELECT ON scm_admin.order_details TO scm_viewer;
GRANT SELECT ON scm_admin.shipments TO scm_viewer;

GRANT SELECT ON scm_admin.low_stock_items TO scm_viewer;
GRANT SELECT ON scm_admin.order_summary TO scm_viewer;
GRANT SELECT ON scm_admin.supplier_performance TO scm_viewer;

COMMIT;

-- ====================================
-- 6. CREATE AUDIT LOG TABLE
-- ====================================

CREATE TABLE audit_log (
    log_id NUMBER PRIMARY KEY,
    user_id NUMBER,
    username VARCHAR2(50),
    action VARCHAR2(100),
    table_name VARCHAR2(50),
    record_id NUMBER,
    action_time DATE DEFAULT SYSDATE,
    ip_address VARCHAR2(50),
    FOREIGN KEY (user_id) REFERENCES app_users(user_id)
);

CREATE SEQUENCE log_seq START WITH 1 INCREMENT BY 1;

-- ====================================
-- ROLE PERMISSIONS SUMMARY
-- ====================================

/*
ADMIN (Full Access):
- All SELECT, INSERT, UPDATE, DELETE operations
- Can manage users
- Can view audit logs
- Can modify schema

MANAGER (Most Operations):
- SELECT: All tables
- INSERT: Products, Orders, Order Details
- UPDATE: Suppliers, Products, Inventory, Orders
- DELETE: None
- View analytics and reports

WAREHOUSE (Inventory Only):
- SELECT: Inventory, Products, Warehouses, Low Stock
- UPDATE: Inventory only
- Cannot delete or add new products

VIEWER (Read-Only):
- SELECT: All tables and views
- No INSERT, UPDATE, or DELETE
- Can view reports and analytics
*/

-- ====================================
-- TO REVOKE PERMISSIONS (Examples)
-- ====================================

-- REVOKE UPDATE ON scm_admin.inventory FROM scm_warehouse;
-- REVOKE SELECT ON scm_admin.suppliers FROM scm_viewer;
-- REVOKE ALL PRIVILEGES ON scm_admin.orders FROM scm_manager;

-- ====================================
-- TO DROP USERS (if needed)
-- ====================================

-- DROP USER scm_manager CASCADE;
-- DROP USER scm_warehouse CASCADE;
-- DROP USER scm_viewer CASCADE;
