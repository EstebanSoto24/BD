DELIMITER $$
USE Practica8 $$
DROP PROCEDURE IF EXISTS rellenar_cajas $$
CREATE PROCEDURE rellenar_cajas (pnumref varchar(5), pvalor int)
BEGIN

IF (pvalor < 50)
	THEN
		INSERT INTO cajas (numreferencia, valor, almacen) VALUES (pnumref, pvalor, 1);
ELSEIF (pvalor BETWEEN 50 AND 100)
	THEN
		INSERT INTO cajas (numreferencia, valor, almacen) VALUES (pnumref, pvalor, 2);
ELSEIF (pvalor BETWEEN 100 AND 200)
	THEN
		INSERT INTO cajas (numreferencia, valor, almacen) VALUES (pnumref, pvalor, 3);
ELSEIF (pvalor BETWEEN 200 AND 500)
	THEN
		INSERT INTO cajas (numreferencia, valor, almacen) VALUES (pnumref, pvalor, 4);
ELSEIF (pvalor > 500)
	THEN
		SELECT 'No se puede almacenar esta caja' AS 'Mensaje pati';
		
END IF;

END; $$
DELIMITER ;
