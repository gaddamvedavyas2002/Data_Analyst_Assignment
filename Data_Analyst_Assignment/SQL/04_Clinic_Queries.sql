-- Q1: Find the revenue we got from each sales channel in a given year
SELECT 
    c.uid,
    cs.cid AS last_visited_clinic
FROM customer c
JOIN clinic_sales cs ON c.uid = cs.uid
WHERE cs.datetime = (
    SELECT MAX(datetime) 
    FROM clinic_sales 
    WHERE uid = c.uid
)
GROUP BY c.uid, cs.cid
ORDER BY c.uid;


-- Q2: Find top 10 the most valuable customers for a given year
SELECT 
    oid,
    amount AS total_sales_amount
FROM clinic_sales
WHERE strftime('%Y-%m', datetime) = '2021-11'
ORDER BY oid;


-- Q3: Find month wise revenue, expense, profit , status (profitable / not-profitable) for a given year
SELECT 
    eid,
    amount AS expense_amount,
    description
FROM expenses
WHERE strftime('%Y-%m', datetime) = '2021-10'
  AND amount > 1000
ORDER BY amount DESC;


-- Q4: For each city find the most profitable clinic for a given month
-- (Profit/Loss): Profit is Revenue - Expenses
SELECT 
    strftime('%Y-%m', period_date) AS month,
    clinic_name,
    ROUND(SUM(sales) - SUM(expense), 2) AS profit
FROM (
    SELECT datetime AS period_date, cid, amount AS sales, 0 AS expense 
    FROM clinic_sales
    UNION ALL
    SELECT datetime, cid, 0, amount 
    FROM expenses
) t
JOIN clinics c ON t.cid = c.cid
WHERE strftime('%Y', period_date) = '2021'
GROUP BY month, clinic_name
ORDER BY month, profit DESC;


-- Q5: For each state find the second least profitable clinic for a given month
SELECT 
    strftime('%Y-%m', cs.datetime) AS month,
    c.name AS customer_name,
    ROUND(SUM(cs.amount), 2) AS total_sales
FROM clinic_sales cs
JOIN customer c ON cs.uid = c.uid
WHERE strftime('%Y', cs.datetime) = '2021'
GROUP BY month, c.uid, c.name
ORDER BY month, total_sales DESC;