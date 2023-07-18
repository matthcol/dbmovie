# Movie database

## Run docker

Script shell ou powershell start-all

## CLI
Toutes les commandes doivent être précédées de:

docker compose -p exec -it

- Se connecter avec le user movie:

mysql -u movie -p dbmovie

- Lister les bases

show databases;

- Lister les tables

show tables;

- Vérifier le contenu d'une table

select * from movies limit 50;