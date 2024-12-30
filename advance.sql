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
INSERT INTO clientes(userName, lastName, phone, email) VALUES ("manu", "Laid", 123456789, 
"manu@gmail.com"); 
SELECT * FROM citas RIGHT JOIN clientes ON clientes.id = citas.clienteId;

#CREATING TABLE PIVOTE
CREATE TABLE citasServicios(
id INT NOT NULL AUTO_INCREMENT,
CitaId INT NOT NULL,
ServicioId INT NOT NULL,
PRIMARY KEY(id),
KEY CitaId(CitaId),
CONSTRAINT Cita_FK
FOREIGN KEY(CitaId)
REFERENCES citas(id),
Key ServicioId(ServicioId),
CONSTRAINT Servicio_FK
FOREIGN KEY(ServicioId)
REFERENCES servicios(id));

