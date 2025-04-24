DELIMITER $$
USE Practica8 $$
DROP PROCEDURE IF EXISTS changemail $$
CREATE PROCEDURE changemail (pid_cliente int, pemail varchar(255))
BEGIN

UPDATE clientes SET email = pemial WHERE id_cliente = pid_cliente;

END; $$
DELIMITER ;

