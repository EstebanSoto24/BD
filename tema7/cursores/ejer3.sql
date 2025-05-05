DELIMITER $$
USE Practica8 $$
DROP PROCEDURE IF EXISTS contar3 $$
CREATE PROCEDURE contar3()
BEGIN

/* Declaracion de variables */
DECLARE vcodigo INT;
DECLARE lrf BOOLEAN;
DECLARE cont INT;

/* Declaracion del cursor para contar los registros de la tabla */
DECLARE cursor1 CURSOR FOR SELECT codigo FROM PELICULAS;

/* Declaración del manejo de errores */
DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf = 1;

SET lrf = 0, cont = 0;

OPEN cursor1;

bucle: WHILE lrf = 0 DO
	FETCH cursor1 INTO vcodigo;
		IF lrf = 1
			THEN LEAVE bucle;
		END IF;
	SET cont = cont + 1;
END WHILE bucle;

CLOSE cursor1;

SELECT cont;
END; $$
DELIMITER ;
