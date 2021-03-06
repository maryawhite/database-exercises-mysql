USE employees;

#In your script, use DISTINCT to find the unique titles in the titles table. Your results should look like:
SELECT DISTINCT title FROM titles;

#Find your query for employees whose last names start and end with 'E'.
# Update the query to find just the unique last names that start and end with 'E' using GROUP BY.
SELECT DISTINCT last_name from employees WHERE last_name LIKE 'E%' AND last_name LIKE '%E' ORDER BY last_name ASC;
SELECT last_name FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%E' GROUP BY last_name ORDER BY last_name ASC;
#the following would also work to find last names that start and end with e:
SELECT last_name FROM employees WHERE last_name LIKE 'e%e' GROUP BY last_name ORDER BY last_name;

#Update your previous query to now find unique combinations of first and last name where the last name starts and ends with 'E'. You should get 846 rows.
SELECT last_name, first_name FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%E' GROUP BY last_name, first_name ORDER BY last_name ASC;

#Find the unique last names with a 'q' but not 'qu'.
SELECT last_name FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%' GROUP BY last_name;

#Add a COUNT() to your results and use ORDER BY to make it easier to find employees whose unusual name is shared with others.
SELECT COUNT(*) AS 'NUMBER OF PEOPLE', last_name FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%' GROUP BY last_name ORDER BY COUNT(*);

#Update your query for 'Irena', 'Vidya', or 'Maya'. Use count(*) and GROUP BY to find the number of employees for each gender with those names
SELECT COUNT(gender), gender FROM employees WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya' GROUP BY gender;

# find all employees who had their 30th anniversary in the last 30 days, or are about to have their 30th anniversary in the next 30 days.
SELECT * FROM employees WHERE (dateDiff(CURDATE(), hire_date) BETWEEN 10920 AND 10980);

# find all employees who are about to have their 30th anniversary in the next 30 days.
SELECT * FROM employees WHERE (dateDiff(CURDATE(), hire_date) BETWEEN 10920 AND 10950);



#lecture notes
SELECT DISTINCT first_name
FROM employees;
# same as
SELECT first_name
FROM employees
GROUP BY first_name;
# columns that appear in select should also appear in Group by
#multiple columns
SELECT last_name, first_name
FROM employees
GROUP BY last_name, first_name;