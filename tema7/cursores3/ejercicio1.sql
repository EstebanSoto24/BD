DELIMITER $$
USE Practic8 $$
DROP PROCEDURE IF EXISTS cuentas_mes $$
CREATE PROCEDURE cuentas_mes (pmes INT)
BEGIN

/* DECLARAMOS LAS VARIABLES */
DECLARE cuentas, vcodigo INT;
DECLARE lrf BOOL; /* Variable de control de errores */

/* DECLARAMOS EL CURSOR */
DECLARE cursor1 CURSOR FOR
SELECT codigo 
FROM cuentas
WHERE MONTH(fecha_creacion) = pmes;

/* DECLARAMOS EL CONTROL DE ERRORES PARA SABER CUANDO TERMINA LA TABLA */
DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf = 1;

OPEN cursor1;

SET lrf = 0, cuentas = 0;

bucle: LOOP
	FETCH cursor1 INTO vcodigo;
	IF lrf = 1
		THEN LEAVE bucle;
	END IF;
	SET cuentas = cuentas + 1;
END LOOP;

CLOSE cursor1;

INSERT INTO Cuentas_mes VALUES (pmes, cuentas);
SELECT * FROM Cuentas_mes;
END; $$
DELIMITER ;
