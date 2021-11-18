USE codeup_test_db;

SELECT 'Albums released after 1991' AS 'Release Info';
DELETE FROM albums WHERE release_date > 1991;

SELECT 'Albums with genre Disco' AS 'Genre Info';
DELETE FROM albums WHERE genre = 'Disco';

SELECT 'albums by Whitney' AS 'albums by Whitney';
DELETE FROM albums WHERE artist_name = 'Whitney Houston';


# mysql -u codeup_test_user -p < delete_exercises.sql

