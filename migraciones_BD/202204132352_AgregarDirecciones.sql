-- 1. Borrar tablas

   DROP TABLE IF EXISTS  usuarios, propietarios, direcciones, visitas;

-- 2. Ingresar registros en la tabla usuarios:

INSERT INTO usuarios (rut, nombre, password) VALUES ('12345678-9', 'Portero Turno # 1', '123');

-- 2. Ingresar registros en la tabla propietarios:

INSERT INTO propietarios(rut, nombres, apellidos, sexo, email, nro_celular_principal)
VALUES ('1-9', 'Condominio', 'Valle Aplacible', 'M', 'condominiovalleapacible@gmail.com', '(+56) 993347673');

-- 3. Ingresar registros en la tabla direcciones:

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

-- 4. Ingresar registros en la tabla visitas:

INSERT INTO visitas (rut, fecha_visita, direccion_id, nombres, apellidos, sexo, opcion, nro_patente, rut_usuario) 
    VALUES ('222222222', '30-03-2022 10:00:00', 2, 'Armando', 'Reyes Miranda', 'M', FALSE, 'JS 50 40', '12345678-9');
