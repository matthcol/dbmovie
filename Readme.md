# Movie database

## Add PostgreSQL tools in Path variable
Add following dir in PATH variable: C:\Program Files\PostgreSQL\15\bin

## Create specific user, schema, db, ...
psql -U postgres -d postgres -h localhost -p 5432 -f 00-create-db-user.sql