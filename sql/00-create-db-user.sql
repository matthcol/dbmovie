-- execute this script in admin mode

-- 1. create database
create database dbmovie CHARACTER SET utf8;

-- 2. create user with all privileges to database dbmovie

-- for local access only:
-- create user 'movie'@'localhost' identified by 'password';
-- grant all privileges on dbmovie.* to 'movie'@'localhost';

-- for local and remote access:
create user 'movie'@'*' identified by 'password';
grant all privileges on dbmovie.* to 'movie'@'*';

flush privileges;