CREATE TABLE products
(
    id          VARCHAR(10)  NOT NULL,
    name        VARCHAR(100) NOT NULL,
    description TEXT,
    price       INT          NOT NULL DEFAULT 0,
    quantity    INT          NOT NULL DEFAULT 0,
    created_at  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE products
    ADD PRIMARY KEY (id);

INSERT INTO products(id, name, price, quantity)
VALUES ('P001', 'Mie Ayam Original', 15000, 15);

INSERT INTO products(id, name, description, price, quantity)
VALUES ('P002', 'Mie Ayam Bakso', 'Mie Ayam + Bakso 3', 20000, 12);

INSERT INTO products(id, name, price, quantity)
VALUES ('P003', 'Bakso Ayam', 10000, 10),
       ('P004', 'Bakso Sapi', 16000, 8),
       ('P005', 'Bakso Iga', 18000, 8);

TRUNCATE products;

SELECT *
FROM products;

SELECT id, name, price
FROM products;

SELECT *
FROM products
WHERE price < 17000;

CREATE TYPE PRODUCT_CATEGORIES AS ENUM ('Makanan', 'Minuman', 'Lain-lain');

DROP TYPE product_categories;

ALTER TABLE products
    ADD COLUMN category PRODUCT_CATEGORIES;

UPDATE products
SET category = 'Makanan'
WHERE id = 'P001';

UPDATE products
SET category    = 'Lain-lain',
    description = 'Bakso + Iga Sapi',
    price       = price + 5000
WHERE id = 'P005';

DELETE
FROM products
WHERE id = 'P005';

SELECT id       AS kode,
       price    AS harga,
       quantity AS stock
FROM products;

SELECT p.id       AS kode,
       p.price    AS harga,
       p.quantity AS stock
FROM products AS p;

SELECT *
FROM products
WHERE price < 20000;


SELECT *
FROM products
WHERE price < 20000
  AND category = 'Makanan';


SELECT *
FROM products AS p
WHERE (p.quantity < 10 OR category = 'Makanan')
  AND price >= 20000;

SELECT * FROM products;

SELECT * FROM products
WHERE name ILIKE 'mie%';

SELECT * FROM products
WHERE name ILIKE '%ayam';

SELECT * FROM products
WHERE name ILIKE '%bakso%';

SELECT * FROM products
WHERE name NOT ILIKE 'Bakso sapi';

SELECT * FROM products
WHERE description IS NULL ;

SELECT * FROM products
WHERE description IS NOT NULL;

SELECT * FROM products
WHERE price BETWEEN 15000 AND 20000;

SELECT * FROM products
WHERE products.category IN ('Makanan');
