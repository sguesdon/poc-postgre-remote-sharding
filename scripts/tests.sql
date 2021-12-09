SELECT * FROM citus_shards WHERE table_name::text = 'temperature' AND shard_size > 0;

SELECT count(*) FROM temperature;
EXPLAIN (VERBOSE ON) SELECT count(*) FROM temperature;
