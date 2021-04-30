# Exemple de creation de 1000 movies Rambo_1 ... Rambo_1000
# the password is password
psql -U movie -d postgres -h localhost -p 5433 -c "call addmovies(1000, 'Rambo')"
