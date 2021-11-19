USE employees;

SELECT CONCAT (first_name,' ', last_name) AS 'FULL NAME' FROM employees LIMIT 10;


SELECT CONCAT (first_name,' ', last_name) AS 'FULL NAME', birth_date AS 'DOB' FROM employees LIMIT 10;

SELECT CONCAT (emp_no, ' - ', first_name,' ', last_name) AS 'FULL NAME', birth_date AS 'DOB' FROM employees LIMIT 10;

