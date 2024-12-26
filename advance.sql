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