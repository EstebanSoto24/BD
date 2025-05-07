DELIMITER $$
USE Practica8 $$
DROP PROCEDURE IF EXISTS saldo_negativo $$
CREATE PROCEDURE saldo_negativo ()
BEGIN

/* DECLARAMOS LAS VARIABLES QUE NOS HARÁN FALTA */
DECLARE vtitular VARCHAR(100);
DECLARE vcodigo char(6);
DECLARE vfecha_creacion DATE;
DECLARE vsaldo DECIMAL(10,2);
DECLARE lrf BOOLEAN;



/* DECLARAMOS EL CURSOR */
DECLARE cursor1 CURSOR FOR SELECT * FROM cuentas WHERE saldo < 0;

/* DECLARAMOS EL MANEJO DE ERRORES */
DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf = 1;

SET lrf = 0;

OPEN cursor1;

bucle: LOOP
	FETCH cursor1 INTO vcodigo, vtitular, vfecha_creacion, vsaldo;
		IF lrf = 1
			THEN LEAVE bucle;
		END IF;
	SELECT vcodigo, vtitular, vfecha_creacion, vsaldo;
END LOOP bucle;

CLOSE cursor1;

END; $$
DELIMITER ;

