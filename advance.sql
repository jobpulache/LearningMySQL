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
