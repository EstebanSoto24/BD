CREATE TABLE PELICULAS (
    codigo INT PRIMARY KEY,
    titulo VARCHAR(100),
    genero VARCHAR(50),
    duracion INT, -- duración en minutos
    nacionalidad VARCHAR(50)
);

INSERT INTO PELICULAS (codigo, titulo, genero, duracion, nacionalidad) VALUES
(1, 'Avatar', 'Ciencia Ficción', 162, 'Estados Unidos'),
(2, 'El Rey León', 'Animación', 88, 'Estados Unidos'),
(3, 'Parásitos', 'Drama', 132, 'Corea del Sur'),
(4, 'Cortometraje Experimental', 'Experimental', 12, 'España'),
(5, 'El Padrino', 'Crimen', 175, 'Estados Unidos'),
(6, 'Toy Story', 'Animación', 81, 'Estados Unidos'),
(7, 'Documental Breve', 'Documental', 48, 'Reino Unido');
