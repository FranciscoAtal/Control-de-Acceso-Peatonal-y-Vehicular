
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
  FOREIGN key (rut_propietario) REFERENCES propietarios(rut)
);

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
  FOREIGN KEY (direccion_id) REFERENCES direcciones(id),
  FOREIGN KEY (rut_usuario) REFERENCES usuarios(rut)
);

INSERT INTO usuarios (rut, nombre, password) VALUES ('12345678-9', 'Portero Turno # 1', '123');

INSERT INTO propietarios(rut, nombres, apellidos, sexo, email, nro_celular_principal)
VALUES ('11111111-1', 'Jose Patricio', 'Reyes Miranda', 'M', 'josepatricio@gmail,com', '(+56) 993347673');
   
INSERT INTO direcciones (rut_propietario, nombre) VALUES
('11111111-1', 'Los Cerezos 1051'),
('11111111-1', 'Los Cerezos 1061'),
('11111111-1', 'Los Cerezos 1071');

INSERT INTO visitas (rut, fecha_visita, direccion_id, nombres, apellidos, sexo, opcion, nro_patente, hora_de_salida, rut_usuario) 
    VALUES ('22222222-1', '30-03-2022 10:00:00', 2, 'Armando', 'Reyes Miranda', 'M', '2', 'JS 50 40', '18:23:33', '12345678-9');
