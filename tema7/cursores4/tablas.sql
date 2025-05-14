-- Tabla productos
CREATE TABLE productos (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    stock_actual INT,
    stock_minimo INT,
    estado VARCHAR(50)
)ENGINE=InnoDB;

-- Insertando datos en productos
INSERT INTO productos (id_producto, nombre_producto, stock_actual, stock_minimo, estado) VALUES
(1, 'Producto A', 5, 10, 'DISPONIBLE'),
(2, 'Producto B', 20, 15, 'DISPONIBLE'),
(3, 'Producto C', 3, 5, 'DISPONIBLE'),
(4, 'Producto D', 12, 12, 'DISPONIBLE'),
(5, 'Producto E', 1, 4, 'DISPONIBLE');

-- Tabla calificaciones
CREATE TABLE calificaciones (
    id_alumno INT,
    id_curso INT,
    calificacion DECIMAL(4,2)
)ENGINE=InnoDB;

-- Insertando datos en calificaciones
INSERT INTO calificaciones (id_alumno, id_curso, calificacion) VALUES
(101, 1, 8.5),
(102, 1, 9.0),
(103, 1, 7.5),
(101, 2, 6.5),
(102, 2, 8.0),
(103, 2, 9.5),
(104, 1, 10.0);

-- Tabla Promedio_calificaciones_curso
CREATE TABLE Promedio_calificaciones_curso (
    id_curso INT PRIMARY KEY,
    promedio_calificacion DECIMAL(4,2)
)ENGINE=InnoDB;





