USE codeup_test_db;

SELECT 'The name of all albums by Pink Floyd' AS 'Info';
SELECT 'record_name' FROM albums WHERE 'artist_name' = 'Pink Floyd';

SELECT 'The year Sgt. Pepper''s Lonely Hearts Club Band was released' AS 'Info';
SELECT 'release_date' FROM albums WHERE 'record_name' = 'Sgt. Pepper''s Lonely Hearts Club Band';

SELECT 'The genre for Nevermind' AS 'Info';
SELECT 'genre' FROM albums WHERE 'record_name' = 'Nevermind';

SELECT 'Which albums were released in the 1990s' AS 'Info';
SELECT 'record_name' FROM albums WHERE 'release_date' BETWEEN 1990 AND 2000;

SELECT 'Which albums had less than 20 million certified sales' AS 'INFO';
SELECT 'record_name' FROM albums WHERE 'sales_mil' < 20.0;

SELECT 'All the albums with a genre of Rock' FROM albums WHERE 'genre' = 'Rock';










