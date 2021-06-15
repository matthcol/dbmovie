-- DDL postgresql, mysql, mariadb
-- association actors
create table play(
	id_movie int not null,
	id_actor int not null,
	role varchar(100),
	constraint pk_play primary key(id_movie, id_actor),
	constraint fk_play_actor foreign key (id_actor) 
			references stars(id),
	constraint fk_play_movie foreign key (id_movie) 
			references movies(id)
);
