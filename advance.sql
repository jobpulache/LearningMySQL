USE appsalon;
#This is function Add
SELECT COUNT(id), fecha 
FROM reservaciones
GROUP BY fecha 
ORDER BY COUNT(id) DESC;

#SET THE SUM OF PRICE FOR SERVICES
SELECT SUM(precio)  AS PRICETOTAL  FROM servicios; 

#SET MAX PRICE 
SELECT MAX(precio) FROM servicios;

#SET MIN PRICE
SELECT MIN(precio) FROM servicios;

#SEARCH  Lo que estamos buscando inicia con la palabra corte.(Inicia con?
SELECT * FROM servicios WHERE nombre LIKE 'Corte%'; 
#SEARCH (finaliza con)
SELECT * FROM servicios WHERE nombre LIKE '%Corte';
#SEARCH (Inicia o finaliza con)
SELECT * FROM servicios WHERE nombre LIKE '%Corte%';
SELECT * FROM servicios WHERE nombre LIKE '%Cabello%';
SELECT * FROM servicios WHERE nombre LIKE '%Lavado%';

#CONCAT
SELECT CONCAT(nombre,  " ", apellido) AS nameComplete FROM reservaciones;
#CONCAT AND LIKE
SELECT * FROM reservaciones WHERE CONCAT(nombre, " ", apellido) LIKE '%Ana Preciado%';
#More info.
SELECT hora, fecha, CONCAT(nombre, " ", apellido) AS NameComplete FROM reservaciones 
WHERE CONCAT(nombre, " ", apellido) LIKE '%Ana Preciado%';
#REVIEW MULTIPLES CONDITION
SELECT * FROM reservaciones WHERE id IN(2,4);
SELECT * FROM reservaciones WHERE id = (3 AND 9);
#SET result FOR DATE
SELECT * FROM reservaciones WHERE fecha = "2021-06-28" AND id=1;
SELECT * FROM reservaciones WHERE fecha = "2021-06-28" AND id=1 AND nombre = "Juan";

#ADD normalization
USE Appsalon;
DROP TABLE reservaciones;



