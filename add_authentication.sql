-- Create app_users table
CREATE TABLE app_users (
    user_id NUMBER PRIMARY KEY,
    username VARCHAR2(50) UNIQUE NOT NULL,
    password VARCHAR2(255) NOT NULL,
    full_name VARCHAR2(100) NOT NULL,
    email VARCHAR2(100),
    role VARCHAR2(20) CHECK (role IN ('ADMIN', 'MANAGER', 'WAREHOUSE', 'VIEWER')),
    is_active NUMBER(1) DEFAULT 1 CHECK (is_active IN (0, 1)),
    created_at DATE DEFAULT SYSDATE,
    last_login DATE
);

CREATE SEQUENCE user_seq START WITH 1 INCREMENT BY 1;

-- Create audit_log table
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

-- Default users (password: password123)
INSERT INTO app_users (user_id, username, password, full_name, email, role, is_active)
VALUES (user_seq.NEXTVAL, 'admin', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 
        'System Administrator', 'admin@scm.com', 'ADMIN', 1);

INSERT INTO app_users (user_id, username, password, full_name, email, role, is_active)
VALUES (user_seq.NEXTVAL, 'manager', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 
        'Operations Manager', 'manager@scm.com', 'MANAGER', 1);

INSERT INTO app_users (user_id, username, password, full_name, email, role, is_active)
VALUES (user_seq.NEXTVAL, 'warehouse', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 
        'Warehouse Staff', 'warehouse@scm.com', 'WAREHOUSE', 1);

INSERT INTO app_users (user_id, username, password, full_name, email, role, is_active)
VALUES (user_seq.NEXTVAL, 'viewer', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 
        'Guest Viewer', 'viewer@scm.com', 'VIEWER', 1);

COMMIT;

-- Create index for faster lookups
CREATE INDEX idx_username ON app_users(username);
CREATE INDEX idx_audit_user ON audit_log(user_id);
CREATE INDEX idx_audit_time ON audit_log(action_time);

COMMIT;

SELECT 'User authentication tables created successfully!' AS status FROM DUAL;
SELECT 'Default login credentials:' AS info FROM DUAL;
SELECT 'Username: admin, manager, warehouse, viewer' AS info FROM DUAL;
SELECT 'Password: password123 (for all users)' AS info FROM DUAL;
