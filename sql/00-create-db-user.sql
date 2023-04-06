-- execute this script in admin mode
-- NB: you can create a specific database also: dbmovie, dbmovietest, dbmoviequery
create user movie with login password 'password';
create schema movie authorization movie;