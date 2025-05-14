DELIMITER $$
USE Practica8 $$
DROP PROCEDURE IF EXISTS recorrer_meses $$
CREATE PROCEDURE recorrer_meses()
BEGIN

/* DECLARACION DE VARIABLES */
DECLARE lrf BOOL;
DECLARE vcodigo, vmes, cont, vid INT;

/* DECLARAMOS LOS CURSORES */
DECLARE cursor1 CURSOR FOR
SELECT DISTINCT MONTH(fecha_creacion)
FROM cuentas;

DECLARE cursor2 CURSOR FOR
SELECT codigo
FROM cuentas
WHERE MONTH(fecha_creacion) = vmes;

/* DECLARAMOS EL CONTROL DE ERRORES */
DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf = 1;


OPEN cursor1;

SET lrf = 0, cont = 0;

bucle1: LOOP
	SET lrf = 0;
	FETCH cursor1 INTO vmes;
	IF lrf = 1
		THEN LEAVE bucle1;
	END IF;
	OPEN cursor2;
		bucle2: LOOP
			SET lrf = 0;
			FETCH cursor2 INTO vcodigo;
			IF lrf = 1
				THEN LEAVE bucle2;
			END IF;
			SET cont = cont + 1;
		END LOOP bucle2;
	INSERT INTO Cuentas_mes VALUES (vmes, cont);
	CLOSE cursor2;
	SET cont = 0;
END LOOP bucle1;

CLOSE cursor1;

END; $$
DELIMITER ;
