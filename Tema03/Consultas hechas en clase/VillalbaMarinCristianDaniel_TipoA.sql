/*Ejercicio 1*/
SELECT estacion, ROUND(AVG(precipitacion_total),2) AS "precipitacion_total_media"
FROM climatologia
WHERE LEFT((fecha::text),7) = '2019-06'
	AND provincia IN ('Huesca','Zaragoza','Teruel')
GROUP BY estacion;

/*Ejercicio 2*/
SELECT SUM(precipitacion_0_a_6), SUM(precipitacion_6_a_12), SUM(precipitacion_12_a_18), SUM(precipitacion_18_a_24)
FROM climatologia
WHERE estacion ILIKE '%f%'
	OR estacion ILIKE '%t%'
	OR estacion ILIKE '%x%'
	AND fecha::date BETWEEN '2019-02-01' AND '2019-02-28';
	
/*Ejercicio 3*/
SELECT estacion
FROM climatologia
WHERE LEFT ((estacion::text),2)= 'Ba' 
	AND temperatura_maxima BETWEEN 25 AND 30
	AND temperatura_minima < 15
	AND LEFT((fecha::text),7)= '2019-09'
	OR LEFT((fecha::text),7)= '2019-10';
	
/*Ejercicio 4*/
SELECT estacion, provincia, fecha, racha_viento,
	CASE 
		WHEN racha_viento > 25 AND racha_viento<= 40 THEN 'Ventoso'
		WHEN racha_viento > 40 AND racha_viento<=60 THEN 'Muy ventoso'
		WHEN racha_viento > 60 THEN 'Huracanado'
		ELSE 'Poca cosa'
	END AS mensaje_viento
FROM climatologia
WHERE racha_viento > 25
	AND hora_racha_viento = '15:00'
	AND LEFT((fecha::text),7)='2019-03'
	OR LEFT((fecha::text),7)='2019-04'
	AND temperatura_maxima > 23
ORDER BY racha_viento DESC

/*No me da tiempo a terminar el 5*/