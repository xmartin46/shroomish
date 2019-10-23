import os

os.system('echo "Shroomish Creating DDL Base"')
os.system('docker run -it --rm --network shroomish shroomish-db psql -h shroomish-db -U postgres postgres -f /tmp/create_ddl_base.sql')

os.system('echo "Shroomish Creating DDL Schema and inserting data"')
os.system('docker run -it --rm --network shroomish shroomish-db psql -h shroomish-db -U mushroom_admin shroomish -f /tmp/create_ddl_shroomish.sql')

os.system('echo "Shroomish DDL created"')

os.remove('./database/create_ddl_base.sql')
os.remove('./database/create_ddl_shroomish.sql')
