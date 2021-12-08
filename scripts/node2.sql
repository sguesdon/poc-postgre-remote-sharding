CREATE TABLE temperature_2 (
  id BIGSERIAL NOT NULL,
  city_id INT NOT NULL,
  timestamp TIMESTAMP NOT NULL,
  temp DECIMAL(5,2) NOT NULL
)
