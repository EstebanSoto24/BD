DELIMITER $$
USE Producto $$
DROP FUNCTION IF EXISTS addiva $$
CREATE FUNCTION addiva (pcodigo int, pprecio decimal(10,2))
BEGIN
ALTER TABLE productos
ADD preciomasiva int
DEFAULT NULL;

UPDATE productos
SET preciioiva = precio + (precio *0,21)
WHERE tipo = 'Textil';

END; $$
DELIMITER ;
