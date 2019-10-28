# name_latin    name_eng    url(redirect, dont take it)     img_urls    desc    edibility

import json
import os

mushroom = ''
images = ''
locations = ''

with open('./scraper/mushroom_classes.json', 'r') as json_file:
    data = json.load(json_file)
    for i, obj in enumerate(data):
        name_eng = obj['name_eng']
        name_latin = obj['name_latin']
        description = obj['description']
        edibility = obj['edibility']
        urls = obj['img_urls']

        # TODO: treat name_eng = ""
        if name_eng == "":
            name_eng = name_latin

        name_eng = name_eng.replace("'", "''")
        name_latin = name_latin.replace("'", "''")
        description = description.replace("'", "''")
        edibility = edibility.replace("'", "''")
        #description = description.split(".", 1)

        mushroom = mushroom + "INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES (" + "'" + name_eng + "'" + "," + "'" + name_latin + "'" + "," + "'" + description + "'" + "," + "'" + edibility + "'" + ");"

        for url in urls:
            url = url.replace("'", "''")
            images = images + "INSERT INTO mushroom_image(id_mushroom, URL) VALUES(" + str(i + 1) + "," + "'" + url + "'" + ");"


with open('locations.txt', 'r') as file:
    locations = file.read()

f = open("./database/create_ddl_base.sql", "w")
f.write("""
            CREATE USER mushroom_admin WITH
              LOGIN
              NOSUPERUSER
              INHERIT
              NOCREATEDB
              NOCREATEROLE
              NOREPLICATION
              NOBYPASSRLS
              PASSWORD 'mushroom1234';

            CREATE DATABASE shroomish WITH
              OWNER = mushroom_admin
              TEMPLATE = DEFAULT
              ENCODING = 'utf8'
              LC_COLLATE = 'en_US.utf8'
              LC_CTYPE = 'en_US.utf8'
              TABLESPACE = pg_default;


            ALTER ROLE mushroom_admin IN DATABASE shroomish SET search_path TO shroomish;""")
f.close()


f = open("./database/create_ddl_shroomish.sql", "w")
f.write("""CREATE SCHEMA shroomish AUTHORIZATION mushroom_admin;

            -- Tables
            CREATE TABLE user_account (
            	id serial NOT NULL,
            	name VARCHAR(255) NOT NULL UNIQUE COLLATE pg_catalog."default",
            	email VARCHAR(255) NOT NULL UNIQUE COLLATE pg_catalog."default",
            	CONSTRAINT user_account_pk PRIMARY KEY ("id")
            ) WITH (
              OIDS=FALSE
            )
            TABLESPACE pg_default;

            ALTER TABLE user_account
                OWNER to mushroom_admin;



            CREATE TABLE user_password (
            	id serial NOT NULL,
            	id_user integer NOT NULL,
            	password VARCHAR(255) NOT NULL COLLATE pg_catalog."default",
            	salt VARCHAR(255) NOT NULL COLLATE pg_catalog."default",
            	CONSTRAINT user_password_pk PRIMARY KEY ("id"),
              CONSTRAINT user_password_fk0 FOREIGN KEY (id_user)
                  REFERENCES user_account (id) /*MATCH SIMPLE
                  ON UPDATE NO ACTION
                  ON DELETE NO ACTION*/
            ) WITH (
              OIDS=FALSE
            )
            TABLESPACE pg_default;

            ALTER TABLE user_password
                OWNER to mushroom_admin;



            CREATE TABLE mushroom (
            	id serial NOT NULL,
            	name_eng VARCHAR(255) NOT NULL COLLATE pg_catalog."default",
            	name_latin VARCHAR(255) NOT NULL UNIQUE COLLATE pg_catalog."default",
            	description VARCHAR(10485760) NOT NULL COLLATE pg_catalog."default", /* 10485760 = MAX_SIZE OF VARCHAR*/
            	edibility VARCHAR(255) NOT NULL COLLATE pg_catalog."default",
            	CONSTRAINT mushroom_pk PRIMARY KEY ("id")
            ) WITH (
              OIDS=FALSE
            )
            TABLESPACE pg_default;

            ALTER TABLE mushroom
                OWNER to mushroom_admin;



            CREATE TABLE mushroom_coordinate (
            	id serial NOT NULL,
            	id_mushroom integer NOT NULL,
            	LatLng VARCHAR(255) NOT NULL COLLATE pg_catalog."default",
            	CONSTRAINT mushroom_coordinate_pk PRIMARY KEY ("id"),
              CONSTRAINT mushroom_coordinate_fk0 FOREIGN KEY (id_mushroom)
                  REFERENCES mushroom (id) /*MATCH SIMPLE
                  ON UPDATE NO ACTION
                  ON DELETE NO ACTION*/
            ) WITH (
              OIDS=FALSE
            )
            TABLESPACE pg_default;

            ALTER TABLE mushroom_coordinate
                OWNER to mushroom_admin;



            CREATE TABLE mushroom_image (
            	id serial NOT NULL,
            	id_mushroom integer NOT NULL,
            	URL VARCHAR(255) NOT NULL COLLATE pg_catalog."default",
            	CONSTRAINT mushroom_image_pk PRIMARY KEY ("id"),
              CONSTRAINT mushroom_image_fk0 FOREIGN KEY (id_mushroom)
                  REFERENCES mushroom (id) /*MATCH SIMPLE
                  ON UPDATE NO ACTION
                  ON DELETE NO ACTION*/
            ) WITH (
              OIDS=FALSE
            )
            TABLESPACE pg_default;

            ALTER TABLE mushroom_image
                OWNER to mushroom_admin;""" + mushroom + images + locations)
f.close()
