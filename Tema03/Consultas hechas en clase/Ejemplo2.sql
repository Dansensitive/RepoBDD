/*
En esta consulta se saca el porcentaje de mujeres 
total poniendole un alias y ademas redondeando 
decimales mediante el operador ROUND
*/
SELECT *,
	(hombres + mujeres) AS "total",
	ROUND((mujeres::numeric
	/ (hombres+mujeres))*100,2) AS "%_m",
	ROUND((hombres::numeric
	/ (hombres+mujeres))*100,2) AS "%_h"
FROM demografia_basica;

