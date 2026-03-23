-- Creating a alias for tables
SELECT c.name FROM customers c;
SELECT c.name FROM customers c ;
SELECT o.quantity FROM orders o;

-- Functions(AGGREGATE FUNCTIONS)
-- -COUNT()
SELECT COUNT(*) AS total_orders
FROM Orders;
-- -SUM()
SELECT SUM(total_amount) AS total_sales
FROM Orders;
-- -MIN()
-- -MAX()
SELECT MAX(price) AS highest_price,
       MIN(price) AS lowest_price
FROM Books;
-- -AVG()
SELECT AVG(total_amount) AS avg1
FROM Orders;

-- FUNCTIONS(STRING FUNCTIONS)
-- -UPPER()
-- -LOWER()
SELECT UPPER(name), LOWER(name)
FROM Customers;
-- -LENGTH()
SELECT name, LENGTH(name)
FROM Customers;
-- -CONCAT()
SELECT CONCAT(name, ' - ', city) AS customer_info
FROM Customers;
-- -SUBSTRING()
SELECT SUBSTRING(name, 1, 3)
FROM Customers;
-- -TRIM()

-- Numeric Functions
-- -Round()
SELECT ROUND(price, 0)
FROM Books;
-- -CEIL() / FLOOR()
SELECT CEIL(price), FLOOR(price)
FROM Books;
-- -MOD()
SELECT MOD(price, 2)
FROM Books;

-- Conditional Functions
-- -IF()
SELECT name, customer_id,
IF(customer_id > 3, 'High', 'Low') AS customer_type
FROM Customers;
-- -CASE()
SELECT title, price,
CASE
    WHEN price >= 500 THEN 'Premium'
    WHEN price < 300 THEN 'Regular'
    ELSE 'Basic'
END AS category
FROM Books;
-- Window Functions()
-- -Rank()
SELECT customer_id,
SUM(total_amount) AS total_spent,
RANK() OVER (ORDER BY SUM(total_amount) DESC) AS ranks
FROM Orders
GROUP BY customer_id;
-- -ROW NUMBER()
SELECT *,
ROW_NUMBER() OVER (ORDER BY total_amount DESC) AS row_num
FROM Orders;
-- -DENSE_RANK()
SELECT *,
DENSE_RANK() OVER (ORDER BY total_amount DESC)
FROM Orders;
-- -RUNNING_TOTAL()
SELECT order_date,
SUM(total_amount) OVER (ORDER BY order_date) AS running_total
FROM Orders;


-- Joins
SELECT c.name, b.title, o.quantity, o.total_amount
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Books b ON o.book_id = b.book_id;
-- Agreggate Insights
-- Total sales per book
SELECT b.book_id, b.title, SUM(o.total_amount) AS total_sales, COUNT(b.book_id) AS no_of_books
FROM Orders o JOIN Books b 
ON o.book_id = b.book_id
GROUP BY b.book_id;
-- Left Join
SELECT c.customer_id, c.name, o.order_id, o.total_amount
FROM Orders o
LEFT JOIN Customers c 
ON c.customer_id = o.customer_id;
-- Right Join
SELECT o.order_id, c.name, o.total_amount, o.customer_id
FROM Customers c
RIGHT JOIN Orders o
ON c.customer_id = o.customer_id;

-- Top customer by spending
SELECT c.name, SUM(o.total_amount) AS total_spent, 
RANK() OVER (ORDER BY SUM(o.total_amount) DESC) AS ranks
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id;

-- Reduce stock when order is placed
START TRANSACTION;
UPDATE Books SET stock = stock - 2 WHERE book_id = 1001;
ROLLBACK; -- undo
COMMIT; -- confirm if correct

-- Reduce stock when order is placed
START TRANSACTION;
UPDATE Books SET stock = stock - 2 WHERE book_id = 1001;
ROLLBACK; -- undo
COMMIT; -- confirm if correct
