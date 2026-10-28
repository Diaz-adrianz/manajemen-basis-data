-- ==================== backend_dev ============================
-- -------------------------------------------------------------
SELECT current_user;

-- Expected: OK
INSERT INTO salam.mahasiswas (nim, nama, ipk) VALUES ('124705019', 'Gibran', 2.30);
SELECT * FROM salam.mahasiswas;
UPDATE salam.mahasiswas SET ipk = 3.60 WHERE nim = '124705019';
DELETE FROM salam.mahasiswas WHERE nim = '124705019';

-- Expected: ERROR
CREATE TABLE salam.dosens (id INT);
DROP TABLE salam.mahasiswas;
ALTER TABLE salam.mahasiswas ADD COLUMN email VARCHAR(100);

-- ==================== bi_dev =================================
-- -------------------------------------------------------------
SELECT current_user;

-- Expected: OK
SELECT * FROM salam.mahasiswas;

-- Expected: ERROR
INSERT INTO salam.mahasiswas (nim, nama, ipk) VALUES ('124705004', 'Jokowi', 3.05);
UPDATE salam.mahasiswas SET ipk = 4.00 WHERE nim = '124705019';
DELETE FROM salam.mahasiswas;
CREATE TABLE salam.dosens (id INT);

-- ==================== data_engineer ==========================
-- -------------------------------------------------------------
SELECT current_user;

-- Expected: all OK
CREATE TABLE salam.dosens (id INT, nama VARCHAR(100));
INSERT INTO salam.dosens VALUES (1, 'SBY');
SELECT * FROM salam.dosens;
UPDATE salam.dosens SET nama = 'Habibie' WHERE id = 1;
DELETE FROM salam.dosens WHERE id = 1;
ALTER TABLE salam.dosens ADD COLUMN email VARCHAR(100);
DROP TABLE salam.dosens;
