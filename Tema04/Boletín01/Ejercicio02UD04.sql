--Ejercicio 01
SELECT first_name, last_name
FROM employees e LEFT JOIN departments d USING (department_id)
WHERE department_name IN ('Finance','IT')
	AND SUBSTR(hire_date::text,6,2)::int IN (4,6);

--Ejercicio 02
SELECT e.first_name AS Manager_FirstName, e.last_name AS Manager_LastName
FROM employees e
	JOIN employees m ON e.manager_id = m.employee_id
	JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Administration';

--Ejercicio 03
SELECT country_name
FROM countries
	JOIN locations USING (country_id)
	JOIN departments USING (location_id)
WHERE department_name = 'Public Relations';

--Ejercicio 04

SELECT *
FROM employees 
	JOIN departments USING (department_id)
	JOIN locations USING (location_id)
	JOIN countries USING (country_id)
	JOIN regions USING (region_id)
WHERE region_name = 'Americas';
/*
SELECT *
FROM employees e
	JOIN employees f ON e.department_id=f.employee_id
	JOIN departments d ON e.department_id=d.department_id
	JOIN locations l ON d.location_id=l.location_id
	JOIN countries c ON l.country_id=c.country_id
	JOIN regions r ON c.region_id=r.region_id
WHERE region_name = 'Americas';
*/

--Ejercicio 05
SELECT d.first_name, d.last_name, e.first_name, d.last_name
FROM dependents d 
	JOIN employees e ON d.employee_id=e.employee_id
	JOIN departments f ON e.department_id=f.department_id
	JOIN locations l ON f.location_id=l.location_id
	JOIN countries c ON l.country_id=c.country_id
	JOIN regions r ON c.region_id=r.region_id
WHERE region_name='Americas';
