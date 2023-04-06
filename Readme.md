# Movie database

## Add PostgreSQL tools in Path variable
Add following dir in PATH variable: C:\Program Files\PostgreSQL\15\bin

## Create specific user, schema, db, ...
In directory sql/

psql -U postgres -d postgres -h localhost -p 5432 -f 00-create-db-user.sql

## Create tables and data
In directory sql/ 
(you can specify another db by changing option -d)

psql -U movie -d postgres -h localhost -p 5432 -f pg_movie_all.sql