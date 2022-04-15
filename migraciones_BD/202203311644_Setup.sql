--  1. Crear una base de datos con nombre “condominio”.

   CREATE DATABASE condominio;

-- Conectarse a una base de datos específica
   \c condominio;
   
-- Borrar tablas 
   DROP TABLE IF EXISTS  usuarios, propietarios, direcciones, visitas;

--  2. Crear una tabla “usuarios”, con los atributos rut, nombre, password

CREATE TABLE usuarios(
  rut         VARCHAR(10) NOT NULL,
  nombre      VARCHAR(25) NOT NULL,
  password    VARCHAR(16) NOT NULL,
  PRIMARY KEY (rut)
);

--  3. Crear una tabla “direcciones”, con los atributos direccion_id, direccion_nombre

CREATE TABLE direcciones(  
  id               SERIAL,
  rut_propietario  VARCHAR(10) NOT NULL,
  nombre           VARCHAR(40) UNIQUE,
  PRIMARY KEY (id),
  FOREIGN key (rut_propietario) REFERENCES propietarios(rut)
);

--  4. Crear una tabla “propietarios”, con los atributos:

CREATE TABLE propietarios (
  rut                    VARCHAR(10) NOT NULL,
  nombres                VARCHAR(30) NOT NULL,
  apellidos              VARCHAR(30) NOT NULL,
  sexo                   VARCHAR(1)  NOT NULL,
  email                  VARCHAR(50) NOT NULL,
  nro_celular_principal  VARCHAR(15) NOT NULL,
  nro_celular_secundario VARCHAR(15),
  es_propietario         BOOLEAN NOT NULL DEFAULT TRUE,
  direccion_id           INT NOT NULL,
  PRIMARY KEY (rut),
  FOREIGN KEY (direccion_id) REFERENCES direcciones(id)
);

--  5. Crear una tabla “visitas”, con los atributos:

CREATE TABLE visitas (
  rut                    VARCHAR(10) NOT NULL,
  fecha_visita           TIMESTAMP NOT NULL DEFAULT NOW(),
  direccion_id           INT NOT NULL,
  nombres                VARCHAR(20) NOT NULL,
  apellidos              VARCHAR(25) NOT NULL,
  sexo                   VARCHAR(1)  NOT NULL,
  opcion                 VARCHAR(1)  NOT NULL,
  nro_patente            VARCHAR(15),
  hora_de_salida         TIME,
  rut_usuario            VARCHAR(10) NOT NULL,
  PRIMARY KEY (rut, fecha_visita, direccion_id ),
  FOREIGN KEY (rut_usuario) REFERENCES usuarios(rut)
);

--  6. Insertar registro en la tabla de usuarios.-

   INSERT INTO usuarios (rut, nombre, password) VALUES ('123456785', 'Portero Turno # 1', '123');

--  7. Hacer COMMIT a la tabla usuarios.-
COMMIT;

--  8. Insertar registro en la tabla de propietarios.- 

INSERT INTO propietarios(rut, nombres, apellidos, sexo, email, nro_celular_principal, direccion_id)
VALUES ('111111111', 'Jose Patricio', 'Reyes Miranda', 'M', 'josepatricio@gmail,com', '(+56) 993347673', 3);

--  9. Hacer COMMIT a la tabla usuarios.-
COMMIT;

-- 10. Insertar registro en la tabla de direcciones.-

INSERT INTO direcciones (rut_propietario, nombre) VALUES
('111111111', 'Los Cerezos 1051'),
('111111111', 'Los Cerezos 1061'),
('111111111', 'Los Cerezos 1071');

-- 11. Hacer COMMIT a la tabla usuarios.-
COMMIT;

-- 12. Insertar registro en la tabla de visitas.- 

INSERT INTO visitas (rut, fecha_visita, direccion_id, nombres, apellidos, sexo, opcion, nro_patente, hora_de_salida, rut_usuario) 
    VALUES ('222222222', '30-03-2022 10:00:00', 2, 'Armando', 'Reyes Miranda', 'M', '2', 'JS 50 40', '18:23:33', '123456785');
