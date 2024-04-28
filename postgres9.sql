-- USER MANAGEMENT
CREATE ROLE hasan;
CREATE ROLE kay;

DROP ROLE hasan;
DROP ROLE kay;

ALTER ROLE hasan LOGIN PASSWORD 'rahasia';
ALTER ROLE kay LOGIN PASSWORD 'rahasia';

GRANT INSERT, UPDATE, SELECT ON ALL TABLES IN SCHEMA contoh TO hasan;
GRANT INSERT, UPDATE, SELECT ON customer TO kay;

REVOKE INSERT, UPDATE, SELECT ON customer FROM kay;

-- TO BACKUP DATABASE
--  pg_dump --host=localhost --port=5432 --dbname=belajar --username=postgres --format=plain --file=/Users/khannedy/backup.sql

-- TO RESTORE DATABSE
-- psql --host=localhost --port=5432 --dbname=belajar_restore --username=khannedy --file=/Users/khannedy/backup.sql
