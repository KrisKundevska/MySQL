# (From powerpoint) Retrieve a table of customers
USE sql_store;

SELECT * FROM customers;

# (From powerpoint) Retrieve customers and orders them by first name
SELECT * FROM customers
ORDER BY first_name;

# (From powerpoint) Retrieve customers' first name, last name, the points they have and the points they have +10
SELECT first_name, last_name, points, points +10
FROM customers;

# (From powerpoint) Retrieve customers' first name, last name, the points they have and the points they have multiplied by 10 +100
SELECT first_name, last_name, points, points *10 +100
FROM customers;

# (From powerpoint) Retrieve customers' first name, last name, the points they have and the points they have +10 and them multiplied by 100
SELECT first_name, last_name, points, (points +10) *100
AS discount
FROM customers;

# (From powerpoint) Calculate the new prices for products with a 10% increase
SELECT name, unit_price, unit_price * 1.1
AS new_price
FROM Products;

# (From powerpoint) Retrieve customers born after January 1, 1990
SELECT * FROM customers
WHERE birth_date > '1990-01-01';

# (Individual Work 1) Create sample tables to cross-check data
USE sql_store;
SELECT * FROM products;

USE sql_store;
SELECT * FROM shippers;

USE sql_store;
SELECT * FROM order_statuses;

USE sql_store;
SELECT * FROM orders;

USE sql_store;
SELECT * FROM order_items;

# (Individual Work 2) Retrieve product names and shipper names using joins
SELECT p.name AS product_name, s.name 
AS shipper_name
FROM products p
JOIN order_items oi 
ON p.product_id = oi.product_id
JOIN orders o 
ON oi.order_id = o.order_id
JOIN shippers s 
ON o.shipper_id = s.shipper_id;

# (Individual Work 3) Calculate total revenue for each shipper
SELECT s.name AS shipper_name, SUM(oi.unit_price * oi.quantity) 
AS total_revenue
FROM shippers s
LEFT JOIN orders o 
ON s.shipper_id = o.shipper_id
LEFT JOIN order_items oi 
ON o.order_id = oi.order_id
GROUP BY s.shipper_id;

# (Individual Work 4) Calculate the total number of orders and the average order quantity
SELECT COUNT(*) 
AS total_orders, 
AVG(quantity) 
AS avg_order_quantity
FROM order_items;

# (Individual Work 5) Retrieve the top 5 customers with the most points
SELECT first_name, last_name, points
FROM customers
ORDER BY points DESC
LIMIT 5;

# (Individual Work 6) Calculate the number of orders handled by each shipper
SELECT s.name AS shipper_name, COUNT(o.order_id) AS total_orders_handled
FROM shippers s
LEFT JOIN orders o ON s.shipper_id = o.shipper_id
GROUP BY s.shipper_id;

# (Individual Work 7) Retrieve product names and their corresponding shipper names
SELECT 
p.name AS product_name, 
s.name AS shipper_name
FROM products p
JOIN order_items oi 
ON p.product_id = oi.product_id
JOIN orders o 
ON oi.order_id = o.order_id
JOIN shippers s 
ON o.shipper_id = s.shipper_id
ORDER BY product_name;