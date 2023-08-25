USE HR;

-- Task 1

SELECT employee_id, first_name, last_name, departments.department_name FROM employees 
INNER JOIN departments
ON employees.department_id = departments.department_id
WHERE employees.department_id IN (SELECT department_id FROM departments)  
ORDER BY employees.employee_id; 

-- Task 2

SELECT first_name, last_name, salary FROM employees
WHERE salary > (SELECT avg(salary) FROM employees)
AND employees.department_id IN (SELECT employees.department_id FROM employees)
ORDER BY department_id;

-- Task 3

SELECT first_name, last_name FROM employees
WHERE employees.department_id IN 
( SELECT departments.department_id FROM departments 
WHERE departments.department_name LIKE 'Sales%') 
AND employees.salary < ( SELECT avg(salary) FROM employees
WHERE department_id IN ( SELECT departments.department_id FROM departments WHERE departments.department_name LIKE 'Sales%'))
ORDER BY employees.first_name, employees.last_name;

-- Task 4

SELECT first_name, last_name, salary FROM employees
WHERE salary > ( SELECT MAX(salary) FROM employees WHERE job_id = 'IT_PROG')
ORDER BY salary ASC;

-- Task 5 

SELECT job_id, MIN(salary) AS Min_salary, group_concat(concat(first_name, ' ', last_name) ORDER BY salary ASC)  AS Emp_record 
FROM employees
GROUP BY job_id ORDER BY Min_salary ASC;

-- Task 6

SELECT first_name, last_name, department_id FROM employees e
WHERE salary > 0.6* ( SELECT SUM(salary) FROM employees WHERE department_id = e.department_id)
ORDER BY department_id, salary DESC;

-- Task 7

SELECT first_name, last_name FROM employees
WHERE manager_id IN (SELECT manager_id FROM departments WHERE location_id IN 
(SELECT location_id FROM locations WHERE country_id = 'UK'));

-- Task 8

SELECT first_name, last_name, salary FROM employees 
WHERE salary IN ( SELECT salary FROM employees) ORDER BY salary DESC LIMIT 5;
-- Exported the output table as csv file from the Result Grid




