
create table person (
	id serial constraint pk_stars primary key,
	name varchar(150) not null,
	birthdate date null
);

create table movie (
	id serial constraint pk_movie primary key,
	title varchar(300) not null,
	year smallint not null,
	duration smallint null,
	synopsis text null,
	poster_uri varchar(300) null,
	color varchar(20) null,
	pg varchar(15) null,
	director_id int null,
	constraint uniq_movie UNIQUE(title, year),
	constraint chk_movie_year CHECK(year >= 1850)
);

create table play(
	movie_id int not null,
	actor_id int not null,
	role varchar(100),
	constraint pk_play primary key(movie_id, actor_id)
);

create table have_genre(
	movie_id int not null,
	genre varchar(20) not null
);

alter table movie add constraint fk_movie_director 
	FOREIGN KEY (director_id)
	references person(id);
alter table play add constraint FK_PLAY_MOVIE 
	FOREIGN KEY (movie_id)
	references movie(id);
alter table play add constraint FK_PLAY_ACTOR 
	FOREIGN KEY (actor_id)
	references person(id);
alter table have_genre add constraint FK_HAVE_GENRE 
	FOREIGN KEY (movie_id)
	references movie(id);


