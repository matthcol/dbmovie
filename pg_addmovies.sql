CREATE OR REPLACE procedure addmovies(
	pcount integer,
	ptitle varchar, 
	pyearmin integer DEFAULT 1888,
	pyearmax integer DEFAULT 3000) as $$
DECLARE
	vyearoffset integer;
	vyeardelta integer;
BEGIN
	vyeardelta := pyearmin - pyearmax;
	vyearoffset := 0;
	FOR i IN 1 .. pcount LOOP
		vyearoffset := (vyearoffset + 1) % vyeardelta;
		insert into movies (title, year) values (ptitle || '_' || i, pyearmin + vyearoffset);
	END LOOP;
END
$$ LANGUAGE plpgsql;
