USE employees;

SELECT * FROM employees LIMIT 10;
SELECT * FROM departments LIMIT 10;

SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees as e
         JOIN dept_emp as de
              ON de.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND e.emp_no = 10001;

#write a query that shows each department along with the name of the current manager for that department.
#SELECT * FROM departments; this shows all 9 departments
#SELECT * FROM dept_manager WHERE to_date = '9999-01-01'
SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees as e
    JOIN dept_manager AS dm
        ON dm.emp_no = e.emp_no
    JOIN departments d
        ON dm.dept_no = d.dept_no
WHERE dm.to_date = '9999-01-01'
ORDER BY dept_name;

#Find the name of all departments currently managed by women.
SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees as e
         JOIN dept_manager AS dm
              ON dm.emp_no = e.emp_no
         JOIN departments d
              ON dm.dept_no = d.dept_no
WHERE dm.to_date = '9999-01-01' AND gender = 'F'
ORDER BY dept_name;

#Find the current titles of employees currently working in the Customer Service department.
#Customer Service dept_no = d009
SELECT t.title AS 'title', COUNT(*) AS 'Total'
FROM employees as e
    JOIN titles AS t
        ON e.emp_no = t.emp_no
    JOIN dept_emp de
        ON e.emp_no = de.emp_no
    WHERE dept_no = 'd009' AND t.to_date = '9999-01-01' AND de.to_date = '9999-01-01'
    GROUP BY title;

#Find the current salary of all current managers.
SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager', s.salary AS 'Salary'
FROM employees as e
         JOIN dept_manager AS dm
            ON dm.emp_no = e.emp_no
         JOIN departments d
            ON dm.dept_no = d.dept_no
        JOIN salaries s
            ON e.emp_no = s.emp_no
WHERE dm.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
ORDER BY dept_name;

##
#Bonus Find the names of all current employees, their department name, and their current manager's name .
SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Employee', d.dept_name AS 'Department', CONCAT(e.first_name, ' ', e.last_name) AS 'Manager'
FROM employees as e
    JOIN dept_manager AS dm
         ON dm.emp_no = e.emp_no
    JOIN departments d
         ON dm.dept_no = d.dept_no
    JOIN dept_emp AS de
         ON e.emp_no = de.emp_no
WHERE de.to_date = '9999-01-01' AND dm.to_date = '9999-01-01'
ORDER BY dept_name
LIMIT 15;
