DELIMITER $$
USE funciones $$
DROP PROCEDURE IF EXISTS bono $$
CREATE PROCEDURE bono (id_emple int)
BEGIN
    SELECT calificacion_rendimiento INTO @cali
    FROM Empleados
    WHERE id_empleado = id_emple;

CASE @cali
    WHEN 'A' THEN UPDATE Empleados SET bono = 500 WHERE id_empleado = id_emple;
    WHEN 'B' THEN UPDATE Empleados SET bono = 250 WHERE id_empleado = id_emple;
    WHEN 'C' THEN UPDATE Empleados SET bono = 0 WHERE id_empleado = id_emple;
    ELSE UPDATE Empleados SET bono = NULL WHERE id_empleado = id_emple;
END CASE;

END; $$
DELIMITER ;