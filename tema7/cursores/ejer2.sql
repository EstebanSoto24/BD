DELIMITER $$
USE Practica8 $$
DROP PROCEDURE IF EXISTS contar2 $$
CREATE PROCEDURE contar2()
BEGIN

/* Declaracion de variables */
DECLARE vcodigo INT;
DECLARE lrf BOOLEAN;
DECLARE cont INT;

/* Declaracion del cursor para contar los registros de la tabla */
DECLARE cursor1 CURSOR FOR SELECT codigo FROM PELICULAS WHERE nacionalidad = 'Estados Unidos';

/* Declaración del manejo de errores */
DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf = 1;

SET lrf = 0, cont = 0;

OPEN cursor1;

bucle: REPEAT 
	FETCH cursor1 INTO vcodigo;
	IF lrf = 1
			THEN LEAVE bucle;
		END IF;
	SET cont = cont + 1;
	UNTIL lrf = 1
END REPEAT bucle;

CLOSE cursor1;

SELECT cont;
END; $$
DELIMITER ;
