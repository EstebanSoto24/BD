/* 3. Crea una rutina que muestre la cuenta con mayor saldo a favor.*/
DELIMITER $$
USE Practica8 $$
DROP PROCEDURE IF EXISTS mayor_saldo $$
CREATE PROCEDURE mayor_saldo ()
BEGIN

/* DECLARAMOS LAS VARIABLES QUE NOS HARÁN FALTA */
DECLARE tmpcodigo, vcodigo INT;
DECLARE tmptitular, vtitular VARCHAR(100);
DECLARE tmpfecha_creacion, vfecha_creacion DATE;
DECLARE tmpsaldo, vsaldo DECIMAL(10,2);
DECLARE lrf BOOL;

/* DECLARAMOS EL CURSOR */
DECLARE cursor1 CURSOR FOR SELECT * FROM cuentas;

/* DECLARAMOS EL MANEJO DE ERRORES */
DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf = 1;

SET lrf = 0, tmpsaldo = -10000;

OPEN cursor1;

bucle: LOOP
	FETCH cursor1 INTO vcodigo, vtitular, vfecha_creacion, vsaldo;
		IF vsaldo > tmpsaldo
			THEN
				SET tmpcodigo = vcodigo;
				SET tmptitular = vtitular;
				SET tmpfecha_creacion = vfecha_creacion;
				SET tmpsaldo = vsaldo;
		END IF;
	
		IF lrf = 1
			THEN LEAVE bucle;
		END IF;
END LOOP bucle;

CLOSE cursor1;

SELECT tmpcodigo, tmptitular, tmpfecha_creacion, tmpsaldo; 

END; $$
DELIMITER ;
