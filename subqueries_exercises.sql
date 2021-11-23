USE employees;

#Find all the employees with the same hire date as employee 101010 using a subquery.
SELECT * FROM employees WHERE hire_date IN (SELECT hire_date FROM employees WHERE emp_no = 101010);

#Find all the titles held by all employees with the first name Aamod.
SELECT * FROM titles LIMIT 30;
SELECT * FROM employees WHERE first_name = 'Aamod';

SELECT title
FROM titles
WHERE emp_no IN
    (SELECT emp_no FROM employees WHERE first_name = 'Aamod')
GROUP BY title; #use this to get the 6 unique


#Find all the current department managers that are female.
SELECT *
FROM employees
WHERE gender = 'F' AND emp_no IN (
    SELECT emp_no FROM dept_manager WHERE to_date > NOW()
    );

#Bonus
#Find all the department names that currently have female managers.
SELECT dept_name FROM departments; #this finds the 9 departments



#Find the first and last name of the employee with the highest salary.



##lecture notes
# # find all the current department managers and birthdates, limit to 30
# SELECT first_name, last_name, birth_date
# FROM employees
# WHERE emp_no IN (
#     SELECT emp_no
#     FROM dept_manager
#     WHERE to_date > NOW()
# )
# LIMIT 30;

# USE join_test_db;
# SELECT * FROM users;
# SELECT * FROM roles;
#
# INSERT INTO users (name, email, role_id)
# VALUE ('Douglas', 'douglas@codeup.com', (
#     SELECT id FROM roles WHERE name = 'commenter'  #if we don't know what id number commenter is, this is a way to use it
#     ));
#
# UPDATE users
# SET role_id = (SELECT id FROM roles WHERE name = 'admin') #if we didn't know that admin was number 1, this would be a way to set it
# WHERE email = 'douglas@codeup.com'
