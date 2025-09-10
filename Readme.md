# Movie database (MSSQL)

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