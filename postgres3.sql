-- ORDER BY CLAUSE

SELECT * FROM products
ORDER BY price ASC , id DESC;

-- LIMIT CLAUSE
SELECT * FROM products
WHERE price > 5000
ORDER BY price ASC
LIMIT 2;

SELECT * FROM products
WHERE price > 5000
ORDER BY price ASC
LIMIT 2 OFFSET 2;

-- SELECT DISTINCT DATA
SELECT DISTINCT category
FROM products;

-- NUMERIX FUNCTION
SELECT 10 + 10 as hasil;

SELECT id, price / 1000 AS harga_k
FROM products;

SELECT PI();

SELECT POWER(10,2); -- 10 x 10

SELECT COS(10), SIN(10);