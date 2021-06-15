-- DDL postgresql
-- table stars
create table stars (
	id serial constraint pk_stars primary key,
	name varchar(150) not null,
	birthdate date null,
	deathdate date null
);