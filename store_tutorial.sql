# CREATE DATABASE myStore;

USE myStore;

CREATE TABLE customers(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255),
    street_address VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    zip VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO customers(first_name, last_name, email, password, street_address, city, state, zip)
VALUES ('Mary', 'White', 'mary@email.com', '123456', '123 Main Street', 'Atlanta', 'GA', '30341');

# SELECT * FROM customers;

INSERT INTO customers(first_name, last_name, email, password, street_address, city, state, zip)
VALUES ('Sarah', 'Brown', 'sarah@email.com', 'password', '456 West Ave', 'Atlanta', 'GA', '30318'),
       ('Charlie', 'Green', 'charlie@email.com', 'wordpass', '883 South Ave', 'Tampa', 'FL', '33612'),
       ('Tim', 'White', 'tim@email.com', 'candycorn', '123 Marks Ave', 'Atlanta', 'GA', '30341'),
       ('Ada', 'Lovelace', 'ada@email.com', 'computers', '555 Byte St', 'Atlanta', 'GA', '30318'),
       ('Jean', 'Bartik', 'jean@email.com', 'eniac', '321 East Dr', 'Atlanta', 'GA', '30341');

# SELECT * FROM customers;

#basic queries
SELECT first_name AS 'First Name' FROM customers;  #show a list of first names
SELECT first_name AS 'FIRST NAME' FROM customers WHERE first_name LIKE '%i%'; #first names that contain an i
SELECT * FROM customers WHERE state = 'FL';  #all columns for customers from FL
SELECT id, email FROM customers WHERE id BETWEEN 2 AND 4;
SELECT * FROM customers WHERE city = 'Atlanta' OR city = 'Tampa';  #this would get really long, you can use WHERE IN for a long list of OR's
SELECT * FROM customers WHERE city IN ('Atlanta', 'Tampa');  #use WHERE column IN instead of multiple OR clauses
SELECT DISTINCT city FROM customers; #distinct only shows unique values
SELECT first_name AS 'First Name', last_name AS LastName FROM customers; #if there's a space in the alias, use '', if no space you can just write the alias
SELECT concat(first_name, ' ', last_name) AS NAME, CONCAT(street_address, ' ', city, ', ', state, zip) AS Address FROM customers;

#update a person's name
UPDATE customers
SET last_name = 'Smith'
WHERE first_name = 'Sarah';
SELECT * FROM customers;

#Delete a customer using their id number
DELETE FROM customers WHERE id = 3;
SELECT * FROM customers;

#add a balance column to an existing table
ALTER TABLE customers ADD balance VARCHAR(255);
SELECT * FROM customers;
#remove a column
# ALTER TABLE customers DROP balance;
#change data type of an existing column
ALTER TABLE customers MODIFY COLUMN balance float;
DESCRIBE customers;

#add a balance to a customer
UPDATE customers
SET balance = 500
WHERE id = 1;
SELECT * FROM customers;

CREATE TABLE products(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    price INT,
    PRIMARY KEY (id)
);

SHOW TABLES;

INSERT INTO products (name, price) VALUES ('product One', 10);

SELECT * FROM products;
INSERT INTO products (name, price) VALUES ('product Two', 25),
    ('product Three', 20), ('product Four', 35), ('product Five', 15);
SELECT * FROM products;

#create a 3rd table for customer orders that will be linked to the customers table via the customer id and linked to the products table via the product id
CREATE TABLE orders(
    id INT NOT NULL AUTO_INCREMENT,
    order_number INT,
    product_id INT,
    customer_id INT UNSIGNED,  #I think you have to specify unsigned, bc the referenced id is unsigned
    order_date DATETIME default CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    FOREIGN KEY(customer_id) REFERENCES customers(id),
    FOREIGN KEY(product_id) REFERENCES products(id)
);

INSERT INTO orders(order_number, customer_id, product_id) VALUES (001, 1, 1); #we're giving it an order # of 001, using the customer 1 and product 1

INSERT INTO orders(order_number, customer_id, product_id) VALUES (2, 1, 3), (3, 2, 4), (4, 4, 4), (5, 6, 3), (6, 5, 2);

SELECT * FROM orders;

#use JOIN to query
SELECT customers.first_name, customers.last_name, orders.id, orders.order_number FROM customers
INNER JOIN orders
ON customers.id = orders.customer_id;  #using the id from customers and the id from orders

SELECT customers.first_name, customers.last_name, orders.order_number, orders.order_date
FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
    ORDER BY customers.last_name;

SELECT customers.first_name, customers.last_name, orders.order_number, orders.order_date
FROM customers
    RIGHT JOIN orders ON customers.id = orders.customer_id
ORDER BY customers.last_name;

#using multiple JOINs
USE myStore;
SELECT customers.first_name, customers.last_name, orders.order_date, products.name, balance
FROM orders
    INNER JOIN products ON orders.product_id = products.id  #which table do you want to join with orders and what field do they have in common
    INNER JOIN customers ON orders.customer_id = customers.id #which other table do you want to join with orders and what field do they have in common
ORDER BY orders.order_number;

INSERT INTO customers (first_name, last_name, email, password, street_address, city, state, zip, balance)
VALUES('Brandy', 'Oaks', 'brandy@email.com', 'ssapdrop', '987 West Ave', 'Tampa', 'FL', '33606', 0);

SELECT * FROM customers;






