SELECT * 
FROM olist_orders;


-- 1. View first 10 orders (preview data)
SELECT * 
FROM olist_orders
LIMIT 10;


-- 2. Count total number of orders
SELECT COUNT(*) AS total_orders
FROM olist_orders;


-- 3. Find the earliest and latest purchase date
SELECT 
    MIN(order_purchase_timestamp) AS first_order_date,
    MAX(order_purchase_timestamp) AS last_order_date
FROM olist_orders;


-- 4. Count orders by status
SELECT 
    order_status,
    COUNT(*) AS count_orders
FROM olist_orders
GROUP BY order_status
ORDER BY count_orders DESC;


-- 5. Monthly order count (trend over time)
SELECT 
    DATE_TRUNC('month', order_purchase_timestamp) AS month,
    COUNT(*) AS orders_count
FROM olist_orders
GROUP BY month
ORDER BY month;

-------------customer table------------

SELECT * FROM olist_customers;


SELECT * FROM olist_customers LIMIT 10;


-- 6. Count total number of customers
SELECT COUNT(*) AS total_customers
FROM olist_customers;

-- 7. List first 10 customers
SELECT *
FROM olist_customers
LIMIT 10;



-- 8. Count customers by state
SELECT 
    customer_state,
    COUNT(*) AS total_customers
FROM olist_customers
GROUP BY customer_state
ORDER BY total_customers DESC;



-- 9. Count customers by city
SELECT 
    customer_city,
    COUNT(*) AS total_customers
FROM olist_customers
GROUP BY customer_city
ORDER BY total_customers DESC;

-- 10. Showing first 10 orders with customer details
SELECT 
    o.order_id,
    o.order_purchase_timestamp,
    c.customer_city,
    c.customer_state
FROM olist_orders o
JOIN olist_customers c
    ON o.customer_id = c.customer_id
LIMIT 10;

-- 11. Count orders per state
SELECT 
    c.customer_state,
    COUNT(o.order_id) AS total_orders
FROM olist_orders o
JOIN olist_customers c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY total_orders DESC;

-- 12. Count orders per city
SELECT 
    c.customer_city,
    COUNT(o.order_id) AS total_orders
FROM olist_orders o
JOIN olist_customers c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_city
ORDER BY total_orders DESC;

-- 13. Orders per month
SELECT 
    DATE_TRUNC('month', order_purchase_timestamp) AS month,
    COUNT(order_id) AS total_orders
FROM olist_orders
GROUP BY month
ORDER BY month;



-- Total orders
SELECT COUNT(*) AS total_orders
FROM olist_orders;

-- Total customers
SELECT COUNT(*) AS total_customers
FROM olist_customers;

-- Orders count by status
SELECT order_status, COUNT(*) AS total_orders
FROM olist_orders
GROUP BY order_status
ORDER BY total_orders DESC;

-- Orders count per state
SELECT c.customer_state, COUNT(o.order_id) AS total_orders
FROM olist_orders o
JOIN olist_customers c
  ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY total_orders DESC;


-- Orders count per city
SELECT c.customer_city, COUNT(o.order_id) AS total_orders
FROM olist_orders o
JOIN olist_customers c
  ON o.customer_id = c.customer_id
GROUP BY c.customer_city
ORDER BY total_orders DESC;


-- Orders count by month
SELECT DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
       COUNT(o.order_id) AS total_orders
FROM olist_orders o
GROUP BY month
ORDER BY month;


-- Customers with more than 1 order
SELECT c.customer_id, COUNT(o.order_id) AS order_count
FROM olist_orders o
JOIN olist_customers c
  ON o.customer_id = c.customer_id
GROUP BY c.customer_id
HAVING COUNT(o.order_id) > 1
ORDER BY order_count DESC;





