USE hr;
-- Task 1 

SELECT employees.employee_id, employees.first_name, employees.last_name, departments.department_name FROM employees JOIN departments
ON employees.department_id = departments.department_id WHERE department_name = 'IT';

-- Task 2

SELECT min(salary), max(salary), department_name FROM employees JOIN departments ON employees.department_id = departments.department_id GROUP BY department_name;

-- Task 3

SELECT locations.city, count(employee_id) as Emp_count FROM employees
 JOIN departments 
 JOIN locations 
 ON departments.department_id = employees.department_id   
 AND departments.location_id = locations.location_id 
 GROUP BY locations.city ORDER BY Emp_count DESC LIMIT 10;
 
 -- Task 4
 
 SELECT employees.employee_id, first_name, last_name, end_date as 'last working day' FROM employees 
 JOIN job_history 
 ON employees.employee_id = job_history.employee_id WHERE end_date = '1999-12-31';
 
 -- Task 5
 
 SELECT employee_id, first_name, department_name, YEAR(curdate()) - YEAR(hire_date) AS Exp FROM employees
 JOIN departments
 ON employees.department_id = departments.department_id
 WHERE YEAR(curdate()) - YEAR(hire_date) > 25;
 


