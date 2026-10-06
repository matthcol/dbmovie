ALTER SESSION SET CONTAINER=XEPDB1;
create user umovie identified by password;
grant connect, resource to umovie;
alter user umovie quota unlimited on users;
