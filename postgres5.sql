-- CONSTRAINT
CREATE TABLE customer
(
    id         SERIAL       NOT NULL,
    email      VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name  VARCHAR(100),
    PRIMARY KEY (id),
    CONSTRAINT unique_email UNIQUE (email)
);

ALTER TABLE customer
    DROP CONSTRAINT unique_email;

ALTER TABLE customer
    ADD constraint unique_email UNIQUE (email);

-- CHECK CONRAINT
ALTER TABLE products
    ADD CONSTRAINT price_check CHECK ( price >= 10000 );

INSERT INTO products(id, name, price, quantity, category)
VALUES ('P007', 'Ice Lemon', 5000, 12, 'Minuman');

-- INDEX
CREATE TABLE sellers
(
    id    SERIAL       NOT NULL,
    name  VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT email_unique UNIQUE (email)
);

CREATE INDEX sellers_name_index ON sellers (name);

DROP INDEX sellers_name_index;

-- FULL-TEXT SEARCH
SELECT *
FROM products
WHERE to_tsvector(name) @@ to_tsquery('bakso');
-- Can it as Search enggine?

-- Creating Full-Text Search Index
-- Get Availble language
SELECT cfgname
FROM pg_ts_config;

CREATE INDEX products_name_search ON products USING gin (to_tsvector('indonesian', name));

CREATE INDEX products_description_search ON products USING gin (to_tsvector('indonesian', description));

DROP INDEX products_name_search;

DROP INDEX products_description_search;

SELECT *
FROM products
WHERE name @@ to_tsquery('mie');

SELECT *
FROM products
WHERE description @@ to_tsquery('mie');

-- QUERY OPERATOR
-- to_tsquery() mendukung banyak operator
-- & untuk AND
-- | untuk OR
-- ! untuk NOT
-- “” untuk semua data

SELECT *
FROM products
WHERE name @@ to_tsquery('original | bakso');

SELECT *
FROM products
WHERE name @@ to_tsquery('Mie & ayam');

SELECT *
FROM products
WHERE name @@ to_tsquery('!bakso');

