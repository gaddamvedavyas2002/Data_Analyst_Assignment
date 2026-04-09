-- 1. users Table
-- =============================================
CREATE TABLE users (
    user_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20),
    mail_id VARCHAR(100),
    billing_address VARCHAR(255)
);

-- Sample data for users (just like in the assignment PDF)
INSERT INTO users (user_id, name, phone_number, mail_id, billing_address) VALUES
('21wrcxuy-67erfn', 'John Doe', '97XXXXXXXX', 'john.doe@example.com', 'XX, Street Y, ABC City'),
('32asdxuy-98klmn', 'Jane Smith', '98XXXXXXXX', 'jane.s@example.com', 'YY, Street Z, XYZ City'),
('45qweruy-12opqr', 'Alice Brown', '99XXXXXXXX', 'alice.b@example.com', 'ZZ, Street A, PQR City');

-- =============================================
-- 2. items Table
-- =============================================
CREATE TABLE items (
    item_id VARCHAR(50) PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    item_rate DECIMAL(10,2) NOT NULL
);

-- Sample data for items
INSERT INTO items (item_id, item_name, item_rate) VALUES
('itm-a9e8-q8fu', 'Tawa Paratha', 18.00),
('itm-a07vh-aer8', 'Mix Veg', 89.00),
('itm-w978-23u4', 'Chiken Bhiryani', 100.00),
('itm-bhf9-aerjn', 'Mutton Bhiryani', 200.00);

-- =============================================
-- 3. bookings Table
-- =============================================
CREATE TABLE bookings (
    booking_id VARCHAR(50) PRIMARY KEY,
    booking_date DATETIME,
    room_no VARCHAR(50),
    user_id VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Sample data for bookings
INSERT INTO bookings (booking_id, booking_date, room_no, user_id) VALUES
('bk-09f3e-95hj', '2021-09-23 07:36:48', 'rm-bhf9-aerjn', '21wrcxuy-67erfn'),
('bk-q034-q4o', '2021-10-15 10:20:00', 'rm-bhf9-aerjn', '32asdxuy-98klmn'),
('bk-45kl-78mn', '2021-11-05 14:30:00', 'rm-bhf9-aerjn', '21wrcxuy-67erfn'),
('bk-12op-34qr', '2021-11-20 09:15:00', 'rm-bhf9-aerjn', '45qweruy-12opqr');

-- =============================================
-- 4. booking_commercials Table
-- =============================================
CREATE TABLE booking_commercials (
    id VARCHAR(50) PRIMARY KEY,
    booking_id VARCHAR(50),
    bill_id VARCHAR(50),
    bill_date DATETIME,
    item_id VARCHAR(50),
    item_quantity DECIMAL(10,2),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
    FOREIGN KEY (item_id) REFERENCES items(item_id)
);

-- Sample data for booking_commercials
INSERT INTO booking_commercials (id, booking_id, bill_id, bill_date, item_id, item_quantity) VALUES
('q34r-3q4o8-q34u', 'bk-09f3e-95hj', 'bl-0a87y-q340', '2021-09-23 12:03:22', 'itm-a9e8-q8fu', 3),
('q3o4-ahf32-o2u4', 'bk-09f3e-95hj', 'bl-0a87y-q340', '2021-09-23 12:03:22', 'itm-a07vh-aer8', 1),
('134lr-oyfo8-3qk4', 'bk-q034-q4o', 'bl-34qhd-r7h8', '2021-10-15 10:45:00', 'itm-w978-23u4', 0.5),
('34qj-k3q4h-q34k', 'bk-45kl-78mn', 'bl-45kl-78mn', '2021-11-05 15:00:00', 'itm-bhf9-aerjn', 1),
('56mn-p7rs-90tu', 'bk-12op-34qr', 'bl-12op-34qr', '2021-11-20 10:00:00', 'itm-a9e8-q8fu', 2);

-- to check the tables after creating run this below query
SELECT * FROM users;

SELECT * FROM items;

SELECT * FROM bookings;

SELECT * FROM booking_commercials;