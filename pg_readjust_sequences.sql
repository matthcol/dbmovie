-- readjust sequences
select setval('stars_id_seq', max(id)) from stars;
select setval('movies_id_seq', max(id)) from movies;
