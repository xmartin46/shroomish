#!/usr/bin/env bash
echo 'Shroomish Shutting down last containers'
docker-compose down
echo 'Shroomish Building and kicking off the PostgresSQL DB container'
python3 parseObjects.py
docker-compose up -d --build shroomish-db
echo 'Shroomish Sleeping 5 seconds for letting the DB initializes'
sleep 5


python3 createDB_insertDATA.py


#echo 'Shroomish Building Classifier backend'
docker-compose up -d --build shroomish-classifier
echo 'Shroomish Building and kicking off the Frontend containers'
docker-compose up -d --build shroomish-client
echo 'Shroomish Building and kicking off the Backend containers'
docker-compose up -d --build shroomish-backend
echo 'Shroomish Deployed!'
