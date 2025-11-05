-- User and Permission Management (DCL - Data Control Language)
-- Run this as SYSTEM or DBA user

-- Create a new user for the supply chain application
CREATE USER scm_admin IDENTIFIED BY sa12345;

-- Grant basic connection rights
GRANT CONNECT TO scm_admin;
GRANT RESOURCE TO scm_admin;

-- Grant specific privileges for schema creation
GRANT CREATE TABLE TO scm_admin;
GRANT CREATE VIEW TO scm_admin;
GRANT CREATE SEQUENCE TO scm_admin;
GRANT CREATE TRIGGER TO scm_admin;
GRANT CREATE PROCEDURE TO scm_admin;

-- Grant unlimited tablespace
GRANT UNLIMITED TABLESPACE TO scm_admin;

-- Create a read-only user for reports
CREATE USER scm_reader IDENTIFIED BY sr12345;
GRANT CONNECT TO scm_reader;

-- Grant SELECT privileges on all tables (after tables are created by scm_admin)
-- GRANT SELECT ON scm_admin.suppliers TO scm_reader;
-- GRANT SELECT ON scm_admin.products TO scm_reader;
-- GRANT SELECT ON scm_admin.warehouses TO scm_reader;
-- GRANT SELECT ON scm_admin.inventory TO scm_reader;
-- GRANT SELECT ON scm_admin.orders TO scm_reader;
-- GRANT SELECT ON scm_admin.order_details TO scm_reader;
-- GRANT SELECT ON scm_admin.shipments TO scm_reader;

COMMIT;

-- To revoke permissions (example)
-- REVOKE CREATE TABLE FROM scm_admin;
-- REVOKE SELECT ON scm_admin.suppliers FROM scm_reader;
