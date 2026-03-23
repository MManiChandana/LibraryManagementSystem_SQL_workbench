-- Creating a alias for tables
SELECT c.name FROM customers c;
SELECT c.name FROM customers c ;
SELECT o.quantity FROM orders o;
-- Joins
SELECT c.name, b.title, o.quantity, o.total_amount
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Books b ON o.book_id = b.book_id;
-- Agreggate Insights
-- Total sales per book
SELECT b.title, SUM(o.total_amount) AS total_sales
FROM Orders o
JOIN Books b ON o.book_id = b.book_id
GROUP BY b.book_id;

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
