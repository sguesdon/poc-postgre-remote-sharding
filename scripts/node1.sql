CREATE TABLE temperature (
  id BIGSERIAL NOT NULL,
  city_id INT NOT NULL,
  timestamp TIMESTAMP NOT NULL,
  temp DECIMAL(5,2) NOT NULL
);

SELECT create_distributed_table('temperature', 'city_id');

SELECT citus_set_coordinator_host('node1', 5432);
SELECT citus_add_node('node2', 5432);
SELECT citus_add_node('node3', 5432);
SELECT citus_add_node('node4', 5432);
SELECT citus_add_node('node5', 5432);

SELECT rebalance_table_shards();
