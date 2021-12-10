SELECT * FROM citus_shards WHERE table_name::text = 'temperature' AND shard_size > 0;

SELECT count(*) FROM temperature;
EXPLAIN (VERBOSE ON) SELECT count(*) FROM temperature;

SELECT * from citus_drain_node('node5', 5432);
SELECT citus_remove_node('node5', 5432);

SELECT count(*) FROM temperature;

SELECT citus_add_node('node5', 5432);
SELECT rebalance_table_shards('temperature');

SELECT count(*) FROM temperature;
