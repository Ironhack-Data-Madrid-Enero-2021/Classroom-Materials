USE gatete_web_store;
INSERT INTO customers VALUES (DEFAULT,'Pepe','García','1985-11-04','pepito@hotmail.com',NULL,DEFAULT);

-- With a different database in use, we can still access `customers` by using "database_name.table_name"
-- i.e.: "gatete_web_store.customers"
INSERT INTO gatete_web_store.customers VALUES (DEFAULT,'Pepa','García','1985-11-04','josefa@hotmail.com',NULL,DEFAULT);

-- We can also specify the columns in which to insert. Columns not present in this statement with be set with the default value or NULL
INSERT INTO customers (first_name,last_name,email,mobile) VALUES ('Enrique','Morente','sacromonte@granada.es','666 66 66 66');

-- Insert multiple rows at once
INSERT INTO customers (first_name,last_name,email) 
	VALUES ('Paco','de Lucia','algeciras@jerez.es'),
		   ('Paco','de Lucia','algeciras@jerez.es'), -- Values may repeat if they are not part of the primary key
           ('Carmen','Linares','algeciras@jerez.es'),
           ('Pepa','Flores','tombola@marisol.es');


-- To change values on an existing row
UPDATE customers
SET date_of_birth = '1950-01-01'
WHERE customer_id = 7;

-- You can use different WHERE clauses. Beware of accidentaly changing multiple columns
UPDATE customers
SET date_of_birth = '1950-01-01'
WHERE first_name = 'Pepa';

--  WARNING!!!!!!! UPDATE queries with no WHERE clause will change ALL THE RECORDS on the table
UPDATE customers
SET first_name = 'XXXXXXXXXXXXXXXXXXX';

--  Delete row where condition is met
DELETE FROM customers
WHERE customer_id = 6;

--  DELETE FROM will eliminate all the rows that meet the conditions on the where clause
DELETE FROM customers
WHERE last_name = 'de Lucia';

--  THE QUERY FROM HELL: A delete from with no WHERE will erase all rows!!! 
DELETE FROM customers;


---------------------------------------------------------------------------

-- Statement -> An instruction / a query / an action. A full statement ends with ;
-- Clause -> A part of a statement that relates with a keyword

/*
SELECT FROM table
WHERE id = 5;

-- All is the statement
-- Two clauses that relate to keywords: SELECT FROM; WHERE
*/

-- Choosing a database
USE gatete_web_store;

-- Changing data keywords
/*
INSERT INTO <table_name> [(<column1>,<column2>)]
VALUES (<value1>,<value2>),
	  [(<value1>,<value2>),
       (<value1>,<value2>), ...] ;
UPDATE <table>
SET <column> = <value>
WHERE <condition>;
DELETE FROM <table>
WHERE <condition>;
*/

-- SELECT clause
-- Selecting all columns from a table
SELECT * FROM customers;

-- Choosing columns
SELECT first_name, last_name FROM customers;

-- WHERE clause
-- Selecting rows according to conditions set
SELECT * FROM customers
WHERE first_name = 'Vincent';

-- ORDER BY
-- Sort rows by column values
SELECT * FROM customers
WHERE phone = ''
ORDER BY first_name;

-- Use DESC to sort descendingly
SELECT * FROM customers
WHERE phone = ''
ORDER BY first_name DESC;

-- Sorting by multiple columns
SELECT * FROM customers
WHERE phone = ''
ORDER BY first_name DESC, last_name;

-- LIMIT
SELECT * FROM customers
WHERE phone = ''
ORDER BY first_name DESC, last_name
LIMIT 10;

-- offset
-- LIMIT with two values: LIMIT offset, limit
-- offset: number of rows to skip
-- limit: max number of rows to return
SELECT * FROM customers
WHERE phone = ''
ORDER BY first_name DESC, last_name
LIMIT 90,10;

USE gatete_stock;

-- You may use operations on the SELECT clause
SELECT product_id, category_id * 100
FROM products;

-- You may set ALIASes for columns
SELECT product_id, category_id, category_id * 100 AS new_category_id
FROM products;

-- DISTINCT
SELECT DISTINCT category_id from products;

-- As in python, there are different operations for different types of data
USE gatete_web_store;
SELECT CONCAT(first_name, ' ', last_name) AS full_name, date_of_birth
FROM customers
WHERE date_of_birth < '1989-01-01';

-- 1st query : All reviews by customer 10
SELECT * FROM reviews
WHERE customer_id=10;
-- 2nd query : All the comments from reviews of note between 4 and 5
SELECT comment FROM reviews
WHERE note >= 4;

-- Comparatives
-- =
-- < , >
-- <= , >=
-- != , <> : Two different forms of writing different than.

SELECT * FROM reviews
WHERE (note >= 4) AND NOT (`date` < '2020-01-01');
-- Conditional operations : AND, OR, NOT

-- IN operator
SELECT * FROM gatete_web_store.customers
WHERE first_name IN ('Allen', 'Jeremy', 'Buffy');

