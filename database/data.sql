DROP TABLE IF EXISTS direcciones, usuarios, propietarios, visitas;

CREATE TABLE usuarios(
  rut         VARCHAR(10) NOT NULL,
  nombre      VARCHAR(25) NOT NULL,
  password    VARCHAR(16) NOT NULL,
  PRIMARY KEY (rut)
);

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

CREATE TABLE direcciones(  
  id               SERIAL,
  rut_propietario  VARCHAR(10) NOT NULL,
  nombre           VARCHAR(40) UNIQUE,
  PRIMARY KEY (id),
  FOREIGN key (rut_propietario) REFERENCES propietarios(rut) ON DELETE SET NULL
);

CREATE TABLE visitas (
  id                     SERIAL,
  rut                    VARCHAR(10) NOT NULL,
  fecha_visita           TIMESTAMP NOT NULL DEFAULT NOW(),
  direccion_id           INT NOT NULL,
  nombres                VARCHAR(20) NOT NULL,
  apellidos              VARCHAR(25) NOT NULL,
  sexo                   VARCHAR(1)  NOT NULL,
  opcion                 BOOLEAN NOT NULL DEFAULT TRUE,
  nro_patente            VARCHAR(15),
  hora_de_salida         TIMESTAMP,
  rut_usuario            VARCHAR(10) NOT NULL,
  estado                 BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY(id),
  UNIQUE (rut, fecha_visita, direccion_id)
);

INSERT INTO usuarios (rut, nombre, password) VALUES ('123456785', 'Portero Turno # 1', '123');

INSERT INTO propietarios(rut, nombres, apellidos, sexo, email, nro_celular_principal)
VALUES ('1-9', 'Condominio', 'Valle Aplacible', 'M', 'condominiovalleapacible@gmail.com', '(+56) 993347673');
   
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
