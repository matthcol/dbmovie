-- DDL for mysql, mariadb, postgresql
-- add association director
alter table movies add id_director int null;
alter table movies add 	CONSTRAINT fk_movie_director 
	FOREIGN KEY (id_director) REFERENCES stars(id);
	