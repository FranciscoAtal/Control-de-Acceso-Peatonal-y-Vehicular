-- 1. Agrega campo estado a la tabla visitas

ALTER TABLE visitas ADD estado BOOLEAN NOT NULL DEFAULT FALSE;

-- 2. Actualizar el campo estado en la tabla visitas:

UPDATE visitas SET estado = FALSE  WHERE id=1;