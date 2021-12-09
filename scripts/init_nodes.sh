#!/bin/bash
# init de la table principale, config noeuds.
docker cp ./node1.sql node1:/tmp/node1.sql
docker exec -it node1 /bin/bash -c 'PGPASSWORD=postgres psql -U postgres postgres < /tmp/node1.sql'
# chargement des données
docker cp ./datas.sql node1:/tmp/datas.sql
docker exec -it node1 /bin/bash -c 'PGPASSWORD=postgres psql -U postgres postgres < /tmp/datas.sql'
