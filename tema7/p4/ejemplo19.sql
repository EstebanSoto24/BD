DELIMITER $$
USE Practica8 $$
DROP FUNCTION IF EXISTS peli $$
CREATE FUNCTION peli (pid_peli int) 
RETURNS varchar(255)
BEGIN
DECLARE vduracion int;

SELECT duracion INTO vduracion
FROM PELICULAS
WHERE codigo = pid_peli;

IF vduracion < 5
	THEN
		RETURN 'Corta Duración';
ELSEIF vduracion >= 50 AND vduracion < 120
	THEN
		RETURN 'Media Duración';
ELSEIF vduracion >= 120
	THEN
		RETURN 'Larga Duración';
ELSE
	RETURN 'Con este codigo no hay ninguna pelicula';
END IF;

END; $$
DELIMITER ;
