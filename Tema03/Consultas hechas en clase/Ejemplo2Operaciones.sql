--Maneras de hacer un descuento.

SELECT *, precio + precio*(21.0/100) AS "con iva"
FROM vuelos;

SELECT precio, descuento,
	ROUND(precio-(precio*(descuento/100)),2)
FROM vuelos;

--Consulta que devuelve la media de una columna.
SELECT ROUND(avg(precio),2) AS "media_precio"
FROM vuelos;

--Consulta que permite ordenar de manerta aleatoria
SELECT *
FROM vuelos
ORDER BY random();