-- tables: Products, Categories, Customers, Orders

-- INNER JOIN example
SELECT p.product_name, c.category_name
FROM Products p
INNER JOIN Categories c ON p.category_id = c.category_id
WHERE p.price > 20.00;

-- LEFT JOIN example
SELECT c.customer_name, o.order_date
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
ORDER BY c.customer_name;

-- UPDATE example
UPDATE Products
SET price = price * 1.10
WHERE category_id = 2;

-- DELETE example
DELETE FROM Orders
WHERE order_status = 'Cancelled';

-- Aggregation with GROUP BY and HAVING
SELECT c.category_name, COUNT(p.product_id) as product_count, AVG(p.price) as avg_price
FROM Categories c
JOIN Products p ON c.category_id = p.category_id
GROUP BY c.category_name
HAVING COUNT(p.product_id) > 3;

-- Subquery example
SELECT customer_name, total_spent
FROM Customers
WHERE total_spent > (SELECT AVG(total_spent) FROM Customers);
