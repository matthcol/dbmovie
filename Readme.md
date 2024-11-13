# Movie database

## Run docker

Script shell ou powershell cli-up.sh|ps1

Alternativement, lancer une des commandes docker compose suivantes:

```
docker compose up -d
docker compose -p dbmovie-mysql up -d
docker compose --env-file .env-other -p dbmovie-mysql-other up -d
```

## CLI
Toutes les commandes doivent être précédées de:

docker compose -p dbmovie-mysql exec -it db

- Se connecter avec le user movie:

mysql -u movie -p dbmovie

- Lister les bases

show databases;

- Lister les tables

show tables;

- Vérifier le contenu d'une table

select * from movies limit 50;