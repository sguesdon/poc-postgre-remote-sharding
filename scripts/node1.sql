CREATE TABLE temperature (
  id BIGSERIAL NOT NULL,
  city_id INT NOT NULL,
  timestamp TIMESTAMP NOT NULL,
  temp DECIMAL(5,2) NOT NULL
) PARTITION BY RANGE (timestamp);

CREATE EXTENSION postgres_fdw;
GRANT USAGE ON FOREIGN DATA WRAPPER postgres_fdw to postgres;

CREATE SERVER node2 FOREIGN DATA WRAPPER postgres_fdw OPTIONS (dbname 'postgres', host 'node2', port '5432');
CREATE USER MAPPING for postgres SERVER node2 OPTIONS (user 'postgres', password 'postgres');

CREATE SERVER node3 FOREIGN DATA WRAPPER postgres_fdw OPTIONS (dbname 'postgres', host 'node3', port '5432');
CREATE USER MAPPING for postgres SERVER node3 OPTIONS (user 'postgres', password 'postgres');

CREATE SERVER node4 FOREIGN DATA WRAPPER postgres_fdw OPTIONS (dbname 'postgres', host 'node4', port '5432');
CREATE USER MAPPING for postgres SERVER node4 OPTIONS (user 'postgres', password 'postgres');

CREATE SERVER node5 FOREIGN DATA WRAPPER postgres_fdw OPTIONS (dbname 'postgres', host 'node5', port '5432');
CREATE USER MAPPING for postgres SERVER node5 OPTIONS (user 'postgres', password 'postgres');

CREATE FOREIGN TABLE temperature_2 PARTITION OF temperature
FOR VALUES FROM ('2019-05-01') TO ('2019-06-01')
SERVER node2;

CREATE FOREIGN TABLE temperature_3 PARTITION OF temperature
FOR VALUES FROM ('2019-06-01') TO ('2019-07-01')
SERVER node3;

CREATE FOREIGN TABLE temperature_4 PARTITION OF temperature
FOR VALUES FROM ('2019-07-01') TO ('2019-08-01')
SERVER node4;

CREATE FOREIGN TABLE temperature_5 PARTITION OF temperature
DEFAULT
SERVER node5;
