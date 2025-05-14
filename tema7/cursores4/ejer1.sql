DELIMITER $$
USE Practica8 $$
DROP PROCEDURE IF EXISTS bajo_stock $$
CREATE PROCEDURE bajo_stock()
BEGIN

/* Declaración de variables normales */
DECLARE lrf BOOL;
DECLARE vid_producto INT;

/* Declaración del cursor */
DECLARE cursor1 CURSOR FOR
SELECT id_producto
FROM productos
WHERE stock_actual < stock_minimo;

/* Declaración del control de errores */
DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf = 1;

SET lrf = 0;

OPEN cursor1;

bucle: LOOP
	FETCH cursor1 INTO vid_producto;
		IF lrf = 1
			THEN LEAVE bucle;
		END IF;
	UPDATE productos SET estado = 'BAJO STOCK' WHERE id_producto = vid_producto;
END LOOP bucle;

CLOSE cursor1;

END; $$
DELIMITER ;
