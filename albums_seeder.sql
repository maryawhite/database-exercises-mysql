USE codeup_test_db;
TRUNCATE albums;

INSERT INTO albums (artist_name, record_name, release_date, sales_mil, genre)
    VALUES('Michael Jackson', 'Thriller', 1982, 48.9, 'Pop, Post-disco, Funk, Rock'),
       ('ACDC', 'Back In Black', 1980, 29.6, 'Hard rock'),
       ('Whitney Houston', 'The Bodyguard', 1992, 32.4, 'R&B, Soul, Pop'),
       ('Meat Loaf', 'Bat out of Hell', 1977, 21.7, 'Hard rock, Progressive rock, Rock'),
       ('Eagles', 'Their Greatest Hits 1971-1975', 1976, 41.2, 'Soft-rock, Folk, Rock'),
       ('Pink Floyd', 'The Dark Side of the Moon', 1973, 24.2, 'Progressive rock'),
       ('Eagles', 'Hotel California', 1976, 31.5, 'Soft rock'),
       ('Bee Gees', 'Saturday Night Fever', 1977, 21.6, 'Disco'),
       ('Fleetwood Mac', 'Rumours', 1977, 27.9, 'Soft rock'),
       ('Shania Twain', 'Come on Over', 1997, 29.6, 'Country, Pop'),
        ('Led Zeppelin', 'Led Zeppelin IV', 1971, 29.0, 'Hard rock, Heavy metal, Folk'),
        ('Michael Jackson', 'Bad', 1987, 20.7, 'Pop, R&B, Funk, Rock'),
        ('Alanis Morissette', 'Jagged Little Pill', 1995, 24.3, 'Alternative rock'),
        ('Michael Jackson', 'Dangerous', 1991, 17.0, 'New jack swing, R&B, Pop'),
        ('Celine Dion', 'Falling Into You', 1996, 21.1, 'Pop, Soft rock'),
        ('The Beatles', 'Sgt. Pepper''s Lonely Hearts Club Band', 1967, 18.2, 'Rock'),
        ('Various Artists', 'Dirty Dancing', 1987, 17.9, 'Pop, Rock, R&B'),
        ('Adele', '21', 2011, 26.4, 'Pop, Soul'),
        ('Celine  Dion', 'Lets Talk About Love', 1997, 19.3, 'Pop, Soft rock'),
        ('Metallica', 'Metallica', 1991, 25.2, 'Heavy metal'),
        ('The Beatles', '1', 2000, 23.5, 'Rock'),
        ('The Beatles', 'Abbey Road', 1969, 14.4, 'Rock'),
        ('ABBA', 'Gold: Greatest Hits', 1992, 23.0, 'Pop, Disco'),
        ('Bruce Springsteen', 'Born in the USA', 1984, 19.6, 'Rock'),
        ('Madonna', 'The Immaculate Collection', 1990, 19.5, 'Pop, Dance'),
        ('Pink Floyd', 'The Wall', 1979, 18.7, 'Progressive rock'),
        ('James Horner', 'Titanic: Music from the Motion Picture', 1997, 18.1, 'Soundtrack'),
        ('Dire Straits', 'Brothers in Arms', 1985, 17.7, 'Rock'),
        ('Nirvana', 'Nevermind', 1991, 16.7, 'Grunge, Alternative rock'),
        ('Santana', 'Supernatural', 1999, 20.5, 'Latin rock'),
        ('Guns N Roses', 'Appetite for Destruction', 1987, 21.9, 'Heavy metal, Hard rock'),
        ('Elton John', 'Goodbye Yellow Brick Road', 1973, 8.5, 'Rock, Pop rock, Glam rock');

# mysql -u codeup_test_user -p < albums_seeder.sql

