-- Create users
CREATE USER backend_dev     WITH PASSWORD 'backend_dev';
CREATE USER bi_dev          WITH PASSWORD 'di_dev';
CREATE USER data_engineer   WITH PASSWORD 'data_engineer';

-- backend_dev: CRUD semua table
GRANT USAGE ON SCHEMA salam TO backend_dev;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA salam TO backend_dev;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA salam TO backend_dev;

-- bi_dev: hanya read/select semua table/view
GRANT USAGE ON SCHEMA salam TO bi_dev;
GRANT SELECT ON ALL TABLES IN SCHEMA salam TO bi_dev;

-- data_engineer: Role: CREATE, MODIFY, DROP semua objects, CRUD semua table
ALTER SCHEMA salam OWNER TO data_engineer;
ALTER TABLE salam.mahasiswas OWNER TO data_engineer;

