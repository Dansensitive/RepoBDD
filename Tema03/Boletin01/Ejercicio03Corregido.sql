--Ejercicio 1
SELECT *
FROM employees
WHERE department_id > 8 AND department_id < 12;

--Ejercicio 2
SELECT *
FROM countries
WHERE country_name ILIKE '_a%';

--Ejercicio 3
SELECT first_name, last_name, salary
FROM employees
WHERE salary*14 >= 100000 AND 
	job_id != 6;

--Ejercicio 4
SELECT *
FROM departments
WHERE department_name ILIKE '%t%t%';

--Ejercicio 5
SELECT *
FROM locations
WHERE city IN ('Toronto', 'Oxford') 
OR state_province LIKE 'California';
