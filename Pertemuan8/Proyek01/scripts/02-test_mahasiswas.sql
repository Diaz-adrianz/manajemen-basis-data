-- Case: valid insertion. Expected: OK
INSERT INTO salam.mahasiswas (nim, nama, ipk)
VALUES ('1247050083', 'Diaz', 3.83);

-- Case: Primary key. Expected: duplicate primary key should fail
INSERT INTO salam.mahasiswas (id, nim, nama, ipk)
VALUES (1, '124705002', 'Teddy', 3.00);

-- Case: Unique NIM. Expected: duplicate NIM should fail
INSERT INTO salam.mahasiswas (nim, nama, ipk)
VALUES ('1247050083', 'SBY', 3.80);

-- Case: Check IPK. Expected: IPK above 4.00 should fail 
INSERT INTO salam.mahasiswas (nim, nama, ipk)
VALUES ('124705019', 'Gibran', 5.00);

-- Case: Not Null Name. Expected: null name should fail
INSERT INTO salam.mahasiswas (nim, nama, ipk)
VALUES ('124705058', NULL, 3.00);

-- select
SELECT * FROM salam.mahasiswas;