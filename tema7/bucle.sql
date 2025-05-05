USE Practica1;
DROP TABLE IF EXISTS tabla1;
CREATE TABLE tabla1 (
	id int PRIMARY KEY,
	datos varchar(30)
)ENGINE=InnoDB;

DELIMITER $$
DROP PROCEDURE IF EXISTS ej14 $$
CREATE PROCEDURE ej14 ()
BEGIN

DECLARE cont int;
DECLARE datos varchar(255);
SET cont = 1;

loop1: LOOP
	IF cont >= 11
		THEN LEAVE loop1;
	END IF;
	SET datos = CONCAT('Registro', cont);
	INSERT INTO tabla1 VALUES (cont, datos);
	SET cont = cont + 1;
END LOOP;

SET cont = 6;

loop2: LOOP
	IF cont >= 11
		THEN LEAVE loop2;
	END IF;
	UPDATE tabla1 SET datos = 'fila actualizada' WHERE id = cont;
	SET cont = cont + 1;
END LOOP;

END; $$
DELIMITER ;
