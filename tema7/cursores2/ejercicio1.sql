USE Practica8;
/* Creacion de la tabla para realizar los ejercicios */
DROP TABLE IF EXISTS cuentas;
CREATE TABLE cuentas (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    titular VARCHAR(100) NOT NULL,
    fecha_creacion DATE NOT NULL,
    saldo DECIMAL(10, 2) NOT NULL
);
/* Insercion de datos para realizar los ejercicios */
INSERT INTO cuentas (titular, fecha_creacion, saldo) VALUES
('Carlos Ramírez',      '2024-11-05',   12500.00),
('Laura Gómez',         '2024-11-12',  -150.75),
('José Martínez',       '2024-10-20',   3050.50),
('Ana Torres',        	'2024-11-25',   500.00),
('Lucía Fernández',     '2024-08-14',  -50.00),
('Miguel Herrera',      '2024-07-01',   7600.00),
('Andrea López',        '2024-11-02',   9800.00),
('Pedro Sánchez',       '2024-09-17',   0.00),
('Sofía Pérez',         '2024-11-30',  -320.90),
('Juan Domínguez',      '2024-12-01',   100.00),
('Natalia Ríos',        '2024-11-10',   12200.00),
('Diego Vargas',        '2024-06-22',   50.00),
('Isabel Castillo',     '2024-11-08',   13000.00),
('Emilio Suárez',       '2024-04-15',  -10.00),
('Renata Medina',       '2024-11-18',   15000.00),
('Marcos Aguilar',      '2024-03-10',   2000.00),
('Valeria Cruz',        '2024-11-22',   15800.00),
('Luis Moreno',         '2024-01-05',  -200.00),
('Claudia Reyes',       '2024-11-07',   450.00),
('Roberto Paredes',     '2024-02-28',   750.00);

/* Comenzamos con la rutina */
DELIMITER $$
USE Practica8 $$
DROP PROCEDURE IF EXISTS contar_noviembre $$
CREATE PROCEDURE contar_noviembre ()
BEGIN

/* DECLARAMOS LAS VARIABLES QUE NOS HARÁN FALTA */
DECLARE cont INT;
DECLARE lrf BOOLEAN;
DECLARE vcodigo char(6);


/* DECLARAMOS EL CURSOR */
DECLARE cursor1 CURSOR FOR SELECT codigo FROM cuentas WHERE fecha_creacion LIKE '%-11-%';

/* DECLARAMOS EL MANEJO DE ERRORES */
DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf = 1;

SET lrf = 0, cont = 0;

OPEN cursor1;

bucle: LOOP
	FETCH cursor1 INTO vcodigo;
		IF lrf = 1
			THEN LEAVE bucle;
		END IF;
	SET cont = cont + 1;
END LOOP bucle;

CLOSE cursor1;
SELECT cont;
END; $$
DELIMITER ;












