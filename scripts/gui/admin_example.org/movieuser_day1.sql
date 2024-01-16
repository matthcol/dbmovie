-- whoami
select current_role;
select current_user;


-- set search_path for this session only
show search_path;
set search_path = 'schemamovie';  -- 'schema1,schema2, schema3' 
show search_path;

create table studios (
	id serial,
	name varchar(100)
);

select * from studios;

select * from pg_tables;

-- after modifying search_path  for this user (in dba session)
show search_path;
select * from studios;

-- identity clause
create table places(
	id int generated always as identity
		constraint  pk_places primary key,
	name varchar(100)
);

-- sequence strategy

create sequence person_id_seq;
create sequence movie_id_seq;

create table person (
	id int constraint pk_stars primary key,
	name varchar(150) not null,
	birthdate date null
);

create table movie (
	id int constraint pk_movies primary key,
	title varchar(300) not null,
	year smallint not null,
	duration smallint null,
	synopsis text null,
	poster_uri varchar(300) null,
	color varchar(20) null,
	pg varchar(15) null,
	director_id int null,
	constraint chk_movie_year CHECK(year >= 1850)
);

alter table movie add constraint fk_movie_director 
	FOREIGN KEY (director_id)
	references person(id);
	
insert into movie(id, title, year) values (nextval('movie_id_seq'), 'Barbie', 2023);
-- INSERT 0 1

insert into movie(id, title, year) values (nextval('movie_id_seq'), 'Wonka', 2023)
returning (id);  -- return id

insert into movie(id, title, year) 
values (nextval('movie_id_seq')::regclass, 'Oppenheimer', 2023)
returning (id);  -- return id

select * from movie;

-- temporal data
select 
	CURRENT_TIMESTAMP, -- with tz
	CURRENT_TIMESTAMP::timestamp, -- without tz
	CURRENT_DATE,
	CURRENT_TIME -- with tz
;











