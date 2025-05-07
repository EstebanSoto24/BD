/* 3. Crea una rutina que muestre la cuenta con mayor saldo a favor.*/

DELIMITER $$
USE Practica8 $$
DROP PROCEDURE IF EXISTS mayor_saldo $$
CREATE PROCEDURE mayor_saldo ()
BEGIN

/* DECLARAMOS LAS VARIABLES QUE NOS HARÁN FALTA */
DECLARE vsaldo DECIMAL(10,2);
DECLARE vresult DECIMAL(10,2);
DECLARE lrf BOOL;


/* DECLARAMOS EL CURSOR */
DECLARE cursor1 CURSOR FOR SELECT saldo FROM cuentas;

/* DECLARAMOS EL MANEJO DE ERRORES */
DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf = 1;

SET lrf = 0, vresult = -10000;

OPEN cursor1;

bucle: LOOP
	FETCH cursor1 INTO vsaldo;
		IF vsaldo > vresult
			THEN
				SET vresult = vsaldo;
		END IF;
	
		IF lrf = 1
			THEN LEAVE bucle;
		END IF;
END LOOP bucle;

CLOSE cursor1;

SELECT codigo, titular, fecha_creacion, saldo FROM cuentas WHERE saldo = vresult;

END; $$
DELIMITER ;