SELECT * FROM gatete_web_store.customers
WHERE first_name NOT IN ('Allen', 'Jeremy', 'Buffy');

-- BETWEEN (for numbers and strings as well)
SELECT * FROM gatete_web_store.customers
WHERE customer_id BETWEEN 16 AND 99;

SELECT * FROM gatete_web_store.customers
WHERE first_name BETWEEN 'A' AND 'J';

-- LIKE
SELECT * FROM gatete_web_store.customers
WHERE last_name LIKE 'Ga%'; 

SELECT * FROM gatete_web_store.customers
WHERE last_name LIKE 'Ga___'; 

-- % : any number of character
-- _ : exactly ONE character

-- LIKE
SELECT * FROM gatete_web_store.customers
WHERE last_name LIKE 'Ga%'; 

SELECT * FROM gatete_web_store.customers
WHERE last_name LIKE 'Ga___'; 

-- % : any number of character
-- _ : exactly ONE character

-- REGEXP
SELECT * FROM  customers
WHERE last_name REGEXP 'ma?c' ;

-----------------------------------------------------------------

-- Joining tables. UHUL!
SELECT reviews.customer_id, customers.customer_id, `comment`, first_name, last_name
FROM reviews
	JOIN customers
	ON reviews.customer_id=customers.customer_id
WHERE note=5;

-- JOIN of multiple tables
SELECT o.order_id, `date`, first_name, last_name, product_id, color_id, size_id, quantity, unity_price
FROM orders AS o
	JOIN order_description AS od
		ON o.order_id = od.order_id
	JOIN customers AS c
		ON c.customer_id = o.customer_id
WHERE o.order_id = 1;

-- JOIN of multiple tables of multiple databases
SELECT o.order_id, `date`, first_name, last_name, 
	   p.`name` AS product, cl.`name` AS color, 
       z.`name` AS size, quantity, unity_price
FROM orders AS o
	JOIN order_description AS od
		ON o.order_id = od.order_id
	JOIN customers AS c
		ON c.customer_id = o.customer_id
	JOIN gatete_stock.products AS p
		ON p.product_id = od.product_id
	JOIN gatete_stock.colors AS cl
		ON cl.color_id=od.color_id
	JOIN gatete_stock.sizes AS z
		ON od.size_id=z.size_id
WHERE o.order_id = 1;

USE gatete_stock;
-- 1. Name of all products that belong to the category children
SELECT
product_id,
products.`name` AS product_name,
category.`name` AS category_name
FROM products
	JOIN category
    ON category.category_id = products.category_id
WHERE category.`name`='children';

-- 2. From inventory on warehouse 1, name, color, size and quantity of all products in `womens` category
SELECT pr.`name`,c.name AS color, sz.name AS size, quantity
FROM products AS pr
	JOIN inventory AS inv
		ON pr.product_id = inv.product_id
	JOIN category AS cat
		ON pr.category_id= cat.category_id
	JOIN colors AS c
		ON c.color_id = inv.color_id
	JOIN sizes AS sz
		ON inv.size_id = sz.size_id
WHERE inv.warehouse_id = 1 AND cat.name ='womens';


USE gatete_organization;
-- Self Join
SELECT CONCAT(emp.first_name, ' ', emp.last_name ) as employee, 
	   CONCAT(man.first_name, ' ', man.last_name ) as manager
FROM staff AS emp
	LEFT JOIN staff AS man
		ON emp.manager = man.person_id;


-- GROUP BY

USE gatete_web_store;

SELECT o.order_id, `date`, first_name, last_name,
       SUM(quantity * unity_price) AS total
FROM orders AS o
	JOIN order_description AS od
		ON o.order_id = od.order_id
	JOIN customers AS c
		ON c.customer_id = o.customer_id
	JOIN gatete_stock.products AS p
		ON p.product_id = od.product_id
	JOIN gatete_stock.colors AS cl
		ON cl.color_id=od.color_id
	JOIN gatete_stock.sizes AS z
		ON od.size_id=z.size_id
WHERE o.order_id = 1
GROUP BY o.order_id;

SELECT first_name, last_name,
       SUM(quantity * unity_price) AS total
FROM orders AS o
	JOIN order_description AS od
		ON o.order_id = od.order_id
	JOIN customers AS c
		ON c.customer_id = o.customer_id
	JOIN gatete_stock.products AS p
		ON p.product_id = od.product_id
	JOIN gatete_stock.colors AS cl
		ON cl.color_id=od.color_id
	JOIN gatete_stock.sizes AS z
		ON od.size_id=z.size_id
-- WHERE
GROUP BY o.order_id, first_name, last_name
ORDER BY total
LIMIT 5;

-------------------------------------------------------------------------

-- Order of clauses
SELECT <columns>
FROM <table>
	JOIN <table2>
    ON <condition>
WHERE <condition>
GROUP BY <columns>
ORDER BY <columns>
LIMIT <offset, step>;