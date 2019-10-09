CREATE TABLE "Users" (
	"id" serial,
	"name" VARCHAR(255),
	"email" VARCHAR(255) NOT NULL,
	CONSTRAINT "Users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Mushroom" (
	"id" serial NOT NULL,
	"description" VARCHAR(255) NOT NULL,
	"edible" BOOLEAN NOT NULL,
	CONSTRAINT "Mushroom_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "LatLngList" (
	"LatLng" VARCHAR(255) NOT NULL,
	"id" integer NOT NULL,
	CONSTRAINT "LatLngList_pk" PRIMARY KEY ("LatLng")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "photoList" (
	"PhotoURL" serial(255) NOT NULL,
	"id" serial NOT NULL,
	CONSTRAINT "photoList_pk" PRIMARY KEY ("PhotoURL")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Password" (
	"password" VARCHAR(255) NOT NULL,
	"id" integer NOT NULL
) WITH (
  OIDS=FALSE
);





ALTER TABLE "LatLngList" ADD CONSTRAINT "LatLngList_fk0" FOREIGN KEY ("id") REFERENCES "Mushroom"("id");

ALTER TABLE "photoList" ADD CONSTRAINT "photoList_fk0" FOREIGN KEY ("id") REFERENCES "Mushroom"("id");

ALTER TABLE "Password" ADD CONSTRAINT "Password_fk0" FOREIGN KEY ("id") REFERENCES "Users"("id");

