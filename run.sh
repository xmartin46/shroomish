#!/usr/bin/env bash
echo 'Shroomish Shutting down last containers'
docker-compose down
echo 'Shroomish Building and kicking off the PostgresSQL DB container'
docker-compose up -d --build shroomish-db
echo 'Shroomish Sleeping 5 seconds for letting the DB initializes'
sleep 5


echo 'Shroomish Creating DDL Base'
docker run -it --rm --network shroomish shroomish-db psql -h shroomish-db -U postgres postgres -f /tmp/create_ddl_base.sql
docker run -it --rm --network shroomish shroomish-db psql -h shroomish-db -U mushroom_admin shroomish -f /tmp/create_ddl_shroomish.sql
echo 'Shroomish DDL Trippify created'

echo 'Shroomish Building Classifier backend'
docker compuse up -d build shroomish-classifier
echo 'Shroomish Building and kicking off the Frontend containers'
docker-compose up -d --build shroomish-client-app
echo 'Shroomish Building and kicking off the Backend containers'
docker-compose up -d --build shroomish-api-app 
echo 'Shroomish Deployed!'
