--Ejercicio 01
SELECT first_name, last_name, email
FROM employees e
	JOIN departments USING (department_id)
	JOIN locations USING (location_id)
	JOIN countries USING (country_id)
WHERE country_name = 'United Kingdom';

--Ejercicio 02
SELECT DISTINCT department_name
FROM departments JOIN employees
        USING (department_id)
WHERE hire_date::text LIKE '1993%';

--Ejercicio 03
SELECT DISTINCT regions.*
FROM employees JOIN departments
        USING (department_id)
        JOIN locations USING (location_id)
        JOIN countries USING (country_id)
        JOIN regions USING (region_id)
WHERE salary < 10000;

--Ejercicio 04
SELECT emple.first_name, emple.last_name
FROM employees emple
	JOIN employees jefe ON(emple.manager_id=jefe.employee_id)
WHERE UPPER (LEFT(jefe.last_name,1))
	IN ('D','H','S');
/*
WHERE e2.last_name ILIKE 'd%'
	OR e2.last_name ILIKE 'h%'
	OR e2.last_name ILIKE 's%';
*/
--Ejercicio 05
SELECT COUNT(*)
FROM dependents
	JOIN employees USING (employee_id)
	JOIN departments USING (department_id)
WHERE department_name IN ('Marketing', 'Administration', 'IT')
	AND relationship = 'Child';