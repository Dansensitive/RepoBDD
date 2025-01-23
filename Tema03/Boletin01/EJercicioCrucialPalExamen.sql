/*Ejercicio 1*/
SELECT COUNT(salida)
FROM vuelos
WHERE desde = 'Berlín'
	AND hasta = 'Londres'
	AND llegada BETWEEN '2020-10-01'::date
		AND '2020-12-31'::date;

/*
SOLUCIÓN MIGUEL

SELECT COUNT(*)
FROM vuelos
WHERE desde = 'Berlín'
	AND hasta='Londres'
	AND SUBSTR(llegada::text,6,2) IN ('10','11', '12');
*/

/*Ejercicio 02*/
SELECT *, ROUND(precio-(precio*(COALESCE(descuento,0)/100)),2) AS precio_final
FROM vuelos

/*Ejercicio 03*/
SELECT *
FROM vuelos
WHERE descuento IS NULL
	AND llegada::text ILIKE '%-10-%'
	AND SUBSTR(llegada::text,9, 2)::numeric <=15
	AND hasta ='Nueva York';
	
/*Solución luismi*/
SELECT *
FROM vuelos
WHERE hasta = 'Nueva York'
	AND descuento IS NULL
	AND llegada::text ILIKE '%-10-%'
	AND RIGHT(LEFT(llegada::text,10),2)::integer <= 15;
