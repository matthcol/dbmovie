update movies set id_director = ida
	where title = 'Family Plot' and year = 1976
		and ida = (select id from stars where name='Alfred Hitchcock');
-- insert into movies (title,year,duration,synopsis,poster_uri) 
--	values ('Frenzy',1972,116,'A serial murderer is strangling women with a necktie. The London police have a suspect, but he is the wrong man.','https://m.media-amazon.com/images/M/MV5BMTg0MTg2ODE5Ml5BMl5BanBnXkFtZTgwMzUxMDY0MTE@._V1_SY1000_CR0,0,678,1000_AL_.jpg');
-- insert into movies (title,year,duration,synopsis,poster_uri) 
--	values ('Topaz',1969,143,'A French Intelligence Agent becomes embroiled in the Cold War politics first with uncovering the events leading up to the 1962 Cuban Missile Crisis, and then back to France to break up an international Russian spy ring.','https://m.media-amazon.com/images/M/MV5BMTYyZDdiYjEtYmZkMy00Y2EyLWIwOGUtYzdlMzgzZDZkOTQwXkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_SY1000_CR0,0,660,1000_AL_.jpg');
-- insert into movies (title,year,duration,synopsis,poster_uri) 
--	values ('Torn Curtain',1966,128,'An American scientist publicly defects to East Germany as part of a cloak and dagger mission to find the solution for a formula resin before planning an escape back to the West.','https://m.media-amazon.com/images/M/MV5BNTYwODI4NjcwOV5BMl5BanBnXkFtZTgwMzU0OTk5MTE@._V1_.jpg');
-- insert into movies (title,year,duration,synopsis,poster_uri) 
--	values ('Marnie',1964,130,'Mark marries Marnie although she is a habitual thief and has serious psychological problems, and tries to help her confront and resolve them.','https://m.media-amazon.com/images/M/MV5BYjQwZjliMjQtZDg3Yy00MzVmLWI3YTgtYjMxNWNkN2ZhMzg2L2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_SX653_CR0,0,653,999_AL_.jpg');
-- insert into movies (title,year,duration,synopsis,poster_uri) 
--	values ('The Birds',1963,119,'A wealthy San Francisco socialite pursues a potential boyfriend to a small Northern California town that slowly takes a turn for the bizarre when birds of all kinds suddenly begin to attack people.','https://m.media-amazon.com/images/M/MV5BMTAxNDA1ODc5MDleQTJeQWpwZ15BbWU4MDg2MDA4OTEx._V1_SY1000_CR0,0,651,1000_AL_.jpg');
-- insert into movies (title,year,duration,synopsis,poster_uri) 
	values ('Psycho',1960,109,'A Phoenix secretary embezzles $40,000 from her employer''s client, goes on the run, and checks into a remote motel run by a young man under the domination of his mother.','https://m.media-amazon.com/images/M/MV5BNTQwNDM1YzItNDAxZC00NWY2LTk0M2UtNDIwNWI5OGUyNWUxXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SY1000_CR0,0,672,1000_AL_.jpg');
