ALTER SESSION SET CONTAINER=XEPDB1;
create user movie identified by password;
grant connect, resource to movie;
alter user movie quota unlimited on users;
