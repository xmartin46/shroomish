CREATE SCHEMA shroomish AUTHORIZATION mushroom_admin;

-- Id sequences
/*CREATE SEQUENCE trippify_trip_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE trippify_trip_id_seq
    OWNER TO mushroom_admin;


CREATE SEQUENCE trippify_route_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE trippify_route_id_seq
    OWNER TO mushroom_admin;


CREATE SEQUENCE trippify_participant_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE trippify_participant_id_seq
    OWNER TO mushroom_admin;


CREATE SEQUENCE trippify_car_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE trippify_car_id_seq
    OWNER TO mushroom_admin;*/

-- Tables
/* id integer NOT NULL DEFAULT nextval('trippify_car_id_seq'::regclass) */
CREATE TABLE user_account (
	id serial NOT NULL,
	name VARCHAR(255) NOT NULL UNIQUE COLLATE pg_catalog."default",
	email VARCHAR(255) NOT NULL UNIQUE COLLATE pg_catalog."default",
	CONSTRAINT user_account_pkey PRIMARY KEY ("id")
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
	CONSTRAINT user_password_pkey PRIMARY KEY ("id")
  CONSTRAINT user_password_fkey FOREIGN KEY (id_user)
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
	CONSTRAINT mushroom_pkey PRIMARY KEY ("id")
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
	CONSTRAINT mushroom_coordinate_pkey PRIMARY KEY ("id")
  CONSTRAINT mushroom_coordinate_fkey FOREIGN KEY (id_mushroom)
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
	CONSTRAINT mushroom_image_pkey PRIMARY KEY ("id")
  CONSTRAINT mushroom_image_fkey FOREIGN KEY (id_mushroom)
      REFERENCES mushroom (id) /*MATCH SIMPLE
      ON UPDATE NO ACTION
      ON DELETE NO ACTION*/
) WITH (
  OIDS=FALSE
)
TABLESPACE pg_default;

ALTER TABLE mushroom_image
    OWNER to mushroom_admin;

-- Insert values
insert into trippify_trip values (default, 'Royal Hackaway 2019', 'Best hackathon ever', 'Windsor Building, University in Egham, England', 'EUR');

insert into trippify_route values (default, '1,4,3,2');
insert into trippify_route values (default, '6,5,7');
insert into trippify_route values (default, '9,10,8');

insert into trippify_participant values (default, 1, 1, 'Bernat', 'Charing Cross Station, London, UK', 'rock');
insert into trippify_participant values (default, 1, 1, 'Albert', 'Camden Town, London, UK', 'chill');
insert into trippify_participant values (default, 1, 1, 'Felix', 'Liverpool Street, London, UK', 'indie');
insert into trippify_participant values (default, 1, 1, 'Elena', 'Waterloo Station, London, UK', 'pop');
insert into trippify_participant values (default, 1, 2, 'Ferja', 'North Wembley Station, Wembley, UK', 'classical');
insert into trippify_participant values (default, 1, 2, 'David', 'Alperton Station, Wembley, UK', 'soul');
insert into trippify_participant values (default, 1, 2, 'Gorka', 'St Georges Shopping Centre, Harrow, UK', 'dance');
insert into trippify_participant values (default, 1, 3, 'Andreu', 'Dartford Grammar School, Dartford, UK', 'funk');
insert into trippify_participant values (default, 1, 3, 'Carlota', 'North Kent College, Dartford, UK', 'punk');
insert into trippify_participant values (default, 1, 3, 'Victor', 'Dartford Station, Dartford, UK', 'house');

insert into trippify_car values (default, 1, 'Tixerino', 'Renault', 'Clio', 4);
insert into trippify_car values (default, 6, 'El bicho', 'Citroen', 'C3', 4);
insert into trippify_car values (default, 9, 'Gracia car', 'Honda', 'Civic', 4);
