# Movie database (MSSQL)

## Environnement
Copier le fichier .env.sample en .env. Régler le choix de licence et accepter la licence.

```
# DB Accept License (default N)
DB_ACCEPT_LICENSE=Y

# DB Edition (default Developer): 
# Developer, Evaluation, Express, Standard, Enterprise, EnterpriseCore
DB_EDITION=Developer
```


## Créer le conteneur

- Lancer la composition
```
docker compose up -d
```

- Executer le scripts 0 (master)
- Executer les scripts 1 à 5 (dbmovie)
- Executer le script check (dbmovie)

## Sauver le conteneur en image

```
docker commit idcontainer mssqlmovie:1.0
```
 
## Recréer le conteneur

```
docker compose -f docker-compose.rerun.yml up -d  
```