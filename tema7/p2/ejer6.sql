DELIMITER $$
USE funciones $$
DROP PROCEDURE IF EXISTS salario $$
CREATE PROCEDURE salario (id int, nombre varchar(255), edad int, salario int, s_min int)
BEGIN

	IF salario > s_min
		THEN
			INSERT INTO Empleados VALUES (id, nombre, edad, salario);
		ELSE
			SELECT 'Este salario el menor que el salario mínimo' AS 'Mensaje';
	END IF;

END; $$
DELIMITER ;

