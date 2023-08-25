USE hr;
-- Task 1

SELECT city, count(*) as Emp_count FROM employees
JOIN locations
JOIN departments
ON employees.department_id = departments.department_id AND departments.location_id = locations.location_id
GROUP BY city ORDER BY Emp_count DESC LIMIT 5;

-- Task 2
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));      /* to turn off ONLY GROUP BY */

SELECT first_name, last_name, country_name, city, department_name, salary, count(*) as Emp_count FROM employees
JOIN departments
JOIN countries
JOIN locations
ON employees.department_id = departments.department_id
AND departments.location_id = locations.location_id
AND locations.country_id = countries.country_id
GROUP BY city ORDER BY Emp_count DESC LIMIT 5;

-- Task 3

SELECT city, count(employee_id) as Emp_count FROM employees
JOIN locations
JOIN departments
ON employees.department_id = departments.department_id
AND locations.location_id = departments.location_id
GROUP BY city HAVING count(employee_id) <10 ORDER BY count(employee_id) DESC;

-- Task 4 

SELECT city, avg(YEAR(curdate()) - YEAR (hire_date)) AS Exp FROM employees 
JOIN departments
JOIN locations
ON employees.department_id = departments.department_id
AND locations.location_id = departments.location_id
GROUP BY city HAVING count(employee_id) < 10;

-- Task 5 

SELECT first_name, last_name, email, phone_number FROM employees
JOIN departments
JOIN locations
ON employees.department_id = departments.department_id
AND locations.location_id = departments.location_id
GROUP BY city HAVING 'YEAR(curdate()) - YEAR (hire_date)' >'10' ORDER BY count(employee_id) DESC LIMIT 5;

-- Task 6

SELECT first_name, last_name, departments.manager_id FROM employees
JOIN departments
JOIN locations
ON employees.department_id = departments.department_id
AND departments.location_id = locations.location_id
GROUP BY city HAVING 'YEAR(curdate()) - YEAR(hire_date)' > '10' ORDER BY count(employee_id) DESC LIMIT 5;
