USE codeup_test_db;

SELECT 'Records' AS 'Record Info';
SELECT record_name FROM albums;

SELECT 'Albums released before 1980' AS 'Record Info';
SELECT record_name, release_date FROM albums WHERE release_date <= 1980;

SELECT 'records by Micheal' AS 'Record Info';
SELECT record_name, artist_name FROM albums WHERE artist_name = 'Michael Jackson';

# After each SELECT add an UPDATE statement to:
# Make all the albums 10 times more popular (sales * 10)
# Move all the albums before 1980 back to the 1800s.
# Change 'Michael Jackson' to 'Peter Jackson'
UPDATE albums
SET sales_mil = sales_mil * 10;
SELECT record_name, sales_mil FROM albums;

UPDATE albums
SET artist_name = 'Peter Jackson'
WHERE artist_name = 'Michael Jackson';
SELECT record_name, artist_name FROM albums WHERE artist_name = 'Peter Jackson';

UPDATE albums
SET release_date = release_date - 100
WHERE release_date <= 1980;
SELECT record_name, release_date FROM albums WHERE release_date <= 1980;


# mysql -u codeup_test_user -p < update_exercises.sql


