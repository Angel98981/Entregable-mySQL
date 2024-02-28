-- primero creo la conexion local con el XAMPP
-- luego creo la base de datos
CREATE DATABASE angel_vehiculos

-- con esto veo que bases de datos tengo 
SHOW DATABASES

-- con esto uso la base de datos que cree en este caso angel_vehiculos
USE angel_vehiculos

-- creacion de las tablas que me pedia el ejecicio
CREATE TABLE marcas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    marca VARCHAR(45)
);

CREATE TABLE tipo_vehiculo(
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_vehiculo VARCHAR(45),
    marcas_id INT
);

CREATE TABLE colores(
    id INT PRIMARY KEY AUTO_INCREMENT,
    color VARCHAR(45)
);

CREATE TABLE vehiculos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR(45),
    tipo_vehiculo VARCHAR(45),
    placa VARCHAR(45),
    colores_id INT,
    tipo_vehiculo_id INT    
);

-- aqui creo las llaves foraneas que me relacionan luego las tablas
ALTER TABLE vehiculos 
ADD FOREIGN KEY (colores_id) 
REFERENCES colores(id)

ALTER TABLE vehiculos 
ADD FOREIGN KEY (tipo_vehiculo_id) 
REFERENCES tipo_vehiculo(id)

ALTER TABLE tipo_vehiculo 
ADD FOREIGN KEY (marcas_id) 
REFERENCES marcas(id);

-- lleno las tablas que ya cree
INSERT INTO marcas (marca) VALUES 
("mazda"),("audi");

INSERT INTO colores (color) VALUES 
("rojo"),("negro");

INSERT INTO tipo_vehiculo (tipo_vehiculo, marcas_id) VALUES 
("automovil", 1),("camioneta", 2);

INSERT INTO vehiculos (modelo,placa,colores_id,tipo_vehiculo_id) VALUES 
("2024","asd321",1,3),
("2023","asd432",2,3),
("2024","asd234",1,4),
("2023","asd543",2,4),
("2022","asd345",1,3),
("2021","asd654",2,3),
("2022","asd456",2,4),
("2024","asd756",1,3),
("2023","asd567",2,4);

-- aqui elimine una columna que no era necesaria para el ejecicio
ALTER TABLE vehiculos 
DROP COLUMN tipo_vehiculo;

-- selectores para ver los datos
-- los colores de todos los vehiculos
SELECT * 
FROM vehiculos 
INNER JOIN colores 
WHERE vehiculos.colores_id=colores.id;

-- los modelos placas y colores de todos los vehiculos
SELECT modelo,placa,colores.color 
FROM vehiculos 
INNER JOIN colores 
WHERE vehiculos.colores_id=colores.id;

-- el modelo la placa la marca el color y el tipo de vehiculo de todos los vehiculos
SELECT vehiculos.modelo,vehiculos.placa,marcas.marca,colores.color,tipo_vehiculo.tipo_vehiculo 
FROM vehiculos 
INNER JOIN colores,marcas,tipo_vehiculo 
WHERE vehiculos.colores_id=colores.id 
AND tipo_vehiculo.marcas_id=marcas.id 
AND vehiculos.tipo_vehiculo_id=tipo_vehiculo.id