CREATE TABLE "user_account" (
	"id" serial NOT NULL,
	"name" VARCHAR(255) NOT NULL UNIQUE,
	"email" VARCHAR(255) NOT NULL UNIQUE,
	CONSTRAINT "Users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "mushroom" (
	"id" serial NOT NULL,
	"name_eng" VARCHAR(255) NOT NULL,
	"name_latin" VARCHAR(255) NOT NULL UNIQUE,
	"description" VARCHAR(10485760) NOT NULL, /* 10485760 = MAX_SIZE OF VARCHAR*/
	"edibility" VARCHAR(255) NOT NULL,
	CONSTRAINT "Mushroom_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "mushroom_coordinate" (
	"id" serial NOT NULL,
	"id_mushroom" integer NOT NULL,
	"LatLng" VARCHAR(255) NOT NULL,
	CONSTRAINT "LatLngList_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "mushroom_image" (
	"id" serial NOT NULL,
	"id_mushroom" integer NOT NULL,
	"PhotoURL" VARCHAR(255) NOT NULL,
	CONSTRAINT "photoList_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "user_password" (
	"id" serial NOT NULL,
	"id_user" integer NOT NULL,
	"password" VARCHAR(255) NOT NULL,
	"salt" VARCHAR(255) NOT NULL,
	CONSTRAINT "Password_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);





ALTER TABLE "mushroom_coordinate" ADD CONSTRAINT "mushroom_coordinate_fk0" FOREIGN KEY ("id_mushroom") REFERENCES "mushroom"("id");

ALTER TABLE "mushroom_image" ADD CONSTRAINT "mushroom_image_fk0" FOREIGN KEY ("id_mushroom") REFERENCES "mushroom"("id");

ALTER TABLE "user_password" ADD CONSTRAINT "user_password_fk0" FOREIGN KEY ("id_user") REFERENCES "user_account"("id");

/*CREATE TABLE "Users" (
	"id" serial NOT NULL,
	"name" VARCHAR(255) NOT NULL,
	"email" VARCHAR(255) NOT NULL UNIQUE,
	CONSTRAINT "Users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Mushroom" (
	"id" serial NOT NULL,
	"name" VARCHAR(255) NOT NULL UNIQUE,
	"description" VARCHAR(255) NOT NULL,
	"edible" BOOLEAN NOT NULL,
	CONSTRAINT "Mushroom_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "LatLngList" (
	"id" serial NOT NULL,
	"id_mushroom" integer NOT NULL,
	"LatLng" VARCHAR(255) NOT NULL,
	CONSTRAINT "LatLngList_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "photoList" (
	"id" serial NOT NULL,
	"id_mushroom" integer NOT NULL,
	"PhotoURL" VARCHAR(255) NOT NULL,
	CONSTRAINT "photoList_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Password" (
	"id" serial NOT NULL,
	"id_user" integer NOT NULL,
	"password" VARCHAR(255) NOT NULL,
	CONSTRAINT "Password_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);





ALTER TABLE "LatLngList" ADD CONSTRAINT "LatLngList_fk0" FOREIGN KEY ("id_mushroom") REFERENCES "Mushroom"("id");

ALTER TABLE "photoList" ADD CONSTRAINT "photoList_fk0" FOREIGN KEY ("id_mushroom") REFERENCES "Mushroom"("id");

ALTER TABLE "Password" ADD CONSTRAINT "Password_fk0" FOREIGN KEY ("id_user") REFERENCES "Users"("id"); */







/*CREATE TABLE "Users" (
	"id" serial,
	"name" VARCHAR(255),
	"email" VARCHAR(255) NOT NULL,
	CONSTRAINT "Users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Mushroom" (
	"id" serial NOT NULL,
	"name" VARCHAR(255) NOT NULL,
	"description" VARCHAR(255) NOT NULL,
	"edible" BOOLEAN NOT NULL,
	CONSTRAINT "Mushroom_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "LatLngList" (
	"LatLng" VARCHAR(255) NOT NULL,
	"id" VARCHAR(255) NOT NULL,
	CONSTRAINT "LatLngList_pk" PRIMARY KEY ("LatLng")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "photoList" (
	"PhotoURL" serial(255) NOT NULL,
	"id" serial(255) NOT NULL,
	CONSTRAINT "photoList_pk" PRIMARY KEY ("PhotoURL")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Password" (
	"password" BINARY NOT NULL,
	"id" BINARY NOT NULL
) WITH (
  OIDS=FALSE
);





ALTER TABLE "LatLngList" ADD CONSTRAINT "LatLngList_fk0" FOREIGN KEY ("id") REFERENCES "Mushroom"("id");

ALTER TABLE "photoList" ADD CONSTRAINT "photoList_fk0" FOREIGN KEY ("id") REFERENCES "Mushroom"("id");

ALTER TABLE "Password" ADD CONSTRAINT "Password_fk0" FOREIGN KEY ("id") REFERENCES "Users"("id");*/
