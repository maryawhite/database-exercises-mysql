USE employees;

#Use concat() to combine their first and last name together as a single column in your results.
SELECT CONCAT (first_name,' ', last_name) AS 'FULL EMPLOYEE NAME' FROM employees WHERE last_name LIKE 'E%' OR last_name LIKE '%E';

# Find all employees born on Christmas
SELECT * FROM employees WHERE month(birth_date) = 12 AND day(birth_date) = 25;

#Find all employees hired in the 90s and born on Christmas — 362 rows.
SELECT * FROM employees WHERE year(hire_date) BETWEEN 1990 AND 1999 AND (month(birth_date) = 12 AND day(birth_date) = 25);

# Change the query for employees hired in the 90s and born on Christmas such that the first result is the oldest employee who was hired last. It should be Khun Bernini
# dob ASC and hire date ASC
SELECT * FROM employees WHERE month(birth_date) = 12 AND day(birth_date) = 25 ORDER BY hire_date DESC, birth_date ASC;


# For your query of employees born on Christmas and hired in the 90s, use datediff() to find how many days they have been working at the company (Hint: You might also need to use now() or curdate()).
SELECT last_name, dateDiff(CURDATE(), hire_date) AS'NUMBER OF DAYS WORKING HERE' FROM employees WHERE year(hire_date) BETWEEN 1990 AND 1999 AND (month(birth_date) = 12 AND day(birth_date) = 25);



# bonus note from lecture limit to the first 10 names
SELECT CONCAT (first_name,' ', last_name) AS 'FULL EMPLOYEE NAME' FROM employees WHERE last_name LIKE 'E%' OR last_name LIKE '%E' LIMIT 10;
# find the next 10
SELECT CONCAT (first_name,' ', last_name) AS 'FULL EMPLOYEE NAME' FROM employees WHERE last_name LIKE 'E%' OR last_name LIKE '%E' LIMIT 10 OFFSET 10;
# find a list of first names like Ma, limit to 10
SELECT CONCAT (first_name,' ', last_name) AS 'FULL EMPLOYEE NAME' FROM employees WHERE first_name LIKE 'Ma%' LIMIT 10;
# lecture notes
SELECT * FROM employees WHERE year(birth_date) BETWEEN 1950 and 1955 AND month(birth_date) = 8 AND day(birth_date) = 10 LIMIT 20;
