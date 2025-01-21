--Ejercicio 1
SELECT hombres, provincia, anio
FROM demografia_basica
WHERE provincia IN('Badajoz', 'Cáceres')
	AND anio IN(2002, 2003);

--Ejercicio 2
SELECT *
FROM demografia_basica
WHERE hombres+mujeres >= 600000
ORDER BY hombres+mujeres DESC, provincia, anio;

--Ejercicio 3
SELECT *
FROM demografia_basica
WHERE hombres + mujeres>=600000 AND anio > 2014
ORDER BY hombres+mujeres DESC, provincia, anio;

--Ejercicio 4
SELECT *
FROM demografia_avanzada
WHERE anio = 2018
	AND provincia IN ('Jaén', 'Huelva','Málaga', 'Cádiz', 'Sevilla', 'Córdoba', 'Granada', 'Almería')
	AND sexo = 'M'
	AND rango_edad BETWEEN 'De 20 a 24 años'
	AND 'De 25 a 29 años'
ORDER BY numero_habitantes ASC;

--Ejercicio 5
SELECT *
FROM demografia_avanzada
WHERE sexo='H' AND anio BETWEEN 2010 AND 2015 
	AND provincia='Madrid' 
	AND (edad_menor < 20 
	OR edad_menor > 65)
ORDER BY anio ASC, numero_habitantes DESC, rango_edad ASC;
