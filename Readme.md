# Movie database

## Run docker

Script shell ou powershell start-all

## Check containers
- state (check composition name)

docker compose -p maria-dbmovie ps -a

- logs (check composition name)

docker compose -p maria-dbmovie logs

docker compose -p maria-dbmovie logs db

docker compose -p maria-dbmovie logs gui

## Delete container(s)
- containers (check composition name)
docker compose -p maria-dbmovie down

- volumes (check name in .env)
docker volume rm maria-dbmovie-data

## CLI
Toutes les commandes doivent être précédées de (check composition name):

docker compose -p maria-dbmovie exec -it db

- Lancer un shell (si disponible)
bash

sh

- Se connecter avec le user movie:

mariadb -u movie -p dbmovie

## MariaDB CLI
- Lister les bases

show databases;

- Lister les tables

show tables;

- Vérifier le contenu d'une table

select * from movies limit 50;