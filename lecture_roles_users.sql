USE join_test_db;

DROP TABLE IF EXISTS roles;

CREATE TABLE IF NOT EXISTS roles (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    role_id INT UNSIGNED DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES roles (id)
);

# open a terminal
#
#
# mysql -u root -p < lecture_roles_users.sql
# After running the script, connect to the MySQL server as you have done previously.
#
# USE the join_test_db and use DESCRIBE and SHOW CREATE to verify that your table has been successfully created.