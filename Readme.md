# Movie database

## Create specific user, schema, db, ...
In directory sql/

### On linux as user root
mysql -u root < 00-create-db-user.sql

## Create tables and data (Linux, Windows as any OS user)
In directory sql/ 

mysql -u movie -p dbmovie < maria_movie_all.sql

## Tests
- Se connecter avec le user movie:

mysql -u movie -p dbmovie

- Lister les bases

show databases;

- Lister les tables

show tables;

- Vérifier le contenu d'une table

select * from movies limit 50;