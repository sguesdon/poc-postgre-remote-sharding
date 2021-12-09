#!/bin/bash
# retours de requêtes de tests
docker cp ./tests.sql node1:/tmp/tests.sql
docker exec -it node1 /bin/bash -c 'PGPASSWORD=postgres psql -U postgres postgres < /tmp/tests.sql'
