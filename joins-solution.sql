--0. Get all customers and their addresses:
SELECT * FROM addresses
JOIN customers
ON customer_id = customers.id;
--Should be : JOIN addresses ON customers.id = addresses.customer_id;

--	1.	Get all orders and their line items.
SELECT * FROM line_items
JOIN orders
ON order_id = orders.id;
--should be : ON orders.id = line_items.order_id;

--	2.	Which warehouses have cheetos?
SELECT * FROM warehouse_product
JOIN products
ON products.id = warehouse_id
JOIN warehouse ON warehouse_id = warehouse.id
WHERE products.id=5;
--SELECT warehouse.* FROM warehouse
-- JOIN warehouse_product AS wp ON warehouse.id = wp.warehouse_id
-- JOIN products ON wp.product_id = products.id
-- WHERE products.description LIKE 'cheeto%';

--	3.	Which warehouses have diet pepsi?

SELECT * FROM warehouse_product
JOIN products
ON products.id = product_id
JOIN warehouse 
ON warehouse_id = warehouse.id
WHERE products.id=6;
--could be : WHERE products.description LIKE 'diet pepsi%';

--	4.	Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT * FROM orders
JOIN addresses
ON address_id = addresses.id
JOIN customers
ON customers.id = addresses.id;
--should have included COUNT(orders.id) to get the number of orders.

--	5.	How many customers do we have?

SELECT COUNT(*) FROM customers;

--	6.	How many products do we carry?
SELECT COUNT(*) FROM products;

--	7.	What is the total available on-hand quantity of diet pepsi?
SELECT SUM(on_hand) FROM products
JOIN warehouse_product
ON products.id = product_id
WHERE product_id = 6;

--another way to do #7:
-- SELECT SUM(wp.on_hand) FROM warehouse_product AS wp 
-- JOIN products ON wp.product_id = products.id
-- WHERE products.description LIKE 'diet pepsi%'
-- GROUP BY products.id;
