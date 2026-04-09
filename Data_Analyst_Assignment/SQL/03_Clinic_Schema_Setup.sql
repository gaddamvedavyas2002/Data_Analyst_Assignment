-- 1. clinics Table
-- =============================================
CREATE TABLE clinics (
    cid VARCHAR(50) PRIMARY KEY,
    clinic_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50)
);

-- Sample data for clinics
INSERT INTO clinics (cid, clinic_name, city, state, country) VALUES
('cnc-0100001', 'XYZ clinic', 'lorem', 'ipsum', 'dolor'),
('cnc-0100002', 'ABC Clinic', 'New York', 'NY', 'USA'),
('cnc-0100003', 'HealthPlus Clinic', 'Mumbai', 'Maharashtra', 'India');

-- =============================================
-- 2. customer Table
-- =============================================
CREATE TABLE customer (
    uid VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    mobile VARCHAR(20)
);

-- Sample data for customer
INSERT INTO customer (uid, name, mobile) VALUES
('bk-09f3e-95hj', 'Jon Doe', '97XXXXXXXX'),
('bk-q034-q4o', 'Jane Smith', '98XXXXXXXX'),
('bk-45kl-78mn', 'Alice Brown', '99XXXXXXXX'),
('bk-12op-34qr', 'Bob Wilson', '91XXXXXXXX');

-- =============================================
-- 3. clinic_sales Table
-- =============================================
CREATE TABLE clinic_sales (
    oid VARCHAR(50) PRIMARY KEY,
    uid VARCHAR(50),
    cid VARCHAR(50),
    amount INT(10,2),
    datetime DATETIME,
    sales_channel VARCHAR(50),
    FOREIGN KEY (uid) REFERENCES customer(uid),
    FOREIGN KEY (cid) REFERENCES clinics(cid)
);

-- Sample data for clinic_sales
INSERT INTO clinic_sales (oid, uid, cid, amount, datetime, sales_channel) VALUES
('ord-00100-00100', 'bk-09f3e-95hj', 'cnc-0100001', 24999, '2021-09-23 12:03:22', 'sodat'),
('ord-00100-00101', 'bk-q034-q4o', 'cnc-0100001', 18999, '2021-10-15 10:45:00', 'sodat'),
('ord-00100-00102', 'bk-45kl-78mn', 'cnc-0100002', 32450, '2021-11-05 14:30:00', 'sodat'),
('ord-00100-00103', 'bk-12op-34qr', 'cnc-0100001', 12499, '2021-11-20 09:15:00', 'sodat');

-- =============================================
-- 4. expenses Table
-- =============================================
CREATE TABLE expenses (
    eid VARCHAR(50) PRIMARY KEY,
    cid VARCHAR(50),
    description VARCHAR(200),
    amount INT(10,2),
    datetime DATETIME,
    FOREIGN KEY (cid) REFERENCES clinics(cid)
);

-- Sample data for expenses
INSERT INTO expenses (eid, cid, description, amount, datetime) VALUES
('exp-0100-00100', 'cnc-0100001', 'first-aid supplies', 557, '2021-09-23 07:36:48'),
('exp-0100-00101', 'cnc-0100001', 'monthly rent', 45000, '2021-09-30 00:00:00'),
('exp-0100-00102', 'cnc-0100002', 'staff salary', 85000, '2021-10-05 00:00:00'),
('exp-0100-00103', 'cnc-0100001', 'medicine stock', 32000, '2021-10-20 00:00:00');

-- to check the tables after creating run this below query
SELECT * FROM clinics;

SELECT * FROM customer;

SELECT * FROM clinic_sales;

SELECT * FROM expenses;