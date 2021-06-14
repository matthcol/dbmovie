create table movies (
	id serial constraint pk_movies primary key,
	title varchar(250) not null,
	year smallint not null,
	duration smallint null,
	synopsis text null
);

alter table movies add constraint CHK_MOVIES_YEAR CHECK (year >= 1888);
alter table movies add constraint CHK_MOVIES_DURATION CHECK (duration > 0);


