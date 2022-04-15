-- 1. Borrar tabla visitas
   DROP TABLE IF EXISTS visitas;

-- 2. Crear una tabla “visitas”, con los atributos:

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
  PRIMARY KEY (id),
  UNIQUE(rut, fecha_visita, direccion_id)
);

-- 3. Insertar registro en la tabla de visitas.- 

INSERT INTO visitas (rut, fecha_visita, direccion_id, nombres, apellidos, sexo, opcion, nro_patente, hora_de_salida, rut_usuario) 
    VALUES ('222222222', '30-03-2022 10:00:00', 2, 'Armando', 'Reyes Miranda', 'M', FALSE, 'JS 50 40', '30-03-2022 18:23:33', '123456785');
