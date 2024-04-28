CREATE TABLE guestbooks
(
    id      SERIAL       NOT NULL,
    email   VARCHAR(100) NOT NULL,
    title   VARCHAR(100) NOT NULL,
    content TEXT,
    PRIMARY KEY (id)
);


SELECT DISTINCT email
FROM customer
UNION
SELECT DISTINCT email
FROM guestbooks;

-- SEEING CURRENT SCHEMA
SELECT current_schema();

SHOW search_path;

CREATE SCHEMA contoh;

DROP SCHEMA contoh;

-- MOVE SCHEMA
SET search_path TO contoh;

CREATE TABLE contoh.products
(
    id   SERIAL       NOT NULL,
    name VARCHAR(100) NOT NULL
);

INSERT INTO contoh.products(name)
VALUES ('iphone'),
       ('Play Stasion');

SELECT * FROM contoh.products;
