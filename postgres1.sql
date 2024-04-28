
CREATE TABLE barang (
    kode INT NOT NULL,
    name VARCHAR(100),
    harga INT,
    jumlah INT DEFAULT 0,
    waktu_dibuat TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE  barang;

SELECT * FROM pg_tables WHERE schemaname = 'barang';

ALTER TABLE barang
ADD COLUMN deskripsi TEXT;

ALTER TABLE barang
DROP COLUMN deskripsi;

ALTER TABLE barang
RENAME COLUMN name TO nama;

-- TRUNCATE barang; Menghapus table dan membuat ulang denga struktur yang sama
TRUNCATE barang;






