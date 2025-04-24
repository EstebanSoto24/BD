DELIMITER $$
USE Practica8 $$
DROP PROCEDURE IF EXISTS deletecajas $$
CREATE PROCEDURE deletecajas (pnumref varchar(5))
BEGIN

DECLARE existe int;

SELECT COUNT(numreferencia) INTO existe
FROM cajas
WHERE numreferencia = pnumref;

IF existe = 0
	THEN
		SELECT CONCAT('La caja con el numero de referencia ', pnumref, ' no existe') AS 'Mensaje';
ELSE
		DELETE FROM cajas WHERE numreferencia = pnumref;
END IF;
END; $$
DELIMITER ;
