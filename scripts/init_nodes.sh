#!/bin/bash
# init des tables sur les noeuds partitions
docker cp ./node2.sql node2:/tmp/nodex.sql
docker exec -it node2 /bin/bash -c 'PGPASSWORD=postgres psql -U postgres postgres < /tmp/nodex.sql'
docker cp ./node3.sql node3:/tmp/nodex.sql
docker exec -it node3 /bin/bash -c 'PGPASSWORD=postgres psql -U postgres postgres < /tmp/nodex.sql'
docker cp ./node4.sql node4:/tmp/nodex.sql
docker exec -it node4 /bin/bash -c 'PGPASSWORD=postgres psql -U postgres postgres < /tmp/nodex.sql'
docker cp ./node5.sql node5:/tmp/nodex.sql
docker exec -it node5 /bin/bash -c 'PGPASSWORD=postgres psql -U postgres postgres < /tmp/nodex.sql'
# init de la table principale, des règles d'accès aux noeuds, du partitioning.
docker cp ./node1.sql node1:/tmp/node1.sql
docker exec -it node1 /bin/bash -c 'PGPASSWORD=postgres psql -U postgres postgres < /tmp/node1.sql'
# chargement des données
docker cp ./datas.sql node1:/tmp/datas.sql
docker exec -it node1 /bin/bash -c 'PGPASSWORD=postgres psql -U postgres postgres < /tmp/datas.sql'
# retours de requêtes de tests
docker cp ./tests.sql node1:/tmp/tests.sql
docker exec -it node1 /bin/bash -c 'PGPASSWORD=postgres psql -U postgres postgres < /tmp/tests.sql'
