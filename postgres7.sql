-- ONE TO ONE
CREATE TABLE wallets
(
    id          SERIAL NOT NULL,
    id_customer INT    NOT NULL,
    balance     INT,
    PRIMARY KEY (id),
    CONSTRAINT wallet_customer_unique UNIQUE (id_customer),
    CONSTRAINT fk_wallet_customer FOREIGN KEY (id_customer) REFERENCES customer (id)
);

DROP TABLE wallets;

SELECT *
FROM wallets;

-- ONE TO MANY
CREATE TABLE categories
(
    id   VARCHAR(10)  NOT NULL,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

-- Change productions table
ALTER TABLE products
    DROP COLUMN category;

ALTER TABLE products
    ADD COLUMN id_category VARCHAR(10);

ALTER TABLE products
    ADD CONSTRAINT fk_product_category FOREIGN KEY (id_category) REFERENCES categories (id);


-- MANY TO MANY
CREATE TABLE orders
(
    id       INT       NOT NULL,
    order_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);

DROP TABLE orders;
-- table helpers
CREATE TABLE order_details
(
    id_product VARCHAR(10) NOT NULL,
    id_order   INT         NOT NULL,
    quantity   INT,
    price      INT
);

DROP TABLE orders;

-- CREATE FOREIGN KEY
ALTER TABLE order_details
    ADD CONSTRAINT fk_order_details_product FOREIGN KEY (id_product) REFERENCES products (id);

ALTER TABLE order_details
    ADD CONSTRAINT fk_order_details_order FOREIGN KEY (id_order) REFERENCES orders (id);

SELECT *
FROM orders
         JOIN order_details ON order_details.id_order = orders.id
         JOIN products On order_details.id_product = products.id;

-- TYPE OF JOIN TABLE
-- INNER JOIN
-- LEFT JOIN
-- RIGHT JOIN
-- FULL JOIN

-- INNER JOIN
SELECT *
FROM categories
         INNER JOIN products ON products.id_category = categories.id;

-- LEFT JOIN
SELECT *
FROM categories
         LEFT JOIN products ON products.id_category = categories.id;

-- RIGHT JOIN
SELECT *
FROM categories
         RIGHT JOIN products ON products.id_category = categories.id;

-- FULL JOIN
SELECT *
FROM categories
         FULL JOIN products ON products.id_category = categories.id;

-- SUBQUERIES
SELECT *
FROM products
WHERE price > (SELECT AVG(price) FROM products);




