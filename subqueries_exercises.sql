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
SELECT employees.emp_no, departments.dept_name FROM employees
    JOIN dept_manager dm on employees.emp_no = dm.emp_no
    JOIN departments ON dm.dept_no = departments.dept_no
WHERE employees.gender = 'F' AND dm.to_date > NOW();


#Find the first and last name of the employee with the highest salary.
SELECT e.emp_no, e.first_name, e.last_name, salary FROM salaries
JOIN employees e on e.emp_no = salaries.emp_no
order by salary DESC
LIMIT 1;

#find the current average salary of all employees
SELECT AVG(salary) AS AVG_SALARY FROM salaries WHERE to_date > NOW();  #72012.2359

#find all the employees who have a salary higher than the average
SELECT employees.emp_no, first_name, last_name, s.salary FROM employees
JOIN salaries s on employees.emp_no = s.emp_no
WHERE s.salary > (SELECT AVG(salary) FROM salaries WHERE to_date > NOW())
AND s.to_date > NOW()
ORDER BY s.salary DESC
LIMIT 100;


#find employees who have a salary between 72000 and 72050
SELECT employees.emp_no, first_name, last_name, s.salary FROM employees
JOIN salaries s on employees.emp_no = s.emp_no
WHERE s.salary BETWEEN 72000 AND 72050
  AND s.to_date > NOW()
ORDER BY s.salary
LIMIT 50;

#find employees who have a salary above 150000, show what dept they work in
SELECT employees.emp_no, first_name, last_name, s.salary, dept_name, gender FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments d on dept_emp.dept_no = d.dept_no
JOIN salaries s on employees.emp_no = s.emp_no
WHERE s.salary > 150000 AND s.to_date > NOW()
ORDER BY s.salary DESC
LIMIT 10;





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
