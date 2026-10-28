CREATE SCHEMA salam;

CREATE TABLE salam.mahasiswas (
    id      INT             GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nim     VARCHAR(10)     NOT NULL UNIQUE,
    nama    VARCHAR(100)    NOT NULL,
    ipk     NUMERIC(3,2)    CHECK (ipk BETWEEN 0 AND 4)
);
