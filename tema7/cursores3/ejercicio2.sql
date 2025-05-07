DELIMITER $$
USE Practica8 $$
DROP PROCEDURE IF EXISTS contar_mes $$
CREATE PROCEDURE contar_mes (pmes varchar(100))
BEGIN

/* DECLARAMOS LAS VARIABLES */
DECLARE vmes, cuentas, vcodigo INT;
DECLARE lrf BOOL; /* Variable de control de errores */

/* DECLARAMOS EL CURSOR */
DECLARE cursor1 CURSOR FOR
SELECT codigo 
FROM cuentas
WHERE MONTH(fecha_creacion) = vmes;

/* DECLARAMOS EL CONTROL DE ERRORES PARA SABER CUANDO TERMINA LA TABLA */
DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf = 1;

CASE pmes
	WHEN 'enero' THEN SET vmes = 1;
	WHEN 'febrero' THEN SET vmes = 2;
	WHEN 'marzo' THEN SET vmes = 3;
	WHEN 'abril' THEN SET vmes = 4;
	WHEN 'mayo' THEN SET vmes = 5;
	WHEN 'junio' THEN SET vmes = 6;
	WHEN 'julio' THEN SET vmes = 7;
	WHEN 'agosto' THEN SET vmes = 8;
	WHEN 'septiembre' THEN SET vmes = 9;
	WHEN 'octubre' THEN SET vmes = 10;
	WHEN 'noviembre' THEN SET vmes = 11;
	WHEN 'diciembre' THEN SET vmes = 12;
END CASE;

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

INSERT INTO Cuentas_mes VALUES (vmes, cuentas);
SELECT * FROM Cuentas_mes;
END; $$
DELIMITER ;
