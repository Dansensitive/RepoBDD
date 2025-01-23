--Ejercicio 01
SELECT ROUND(AVG(precipitacion_total), 2) AS precipitacion_media
FROM climatologia
WHERE provincia = 'Sevilla' 
	AND fecha >= '2019-04-01'
	AND fecha < '2019-05-01';

--Ejercicio 02
SELECT *
FROM climatologia
WHERE estacion LIKE '%e%'
		AND (fecha = '2019-02-28'
		OR fecha = '2019-03-31'
		OR fecha = '2019-04-30')
ORDER BY provincia ASC, estacion ASC, fecha DESC;

--Ejercicio 03
SELECT SUM(precipitacion_total)
FROM climatologia
WHERE provincia IN ('A Coruña','Lugo','Orense','Pontevedra')
		AND fecha >= '2019-09-01'
		AND fecha < '2019-10-01';

--Ejercicio 04
SELECT fecha, estacion, provincia,
    precipitacion_total,
    CASE
        WHEN precipitacion_total = 0 THEN 0
        --WHEN precipitacion_total IS NULL THEN 'Sin datos'
        ELSE precipitacion_0_a_6 / precipitacion_total
    END AS "% 0 A 6",
    CASE
        WHEN precipitacion_total = 0 THEN 0
        ELSE ROUND((precipitacion_6_a_12 / precipitacion_total)*100,2)
    END AS "% 6 a 12",
    CASE
        WHEN precipitacion_total = 0 THEN 0
        ELSE precipitacion_12_a_18 / precipitacion_total
    END AS "% 12 a 18",
        CASE
        WHEN precipitacion_total = 0 THEN 0
        ELSE precipitacion_18_a_24 / precipitacion_total
    END AS "% 18 a 24"
FROM climatologia
WHERE provincia IN ('Toledo', 'Guadalajara',
                   'Cuenca', 'Albacete',
                   'Ciudad Real')
  AND ((fecha::text LIKE '2019-03%'
          AND RIGHT(fecha::text,2)::integer >= 21)
   --OR (fecha::text LIKE '2019-04%')          
   --OR (fecha::text LIKE '2019-05%')
   OR SUBSTR(fecha::text,7,1) IN ('4','5')
   OR (fecha::text LIKE '2019-06%'
          AND RIGHT(fecha::text,2)::integer < 21))
ORDER BY fecha ASC;

--Ejercicio 05
SELECT *
FROM climatologia
WHERE precipitacion_total > 50 
		AND (precipitacion_6_a_12 / precipitacion_total)*100 BETWEEN 60 
		AND 80
ORDER BY precipitacion_total DESC, fecha ASC;