-- TABLE RELATIONSHIP

CREATE TABLE wishlist
(
    id          SERIAL      NOT NULL,
    id_product  VARCHAR(10) NOT NULL,
    description TEXT,
    PRIMARY KEY (id),
    CONSTRAINT fk_wishlist_product FOREIGN KEY (id_product) REFERENCES products (id)

);

ALTER TABLE wishlist
    DROP CONSTRAINT fk_wishlist_product;

-- SETTING THE BEHAVIOR TO DELETE RELATION
ALTER TABLE wishlist
    ADD CONSTRAINT fk_wishlist_product FOREIGN KEY (id_product) REFERENCES products (id)
        ON DELETE CASCADE On UPDATE CASCADE;

-- JOIN TABLE
SELECT *
FROM wishlist
         JOIN public.products p on p.id = wishlist.id_product;

SELECT products.id, products.name, wishlist.description
FROM wishlist
         JOIN products ON products.id = wishlist.id_product;

-- CREATE RELATION
ALTER TABLE wishlist
    ADD COLUMN id_customer INT;

ALTER TABLE wishlist
    ADD CONSTRAINT fk_wishlist_customer FOREIGN KEY (id_customer) REFERENCES customer (id);

-- JOINING MULTI TABLE
SELECT customer.email, products.id, products.name, wishlist.description
FROM wishlist
         JOIN products ON wishlist.id_product = products.id
         JOIN customer ON wishlist.id_customer = customer.id;
