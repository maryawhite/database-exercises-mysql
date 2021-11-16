USE codeup_test_db;

CREATE TABLE IF NOT EXISTS albums (
                                      id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                      artist_name VARCHAR(50) DEFAULT 'NONE',
                                      record_name  VARCHAR(100) NOT NULL,
                                      release_date INT UNSIGNED,
                                      sales_mil FLOAT,
                                      genre TEXT NOT NULL,
                                      PRIMARY KEY (id)
);

# open a terminal, and run the script as codeup_test_user with the following command:
#
#
# mysql -u codeup_test_user -p < albums_migration.sql
# After running the script, connect to the MySQL server as you have done previously.
#
# USE the codeup_test_db and use DESCRIBE and SHOW CREATE to verify that your albums table has been successfully created.