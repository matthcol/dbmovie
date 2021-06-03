-- Create database and user for a movie database
--
-- Run with: psql -U postgres -f pg_cine_initdb.sql
-- (will use maintenance database postgres before creating new one)

create database dbmovie ENCODING 'UTF-8';

create user movie LOGIN password 'password';
