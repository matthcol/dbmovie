# Movie database

## (Windows only) Add PostgreSQL tools in Path variable
Add following dir in PATH variable: C:\Program Files\PostgreSQL\15\bin

## Create specific user, schema, db, ...
In directory sql/

### On windows
psql -U postgres -d postgres -h localhost -p 5432 -f 00-create-db-user.sql

### On linux as user postgres
su postgres -c "psql -f 00-create-db-user.sql"

## Create tables and data (Linux, Windows as any OS user)
In directory sql/ 
(you can specify another db by changing option -d)

psql -U movie -d dbmovie -h localhost -p 5432 -f pg_movie_all.sql