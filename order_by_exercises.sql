USE employees;
## Modify your first query to order by first name. The first result should be Irena Reutenauer and the last result should be Vidya Demeyer.
## Update the query to order by first name and then last name. The first result should now be Irena Acton and the last should be Vidya Boguraev.
## Change the ORDER BY clause so that you order by last name before first name. Your first result should still be Irena Acton but now the last result should be Vidya Quittner

SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name;
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name, last_name;
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY last_name, first_name;


## Update your queries for employees with 'E' in their last name to sort the results by their employee number. Your results should not change!
## Now reverse the sort order for both queries and compare results.

# Find all employees whose last name starts with 'E' — 7,330 rows
SELECT * FROM employees WHERE last_name LIKE 'E%' ORDER BY emp_no ASC;

SELECT * FROM employees WHERE last_name LIKE 'E%' ORDER BY emp_no DESC;



# Find all employees with a 'q' in their last name — 1,873 rows.
SELECT last_name FROM employees WHERE last_name LIKE '%q%';


# Update your query for 'Irena', 'Vidya', or 'Maya' to use OR instead of IN — 709 rows.
SELECT * FROM employees WHERE first_name = 'Irena'
                           OR first_name = 'Vidya'
                           OR first_name = 'Maya';


# Add a condition to the previous query to find everybody with those names who is also male — 441 rows.
SELECT * FROM employees WHERE gender = 'M'
                          AND (
                first_name = 'Irena'
            OR first_name = 'Vidya'
            OR first_name = 'Maya'
        );

# Find all employees whose last name starts or ends with 'E' — 30,723 rows.
SELECT last_name FROM employees WHERE last_name LIKE 'E%' OR last_name LIKE '%E';


# Duplicate the previous query and update it to find all employees whose last name starts and ends with 'E' — 899 rows
SELECT last_name FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%E';


# Find all employees with a 'q' in their last name but not 'qu' — 547 rows.
SELECT last_name FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';