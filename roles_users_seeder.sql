USE join_test_db;

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
    ('bob', 'bob@example.com', 1),
    ('joe', 'joe@example.com', 2),
    ('sally', 'sally@example.com', 3),
    ('adam', 'adam@example.com', 3),
    ('jane', 'jane@example.com', null),
    ('mike', 'mike@example.com', null);

# mysql -u root -p < roles_users_seeder.sql

#Notes: from the terminal, I added 4 new users
#INSERT INTO users (name, email, role_id) VALUES
#  ('mary', 'mary@example.com', 2),
#  ('charlie', 'charlie@example.com', 2),
#  ('sarah', 'sarah@example.com', 2),
#  ('duncan', 'duncan@example.com', NULL);

# from the terminal perform a basic join query.
#
# SELECT users.name as user_name, roles.name as role_name
# FROM users
# JOIN roles ON users.role_id = roles.id;  #the table users has a role_id and the table roles has an id. This is connecting them
# The result will show the users who have a role_id and what their role is (it will not show the users with a NULL role_id)
#
# LEFT JOIN - a left join will show you all the data from the left table even if they don't have a corresponding record from the right table
# SELECT users.name AS user_name, roles.name AS role_name
# FROM users
# LEFT JOIN roles ON users.role_id = roles.id;
#
# RIGHT JOIN - similar to left, but not as common because you could just swap the order of the tables by changing where it's FROM and still use LEFT JOIN
# SELECT users.name AS user_name, roles.name AS role_name
# FROM users
# RIGHT JOIN roles ON users.role_id = roles.id;
#
# of you could just change the FROM
# SELECT users.name as user_name, roles.name as role_name
# FROM roles                 #Note that this line changed, and the next line changes roles to users
# LEFT JOIN users ON users.role_id = roles.id;
#
### Use COUNT to get a list of roles along with the number of users with that role ###
#this code shows 3 NULL, 1 admin, 4 author, 2 reviewer, but doesn't show 0 commenters
# SELECT roles.id, COUNT(*) AS 'number_people_with_role', roles.name
# FROM users
# LEFT JOIN roles ON users.role_id = roles.id
# GROUP BY roles.id, roles.name;
#
# ## the code below will correctly show you that there are 0 commenters, but doesn't show the 3 NULL roles
# SELECT roles.id, COUNT(role_id) AS 'number_people_with_role', roles.name
# FROM roles
# LEFT JOIN users ON users.role_id = roles.id
# GROUP BY roles.id, roles.name;



