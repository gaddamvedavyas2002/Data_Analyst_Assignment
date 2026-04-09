-- =============================================
-- 02_Hotel_Queries.sql - Easy & Short Version
-- =============================================

-- Q1: For every user in the system, get the user_id and last booked room_no
SELECT 
    u.user_id,
    b.room_no AS last_booked_room_no
FROM users u
JOIN bookings b ON u.user_id = b.user_id
WHERE b.booking_date = (
    SELECT MAX(booking_date) 
    FROM bookings 
    WHERE user_id = u.user_id
)
GROUP BY u.user_id, b.room_no
ORDER BY u.user_id;

-- ===========================================================================================================

-- Q2: Get booking_id and total billing amount of every booking created in November, 2021
SELECT 
    b.booking_id,
    ROUND(SUM(bc.item_quantity * i.item_rate), 2) AS total_billing_amount
FROM bookings b
JOIN booking_commercials bc ON b.booking_id = bc.booking_id
JOIN items i ON bc.item_id = i.item_id
WHERE strftime('%Y-%m', b.booking_date) = '2021-11'
GROUP BY b.booking_id
ORDER BY b.booking_id;

-- ===========================================================================================================

-- Q3: Get bill_id and bill amount of all the bills raised in October, 2021 having bill amount >1000
SELECT 
    bc.bill_id,
    ROUND(SUM(bc.item_quantity * i.item_rate), 2) AS bill_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE strftime('%Y-%m', bc.bill_date) = '2021-10'
GROUP BY bc.bill_id
HAVING SUM(bc.item_quantity * i.item_rate) > 1000
ORDER BY bill_amount DESC;
-- this one gives the output As: SQL query successfully executed. However, the result set is empty.

-- ===========================================================================================================

-- Q4: Determine the most ordered and least ordered item of each month of year 2021
SELECT 
    strftime('%Y-%m', b.booking_date) AS month,
    i.item_name,
    SUM(bc.item_quantity) AS total_qty
FROM bookings b
JOIN booking_commercials bc ON b.booking_id = bc.booking_id
JOIN items i ON bc.item_id = i.item_id
WHERE strftime('%Y', b.booking_date) = '2021'
GROUP BY month, i.item_name
ORDER BY month, total_qty DESC;

-- ===========================================================================================================

-- Q5: Find the customers with the second highest bill value of each month of year 2021
SELECT 
    strftime('%Y-%m', b.booking_date) AS month,
    u.name AS customer_name,
    ROUND(SUM(bc.item_quantity * i.item_rate), 2) AS total_bill
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN booking_commercials bc ON b.booking_id = bc.booking_id
JOIN items i ON bc.item_id = i.item_id
WHERE strftime('%Y', b.booking_date) = '2021'
GROUP BY month, u.user_id, u.name
ORDER BY month, total_bill DESC;