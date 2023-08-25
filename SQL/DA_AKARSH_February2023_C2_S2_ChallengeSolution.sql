-- Task 1 Find the count of all the employees in the organization 
USE hr;

SELECT count(employee_id) as 'Count of all Employees' FROM employees;

-- Task 2 Find department-ID wise count of employees

SELECT department_id, count(department_id) as 'Dept-wise Count of employees' FROM employees GROUP BY department_id;

-- Task 3 Find firstname lastname and salaries of employees whose salary is greater than $6000

SELECT first_name, last_name, salary FROM employees WHERE salary > 6000 ORDER BY salary ASC;

-- Task 4 Determine count of employees who are earning salary greater than $20,000

SELECT Count(employee_id) as 'Count of Employees', salary, employee_id FROM employees GROUP BY employee_id HAVING salary > 20000;

-- Task 5 List the employees who get a commission

SELECT * FROM employees WHERE commission_pct > 0;

-- Task 6  Extract the names of employees

SELECT concat(first_name, ' ', last_name) as 'Names of Employees' FROM employees;

-- Task 7 Fetch details of employees who get commission

SELECT employee_id as 'Employee ID', concat(first_name, ' ', last_name) AS 'Employee Full Name', email as 'Email ID', phone_number as 'Phone Number' FROM employees WHERE commission_pct IS NOT NULL;

-- Task 8 Identify Top 3 department IDs that have highest total salary of employees

SELECT department_id, salary FROM employees ORDER BY salary DESC LIMIT 3;

-- Task 9 List all the details of employees from IT department

SELECT department_id FROM departments WHERE department_name = 'IT';
SELECT * FROM employees WHERE department_id = '60';

-- Task 10 Find the count of all the employees in IT dept and their average salary

SELECT department_id FROM departments WHERE department_name = 'IT';
SELECT count(employee_id) as 'Count of Employees', avg(salary) as 'Average salary', department_id FROM employees GROUP BY department_id HAVING department_id = '60';

-- Task 11 Identify Dept IDs and Number of employees where emp salary ranges from 7000 to 10000

SELECT department_id AS 'Department ID', count(employee_id) AS 'Number of Employees' FROM employees WHERE salary BETWEEN '7000' and '10000' GROUP BY department_id;



