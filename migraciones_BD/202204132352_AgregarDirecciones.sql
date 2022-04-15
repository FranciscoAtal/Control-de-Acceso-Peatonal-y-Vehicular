-- 1. Borrar tablas

   DROP TABLE IF EXISTS  propietarios, direcciones;

-- 2. Crear una tabla “propietarios”, con los atributos:

CREATE TABLE propietarios (
  rut                    VARCHAR(10) NOT NULL,
  nombres                VARCHAR(30) NOT NULL,
  apellidos              VARCHAR(30) NOT NULL,
  sexo                   VARCHAR(1) NOT NULL,
  email                  VARCHAR(50) NOT NULL,
  nro_celular_principal  VARCHAR(15) NOT NULL,
  nro_celular_secundario VARCHAR(15),
  es_propietario         BOOLEAN NOT NULL DEFAULT TRUE,
  PRIMARY KEY (rut)
);

-- 3. Crear una tabla “direcciones”, con los atributos:

CREATE TABLE direcciones(  
  id               SERIAL,
  rut_propietario  VARCHAR(10) NOT NULL,
  nombre           VARCHAR(40) UNIQUE,
  PRIMARY KEY (id),
  FOREIGN key (rut_propietario) REFERENCES propietarios(rut)
);

-- 4. Ingresar registros en la tabla propietarios:

INSERT INTO propietarios(rut, nombres, apellidos, sexo, email, nro_celular_principal)
VALUES ('1-9', 'Condominio', 'Valle Aplacible', 'M', 'condominiovalleapacible@gmail.com', '(+56) 993347673');

-- 5. Ingresar registros en la tabla direcciones:

INSERT INTO direcciones (rut_propietario, nombre) VALUES
('1-9', 'Los Cerezos 1051'),
('1-9', 'Los Cerezos 1061'),
('1-9', 'Los Cerezos 1071'),
('1-9', 'Los Almendros 1251'),
('1-9', 'Los Almendros 1261'),
('1-9', 'Los Almendros 1271'),
('1-9', 'Los Violetas 1451'),
('1-9', 'Los Violetas 1461'),
('1-9', 'Los Violetas 1471'),
('1-9', 'Los Tulipanes 1651'),
('1-9', 'Los Tulipanes 1661'),
('1-9', 'Los Tulipanes 1671');
