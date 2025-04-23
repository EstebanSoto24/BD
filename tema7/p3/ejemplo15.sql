DELIMITER $$
USE Practica8 $$
DROP FUNCTION IF EXISTS numero_cajas $$
CREATE FUNCTION numero_cajas (pcodigo int)
RETURNS int
BEGIN
DECLARE numcajas int; 

SELECT COUNT(*) INTO numcajas
FROM almacenes JOIN cajas
ON (almacenes.codigo=cajas.almacen)
WHERE codigo = pcodigo;

RETURN numcajas;
END; $$
DELIMITER ;
