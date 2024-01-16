show search_path;
select * from persons; -- public.persons
select * from public.persons;

-- ADMIN: 
-- DB
create database dbmovie2;
-- user/role
create user movieuser with 
	login 
	password 'password';
alter user movieuser set search_path = 'schemamovie';