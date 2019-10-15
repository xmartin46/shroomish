docker run -it --rm --network shroomish shroomish-db psql -h shroomish-db -U postgres postgres -f /tmp/create_ddl_base.sql
docker run -it --rm --network shroomish shroomish-db psql -h shroomish-db -U mushroom_admin shroomish -f /tmp/create_ddl_shroomish.sql

sudo service postgresql stop
sudo service postgresql start

DB_USER=mushroom_admin
DB_PASSWORD=''
DB_HOST=localhost
DB_PORT=5432
DB_DATABASE=shroomish
