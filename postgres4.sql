CREATE TABLE admin
(
    id         SERIAL NOT NULL,
    first_name VARCHAR(100),
    last_name  VARCHAR(100),
    PRIMARY KEY (id)
);

DROP TABLE admin;

INSERT INTO admin(first_name, last_name)
VALUES ('Hasan', 'Almunawar'),
       ('Eko', 'Khanedy'),
       ('Budi', 'Nugraha');

SELECT *
FROM admin;

-- Seeing the last Id
SELECT CURRVAL(pg_get_serial_sequence('admin', 'id'));

SELECT CURRVAL('admin_id_seq');

-- Creating Sequence
CREATE SEQUENCE contoh_sequence;

-- Calling sequence, automatic increment
SELECT nextval('contoh_sequence');

-- Taking tha last of value
SELECT CURRVAL('contoh_sequence');

CREATE SEQUENCE admin_id_seq;

CREATE TABLE admin
(
    id         INT NOT NULL DEFAULT NEXTVAL('admin_id_seq'),
    first_name VARCHAR(100),
    last_name  VARCHAR(100),
    PRIMARY KEY (id)
);

-- String Function
SELECT id, LOWER(name), LENGTH(name)
FROM products;

-- Date and Time Functions
SELECT id, extract(YEAR FROM products.created_at), extract(MONTH FROM products.created_at)
FROM products;

-- Using Controll Flow Case
SELECT id,
       CASE category
           WHEN 'Makanan' THEN 'Enak'
           WHEN 'Minuman' THEN 'Seger'
           ELSE 'Apa itu?'
           END AS category
FROM products;

-- Using Operator
SELECT id,
       name,
       price,
       CASE
           WHEN price <= 15000 THEN 'Murah Kok'
           WHEN price <= 20000 THEN 'Mahal Juga'
           ELSE 'Mahal Banget'
           END AS murah
FROM products;

-- Using Control Flow Check Null
SELECT id,
       name,
       CASE
           WHEN description IS NULL THEN 'Kosong ini'
           ELSE description
           END AS description
FROM products;

-- AGGREGATE FUNCTION
SELECT count(id) AS "Total Product"
FROM products;

SELECT avg(price) AS "Rata-rata Harga"
FROM products;

SELECT max(price) AS "Harga Tertinggi"
FROM products;

SELECT min(price) AS "Harga Termurah"
FROM products;

-- GROUPING
SELECT category, COUNT(id) AS "Total Product"
FROM products
GROUP BY category;

SELECT category, count(id) AS "Total product", avg(price) AS "Rata-rata Harga"
FROM products
GROUP BY category;

-- HAVING CLASES
SELECT category,
       COUNT(id) AS total
FROM products
GROUP BY category
HAVING count(id) > 1;

-- SELECT category, count(id) AS "Total product", avg(price) AS "Rata-rata Harga"
-- FROM products
-- GROUP BY category
-- HAVING price > 15000;

SELECT category,
       count(id)                                             AS "Total product",
       avg(CASE WHEN price > 10000 THEN price ELSE NULL END) AS "Rata-rata Harga"
FROM products
GROUP BY category;








