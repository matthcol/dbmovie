-- DDL mysql, mariadb
-- table stars
create table stars (
	id integer auto_increment,
	name varchar(150) not null,
	birthdate date null,
	constraint pk_star primary key(id)
);