-- Enable readable output format
.mode columns
.headers on

-- Instructions for students:
-- 1. Open SQLite in terminal: sqlite3 food_delivery.db
-- 2. Load this script: .read testing.sql
-- 3. Exit SQLite: .exit


-- You can use this to test your sql before you write it into your program.

--(1)
--Display the total number of customers.
SELECT COUNT(customer_id) FROM customers;

--(2)
--Show the earliest and latest customer signup dates.
SELECT MAX(signup_date), MIN(signup_date) FROM customers;

--(3)
--total number of orders
SELECT COUNT(order_id) FROM orders;
--average order value
SELECT AVG(order_total) FROM orders;
--highest and lowest order totals
SELECT MAX(order_total), MIN(order_total) FROM orders;

--(4)
--Display the total number of drivers and their hire dates.
SELECT COUNT(driver_id) FROM drivers;
SELECT hire_date FROM drivers;