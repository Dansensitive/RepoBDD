--Concat une dos columnas para mostrarlas en una.
SELECT *, concat(last_name, ', ',first_name)
FROM employees;

--Igual que concat pero con separador.
SELECT *, concat_ws(', ', last_name, first_name)
FROM employees;

--Initcap lower muestra todo en minúscula y upper en mayúscula
SELECT initcap('En un lugar de LA MANCHA'),
	lower('En un lugar de LA MANCHA'),
	upper('En un lugar de LA MANCHA');

