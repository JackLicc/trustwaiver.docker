#!/bin/bash

[ ! -d "codebases/trustwaiver" ] && git clone --branch main git@github.com:JackLicc/trustwaiver.git codebases/trustwaiver
[ ! -d "codebases/trustwaiver-fe" ] && git clone --branch main git@github.com:JackLicc/trustwaiver-fe.git codebases/trustwaiver-fe

docker compose up --no-start

docker compose up --detach
sleep 60

docker exec -it mysql bash -c "chmod 444 /etc/mysql/my.cnf"

docker compose -f ./docker-compose.yaml stop
sleep 20

docker compose -f ./docker-compose.yaml up --detach
sleep 60

echo "Environment created ok. Run start.sh to run."
