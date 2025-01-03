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
DROP TABLE clientes;

CREATE TABLE clientes( 
id INT NOT NULL AUTO_INCREMENT,
userName VARCHAR(20) NOT NULL,
lastName VARCHAR(20) NOT NULL,
phone VARCHAR(9) NOT NULL,
email VARCHAR(20) NOT NULL UNIQUE,
PRIMARY KEY(id)
);
INSERT INTO clientes (userName, lastName, phone, email) VALUES("job", "manu DL", 930938449, "job@gmail.com");
select * from clientes;
SHOW TABLES;
SELECT * FROM clientes;
#Creating table citas 
CREATE TABLE citas(
id 	INT NOT NULL AUTO_INCREMENT,
fecha DATE NOT NULL,
hora TIME NOT NULL,
clienteId INT NOT NULL,
PRIMARY KEY(id),
KEY clienteId(clienteId),
CONSTRAINT cliente_PK
FOREIGN KEY(clienteId)
REFERENCES clientes(id));

describe servicios;
INSERT INTO citas(fecha, hora, clienteId) VALUES('2025-03-29', '10:20:00', 1);
select * from citas;
drop table citas;
SELECT * FROM citas INNER JOIN clientes ON clientes.id = citas.clienteId;
INSERT INTO clientes(userName, lastName, phone, email) VALUES ("manuTwo", "Laid", 123456789, 
"manuJob@gmail.com"); 
SELECT * FROM citas RIGHT JOIN clientes ON clientes.id = citas.clienteId;

#CREATING TABLE PIVOTE
CREATE TABLE CitasServicios(
id INT NOT NULL AUTO_INCREMENT,
CitasId INT NOT NULL,
ServiciosId INT NOT NULL,
PRIMARY KEY(id), 
KEY CitasId(CitasId),
CONSTRAINT Citas_FK
FOREIGN KEY(CitasId)
REFERENCES citas(id),
KEY ServiciosId(ServiciosId),
CONSTRAINT Servicios_FK
FOREIGN KEY(ServiciosId)
REFERENCES servicios(id)
);
SELECT * FROM servicios;
INSERT INTO citas (fecha, hora, clienteId) VALUES("2023-10-20", "02:30:00", 1); 
INSERT INTO CitasServicios(CitasId, ServiciosId) VALUES(1,3);

#Set information in table pivote
SELECT * FROM CitasServicios 
LEFT JOIN citas ON citas.id = CitasServicios.CitasId
LEFT JOIN clientes ON citas.clienteId	 = clientes.id
LEFT JOIN servicios ON servicios.id = CitasServicios.ServiciosId;
INSERT INTO CitasServicios(	CitasId, ServiciosId) VALUES(2, 8);
select * from CitasServicios;
#Join two or more tablets
SELECT * FROM CitasServicios LEFT JOIN citas ON citas.id = CitasServicios.citasId
LEFT JOIN servicios ON servicios.id = CitasServicios.serviciosId;
Use appsalon;
#Multiples Join 
select * from citasServicios;
SELECT * FROM CitasServicios LEFT JOIN citas ON citas.id = CitasServicios.citasId
LEFT JOIN clientes ON citas.clienteId = clientes.id
LEFT JOIN servicios ON servicios.id = CitasServicios.serviciosId;
