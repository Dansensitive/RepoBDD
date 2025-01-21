--Ejercicio 01
SELECT ROUND(AVG(temperatura_media),2)
FROM climatologia
WHERE provincia IN ('Huelva', 'Málaga','Sevilla', 'Cádiz', 'Jaén', 'Córdoba', 'Granada', 'Almería')
	AND LEFT(estacion,2) = 'Al'
	AND fecha BETWEEN '2019-05-01'::date
		AND '2019-05-31'::date;
		
--Ejercicio 02
SELECT fecha, estacion, temperatura_media, precipitacion_total,
	CASE
		WHEN precipitacion_total >= 50 THEN 'CHUZOS DE PUNTA'
		WHEN 40 <= precipitacion_total 
			AND precipitacion_total < 50 THEN 'A CÁNTAROS'
		WHEN 25 <= precipitacion_total
			AND precipitacion_total < 40 THEN 'MUCHA LLUVIA'
		WHEN 10 <= precipitacion_total
			AND precipitacion_total < 25 THEN 'FALTA LE HACÍA AL CAMPO'
		WHEN precipitacion_total < 10 THEN 'HA LLOVIDO POCO'
		WHEN precipitacion_total = 0
			OR precipitacion_total IS NULL THEN 'NO HA LLOVIDO'
	END AS "Ocurrencias del Luismi"
FROM climatologia
ORDER BY fecha, estacion;

--Ejercicio 03
SELECT 
	UPPER(fecha::text) AS fecha,
	UPPER(estacion) AS estacion,
	UPPER(provincia) AS provincia,
	UPPER(temperatura_maxima::text) AS temperatura_maxima,
	UPPER(hora_temperatura_maxima::text) AS hora_temperatura_maxima,
	UPPER(temperatura_minima::text) AS temperatura_minima,
	UPPER(hora_temperatura_minima::text) AS hora_temperatura_minima,
	UPPER(temperatura_media::text) AS temperatura_media,
	UPPER(racha_viento::text) AS racha_viento,
	UPPER(hora_racha_viento::text) AS hora_racha_viento,
	UPPER(velocidad_maxima_viento::text) AS velocidad_maxima_viento,
	UPPER(hora_velocidad_maxima_viento::text) AS hora_velocidad_maxima_viento,
	UPPER(precipitacion_total::text) AS precipitacion_total,
	UPPER(precipitacion_0_a_6::text) AS precipitacion_0_a_6,
	UPPER(precipitacion_6_a_12::text) AS precipitacion_6_a_12,
	UPPER(precipitacion_12_a_18::text) AS precipitacion_12_a_18,
	UPPER(precipitacion_18_a_24::text) AS precipitacion_18_a_24
FROM climatologia
WHERE  hora_temperatura_maxima < SUBSTR('14:00',1 ,2);




