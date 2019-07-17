SELECT * FROM department;
SELECT * FROM employee;
SELECT * FROM manager;
SELECT * FROM personal_info;
SELECT * FROM salary;
SELECT * FROM title;


-- all employees' ids, last names, first names, genders, and salaries

SELECT
	personal_info.id,
	personal_info.last_name,
	personal_info.first_name,
	personal_info.gender,
	salary.salary 
FROM personal_info
JOIN salary
	ON personal_info.id = salary.salary_id;
	
-- employees who were hired in 1986
WITH find_1986 AS (
	SELECT
		id,
   		last_name,
   		first_name,
   		EXTRACT (YEAR FROM hire_date) AS YEAR
	FROM personal_info)
SELECT * FROM find_1986 WHERE YEAR = 1986;


/* all managers' department numbers, department names, employee numbers,
last and first names, and start and end employment dates*/
SELECT 
	department.id,
	department.name,
	manager.man_id,
	personal_info.last_name,
	personal_info.first_name,
	manager.from_date,
	manager.to_date
FROM department
JOIN manager
	ON department.id = manager.man_dept
JOIN personal_info
	ON manager.man_id = personal_info.id;


-- all employee numbers, last and first names, and department names
SELECT
	personal_info.id,
	personal_info.last_name,
	personal_info.first_name,
	department.name
FROM personal_info
JOIN employee
	ON personal_info.id = employee.emp_id
JOIN department
	ON employee.emp_dept = department.id	
UNION
SELECT
	personal_info.id,
	personal_info.last_name,
	personal_info.first_name,
	department.name
FROM personal_info
JOIN manager
	ON personal_info.id = manager.man_id
JOIN department
	ON manager.man_dept = department.id;


-- all employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name
FROM personal_info
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


-- all employee numbers, last and first names, and department name in the Sales departments

SELECT
	personal_info.id,
	personal_info.last_name,
	personal_info.first_name,
	department.name
FROM personal_info
JOIN employee
	ON personal_info.id = employee.emp_id
JOIN department
	ON employee.emp_dept = department.id
WHERE department.name = 'Sales'
UNION
SELECT
	personal_info.id,
	personal_info.last_name,
	personal_info.first_name,
	department.name
FROM personal_info
JOIN manager
	ON personal_info.id = manager.man_id
JOIN department
	ON manager.man_dept = department.id
WHERE department.name = 'Sales';


/*all employee numbers, last and first names, and department name
in the Sales or Development departments*/

SELECT
	personal_info.id,
	personal_info.last_name,
	personal_info.first_name,
	department.name
FROM personal_info
JOIN employee
	ON personal_info.id = employee.emp_id
JOIN department
	ON employee.emp_dept = department.id
WHERE department.name = 'Sales' OR department.name = 'Development'
UNION
SELECT
	personal_info.id,
	personal_info.last_name,
	personal_info.first_name,
	department.name
FROM personal_info
JOIN manager
	ON personal_info.id = manager.man_id
JOIN department
	ON manager.man_dept = department.id
WHERE department.name = 'Sales' OR department.name = 'Development';


-- the frequency count of employee last names in descending order

SELECT last_name, COUNT(*)
FROM personal_info
GROUP BY last_name
ORDER BY last_name DESC;
