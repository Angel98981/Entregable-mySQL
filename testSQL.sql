SHOW DATABASES;

CREATE TABLE estudiantes(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombres VARCHAR(45),
    apellidos VARCHAR(45),
    correo VARCHAR(150),
    fecha_nacimiento DATE
);

CREATE TABLE empresas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45),
    nit VARCHAR(45),
    telefono VARCHAR(20),
    direccion VARCHAR(45)
);

CREATE TABLE vehiculos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    placa VARCHAR(45),
    modelo VARCHAR(30),
    marca VARCHAR(45),
    color VARCHAR(45),
    tipo_vehiculo VARCHAR(45)
);

CREATE TABLE paises(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45),
    poblacion VARCHAR(150)
);
CREATE TABLE ciudades(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45),
    poblacion VARCHAR(150)
);

CREATE TABLE usuarios(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombres VARCHAR(45),
    apellidos VARCHAR(45),
    correo VARCHAR(45),
    contraseña VARCHAR(45),
    edad VARCHAR(45),
    genero VARCHAR(45),
    altura VARCHAR(45),
    peso VARCHAR(45)
);

DROP TABLE estudiantes;

SELECT * FROM estudiantes;
SELECT * FROM empresas;
SELECT * FROM vehiculos;
SELECT * FROM paises;
SELECT * FROM ciudades;
SELECT * FROM usuarios;

-- listado de todos los usuarios con solo los nombres, apellidos, edad que tengan 20 años
SELECT nombres,apellidos,edad FROM users WHERE edad = 20;

-- listado de mujeres que tengan entre 20 y 30 años.

SELECT nombres,apellidos,edad,genero FROM users WHERE genero="M" AND edad BETWEEN 20 AND 30;

-- quien es la persona con menos edad de la base de datos
SELECT * FROM users ORDER BY edad ASC LIMIT 1;

-- cuantos usuarios hay registrados en la base de datos
SELECT COUNT(*) FROM users;

-- traer los primeros 5 usuarios de la base de datos (tarje las primeras 5 mujeres)
SELECT * FROM users WHERE genero="M" LIMIT 5;

-- traer los ultimos 10 usuarios de la base de datos
SELECT * FROM users ORDER BY id DESC LIMIT 10;
-- listar usuarios que si correo termine en .net ("%.net" regresa lo que termine en .net) ("a%" regresa lo que empiece por a)
SELECT nombres,apellidos,edad,correo FROM users WHERE correo LIKE "%.net"

-- listar usuarios que no vivan en colombia

SELECT nombres,apellidos,edad,pais FROM users WHERE pais != "colombia"

-- listar usuarios que no vivan en ecuador y panama

SELECT nombres,apellidos,edad,pais FROM users WHERE pais != "ecuador" AND pais !="panama"

-- cuantos (numero) usuarios son de colombia y les gusta el rock

SELECT COUNT(*) FROM users WHERE pais="colombia" AND musica = "rock";

-- actualizar el genero musical de todos los usuarios de la base de datos de "metal" a "carranga"

SELECT COUNT(*) FROM users WHERE musica="carranga";

SELECT COUNT(*) FROM users WHERE musica="metal";

UPDATE users set musica = "carranga" WHERE musica="metal";
/* Listado de hombres que les guste la"carranga" sean de colombia y tengan entre 10 y 20 años de edad */

SELECT * FROM users WHERE genero="H" AND musica="carranga" AND pais="colombia" AND edad BETWEEN 10 AND 20;

/* Actualizar todos los usuarios que tengan 99 años, su neuvo genero muscial favorito sera la "carranga" */

UPDATE users set musica = "carranga" WHERE edad=99;

SELECT * FROM users WHERE edad=99

/* Listas todos los usuarios que su nombre inicia con "a", "A" */

SELECT * FROM users WHERE UPPER(nombres) LIKE "A%"

/* Listas todos los usuarios que su nombre inicia con "z", "Z" */

SELECT * FROM users WHERE nombres LIKE "z%"

/* Actualizar los usuarios que tengan 50 años de edad su nuevo genero musical sera NULL */

ALTER TABLE users MODIFY musica VARCHAR(255) NULL;

UPDATE users set musica = NULL WHERE edad=50;
-- listar todos los usuarios que su genero musical sea igual a null

SELECT * FROM users WHERE musica is NULL

-- cual es el resultado de la suma de todas la edades de la base de datos

SELECT sum(edad) FROM users;

-- cuantos usuarios tenemos registrados de "ecuador"

SELECT COUNT(*) FROM users WHERE pais="ecuador";

-- cuantos usuarios son de colombia y les gusta el vallenato

SELECT COUNT(*) FROM users WHERE pais="colombia" AND musica="vallenato";

INSERT INTO estudiantes (nombres,apellidos,correo,fecha_nacimiento)VALUES("test","test","test@gmail.com","2024-02-26")

INSERT INTO empresas (nombre,nit,telefono,direccion)VALUES("riwi","000000000","riwi@riwi.io","de_Moda_Oulet")

INSERT INTO vehiculos (placa,modelo,marca,color,tipo_vehiculo)VALUES("asd123","2024","mazda","gris","camioneta")

INSERT INTO paises (nombre,poblacion)VALUES("colombia","1")

INSERT INTO ciudades (nombre,poblacion)VALUES("medellin","1")

INSERT INTO usuarios (nombres,apellidos,correo,contraseña,edad,genero,altura,peso)VALUES("angel","rivera","angel@riwi.io","1234","25","M","180 cm","82 kg")