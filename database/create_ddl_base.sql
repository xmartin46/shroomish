/* https://www.postgresql.org/docs/current/sql-createrole.html */
CREATE USER mushroom_admin WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION
  NOBYPASSRLS /* Mine */
  PASSWORD 'mushroom1234';

CREATE DATABASE shroomish WITH
  OWNER = mushroom_admin
  TEMPLATE = DEFAULT /* Mine */
  ENCODING = 'utf8'
  LC_COLLATE = 'en_US.utf8' /* Latin sorting GOOD? */
  LC_CTYPE = 'en_US.utf8' /* Latin sorting GOOD? */
  TABLESPACE = pg_default;


ALTER ROLE mushroom_admin IN DATABASE shroomish SET search_path TO shroomish;
