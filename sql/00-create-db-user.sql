-- execute this script in admin mode
-- NB: you can create a specific database or work with db postgres
create user movie with login password 'password';
create database dbmovie encoding 'UTF-8';

-- change database to create schema movie
\c dbmovie
create schema movie authorization movie;