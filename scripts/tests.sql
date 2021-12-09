EXPLAIN SELECT * FROM temperature;
EXPLAIN SELECT * FROM temperature WHERE timestamp = '2021-05-15';
EXPLAIN SELECT * FROM temperature WHERE timestamp >= '2021-05-15' AND timestamp <= '2021-06-25';

SELECT 'node 1 : ', count(*) as res FROM temperature
UNION SELECT 'node 2 : ', count(*) as res FROM temperature_2
UNION SELECT 'node 3 : ', count(*) as res FROM temperature_3
UNION SELECT 'node 4 : ', count(*) as res FROM temperature_4
UNION SELECT 'node 5 : ', count(*) as res FROM temperature_5;

UPDATE temperature SET timestamp = '2021-07-20' WHERE timestamp = '2021-06-20';

SELECT * FROM temperature WHERE timestamp = '2021-07-20';
EXPLAIN SELECT * FROM temperature WHERE timestamp = '2021-07-20';


SELECT 'node 1 : ', count(*) as res FROM temperature
UNION SELECT 'node 2 : ', count(*) as res FROM temperature_2
UNION SELECT 'node 3 : ', count(*) as res FROM temperature_3
UNION SELECT 'node 4 : ', count(*) as res FROM temperature_4
UNION SELECT 'node 5 : ', count(*) as res FROM temperature_5;
