select nextval('movies_id_seq'); -- 8079251
select currval('movies_id_seq'); -- 8079251
-- other session meanwhile
select currval('movies_id_seq'); -- 8079251 (same nb in this session)
select setval('movies_id_seq', 8079260); 
select currval('movies_id_seq'); -- 8079260


-- movies from 5 last years
select 
	title,
	year
from movies
where year >= (extract(year from current_date) - 5);


select 
	title,
	year
from movies
where year >= extract(year from (current_date - '5 years'::interval));

-- no year, month, ... functions => extract or date_part functions

-- select year(current_date);


-- nullable data
select * from movies
where duration is null;

select 
	title,
	year,
	coalesce(duration, 0) as duration
from movies
where 
	year = 1983
order by title;

select 
	title,
	year,
	coalesce(duration::varchar || ' mn', 'NC') as duration
from movies
where 
	year = 1983
order by title;


select *
from movies
where title like 'Star Wars%'; -- results

select *
from movies
where title like 'star wars%'; -- no results

select *
from movies
where title ilike 'star wars%'; --results (ci)

-- "Star Wars: Episode V - The Empire Strikes Back"
select *
from movies
where title ~* '^star wars: episode [XVIMCDL]+ - .*$';


select * from persons where name = 'Greta Gerwig';
insert into persons (name, birthdate) values ('Greta Gerwig', '1983-08-04');
insert into persons (name, birthdate) values ('Greta Gerwig', '04/08/1983');

show datestyle;
set datestyle = "ISO, DMY";

select 
	name,
	to_char(birthdate,'DD/MM/YYYY')
from persons 
where name = 'Greta Gerwig';












