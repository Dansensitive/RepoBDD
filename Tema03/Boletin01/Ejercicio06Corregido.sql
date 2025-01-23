/*
1. Selecciona la media de la temperatura media
de todas las estaciones meteorológicas de
Andalucía que comiencen por AL para el
mes de mayo de 2019.
Ojo, no se puede utilizar LIKE ni ILIKE.
*/
SELECT AVG(temperatura_media)
FROM climatologia
WHERE LEFT(fecha::text,7) = '2019-05'
  AND provincia IN ('Jaén', 'Córdoba', 'Sevilla',
                      'Huelva', 'Cádiz', 'Málaga',
                    'Granada', 'Almería')
  AND STARTS_WITH(LOWER(estacion),'al');

/*
2. Selecciona los datos meteorológicos de la
provincia de Jaén para el mes de
Noviembre de 2019. Debe aparecer la fecha,
estación, temperatura_media y la
precipitacion_total.
La precipitación total no debe aparecer
como un número, sino que debe aparecer como un
texto, con las siguientes equivalencias

>= 50 litros: CHUZOS DE PUNTA
40 <= precipitacion < 50: A CÁNTAROS
25 <= precipitacion < 40: MUCHA LLUVIA
10 <= precipitacion < 25: FALTA LE HACÍA AL CAMPO
< 10: HA LLOVIDO POCO
0 o null: NO HA LLOVIDO

Ordena la salida por fecha ascendente y
estación ascendente.
*/
SELECT fecha, estacion, temperatura_media,
        precipitacion_total,
    CASE
        WHEN precipitacion_total >= 50 THEN 'Chuzos de punta'
        WHEN precipitacion_total >= 40 AND precipitacion_total < 50 THEN 'A cántaros'
        WHEN precipitacion_total >= 25 AND precipitacion_total < 40 THEN 'Mucha lluvia'
        WHEN precipitacion_total >= 10 AND precipitacion_total < 25 THEN 'Falta le hacía al campo'
        WHEN precipitacion_total > 0 AND precipitacion_total < 10 THEN 'Ha llovido poco'
        --WHEN precipitacion_total IS NULL or precipitacion_total = 0 THEN 'No ha llovido'
        ELSE 'No ha llovido'
    END AS "txt_precipitacion_total"
FROM climatologia
WHERE provincia = 'Jaén'
  AND fecha::text ILIKE '2019-11%'
ORDER BY fecha, estacion;


/*
3. Selecciona, mostrando todos los datos en
mayúsculas, aquellos datos de climatología
donde la hora de máxima temperatura
fueran las 14:00 para un día cualquiera de
Marzo de 2019 de Asturias o Cantabria
*/

SELECT fecha, UPPER(provincia),
        UPPER(estacion),
        temperatura_maxima, hora_temperatura_maxima,
        temperatura_minima, hora_temperatura_minima,
        temperatura_media,
        racha_viento, hora_racha_viento,
        velocidad_maxima_viento,
        hora_velocidad_maxima_viento,
        precipitacion_total,
        precipitacion_0_a_6,
        precipitacion_6_a_12,
        precipitacion_12_a_18,
        precipitacion_18_a_24
FROM climatologia
WHERE provincia IN ('Asturias', 'Cantabria')
  AND fecha::text ILIKE '2019-03%'
  AND hora_temperatura_maxima = '14:00';