DELIMITER $$
USE Practica8 $$
DROP PROCEDURE IF EXISTS promedio $$
CREATE PROCEDURE promedio(pcurso INT) 
BEGIN

/* Declaración de variables normales */
DECLARE lrf BOOL;
DECLARE cont INT;
DECLARE vpromedio, vcalificacion DECIMAL(10,2);

/* Declaración del cursor */
DECLARE cursor1 CURSOR FOR 
SELECT calificacion
FROM calificaciones
WHERE id_curso = pcurso;

/* Declaración del manejador de errores */
DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf = 1;

SET lrf = 0, cont = 0, vpromedio = 0;

OPEN cursor1;

bucle1: LOOP
	FETCH cursor1 INTO vcalificacion;
	IF lrf = 1
		THEN LEAVE bucle1;
	END IF;
	SET vpromedio = vpromedio + vcalificacion;
	SET cont = cont + 1;
END LOOP bucle1;
	
CLOSE cursor1;

SET vpromedio = vpromedio/cont;

INSERT INTO Promedio_calificaciones_curso VALUES (pcurso, vpromedio);

END; $$
DELIMITER ;
