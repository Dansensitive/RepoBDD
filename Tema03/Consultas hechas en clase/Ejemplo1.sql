SELECT *
FROM climatologia;

SELECT fecha, estacion, temperatura_media
FROM climatologia;
--WHERE 

--Ejercicio 1, PONER ALIAS A LAS COLUMNAS QUE NOS DEVUELVE LA CONSULTA.
SELECT temperatura_media AS "Temperatura media",
	estacion AS "Población",
	fecha
FROM climatologia;

--DISTINCT PARA QUE NO DEVUELVA DOS FILAS IGUALES, NO SE PUEDE HACER CON UNA SOLA COLUMNA.
SELECT DISTINCT fecha, provincia
FROM climatologia;

--ORDENACIÓN MEDIANTE ORDER BY Y ASCENDENTE EN ESTE CASO, DESC PARA LO CONTRARIO Y SE PUEDE PONER MAS DE UN ORDEN.
SELECT fecha, provincia, estacion
FROM climatologia
ORDER BY fecha ASC, estacion DESC;

--CONDICIONES CON WHERE PARA FILTRAR CONSULTAS, EN ESTE CASO TEMPERATURA_MEDIA
SELECT *
FROM climatologia
WHERE temperatura_media > 30;

--EJEMPLOS DE CLASE CON CONDICIONES WHERE.
SELECT DISTINCT fecha
FROM climatologia
WHERE temperatura_media > 30;

--A la hora de comparar con LIKE o ILIKE podemos usar _ para indicar que ese caracter se rellene con lo que sea.
-- Con el operador % como 'Sevilla%' indica que queremos que nos devuelva algo que contenga Sevilla y luego lo que sea.
SELECT *
FROM climatologia
WHERE provincia LIKE 'Sevilla';

SELECT 1::numeric/2;

/*Esta consulta cambia el tipo de dato para filtrar
por el criterio que queramos. 
*/
SELECT fecha, fecha::text
FROM climatologia
WHERE fecha::text LIKE '%-04-%'
	AND provincia = 'Sevilla'
LIMIT 10;






