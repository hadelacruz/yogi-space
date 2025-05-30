-- Insertar roles
INSERT INTO rol (nombre) VALUES 
('cliente'),
('instructor');

-- Insertar usuarios
-- Instructores
INSERT INTO usuario (nombre, correo, telefono, rol_id) VALUES
('Daniela Rosales', 'daniela.rosales@studio.com', '5551-0003', 2),
('Erick Mendoza', 'erick.mendoza@studio.com', '5551-0004', 2),
('Pamela Soto', 'pamela.soto@studio.com', '5551-0005', 2),
('Marco Palacios', 'marco.palacios@studio.com', '5551-0006', 2),
('Gabriela Castillo', 'gabriela.castillo@studio.com', '5551-0007', 2),
('Rodrigo Meza', 'rodrigo.meza@studio.com', '5551-0008', 2),
('Andrea Fuentes', 'andrea.fuentes@studio.com', '5551-0009', 2),
('Juan Pablo Morales', 'juanpablo.morales@studio.com', '5551-0010', 2),
('Mónica Leiva', 'monica.leiva@studio.com', '5551-0011', 2),
('Esteban Barrios', 'esteban.barrios@studio.com', '5551-0012', 2);


-- Insertar clases
INSERT INTO clase (nombre, descripcion) VALUES
('Yoga Básico', 'Clases de introducción al yoga para todos los niveles.'),
('Meditación Guiada', 'Sesiones centradas en respiración y atención plena.'),
('Vinyasa Flow', 'Flujo dinámico de posturas coordinadas con la respiración.'),
('Hatha Yoga', 'Práctica equilibrada entre esfuerzo físico y relajación.'),
('Yoga Restaurativo', 'Sesiones suaves para descanso profundo y recuperación.'),
('Yoga para la Espalda', 'Posturas específicas para aliviar dolores lumbares.'),
('Yoga Avanzado', 'Retos físicos y mentales para practicantes expertos.'),
('Meditación en Movimiento', 'Técnicas de meditación incorporando movimiento físico.'),
('Power Yoga', 'Entrenamiento físico intenso con base en yoga tradicional.'),
('Yoga para Niños', 'Clases lúdicas adaptadas para edades tempranas.');


--Insertar sesiones
INSERT INTO sesion (clase_id, instructor_id, fecha, hora_inicio, hora_fin, cupo_maximo) VALUES
-- 1 de junio
(1, 1, '2025-06-01', '2025-06-01 07:00:00', '2025-06-01 08:00:00', '20'),
(2, 2, '2025-06-01', '2025-06-01 08:00:00', '2025-06-01 09:00:00', '30'),
(3, 3, '2025-06-01', '2025-06-01 09:00:00', '2025-06-01 10:00:00', '20'),
(4, 4, '2025-06-01', '2025-06-01 10:00:00', '2025-06-01 11:00:00', '10'),
(5, 5, '2025-06-01', '2025-06-01 11:00:00', '2025-06-01 12:00:00', '20'),

-- 2 de junio
(6, 6, '2025-06-02', '2025-06-02 07:00:00', '2025-06-02 08:00:00', '20'),
(7, 7, '2025-06-02', '2025-06-02 08:00:00', '2025-06-02 09:00:00', '30'),
(8, 8, '2025-06-02', '2025-06-02 09:00:00', '2025-06-02 10:00:00', '10'),
(9, 9, '2025-06-02', '2025-06-02 10:00:00', '2025-06-02 11:00:00', '20'),
(10, 10, '2025-06-02', '2025-06-02 11:00:00', '2025-06-02 12:00:00', '10'),

-- 3 de junio
(1, 2, '2025-06-03', '2025-06-03 07:00:00', '2025-06-03 08:00:00', '20'),
(2, 3, '2025-06-03', '2025-06-03 08:00:00', '2025-06-03 09:00:00', '30'),
(3, 4, '2025-06-03', '2025-06-03 09:00:00', '2025-06-03 10:00:00', '10'),
(4, 5, '2025-06-03', '2025-06-03 10:00:00', '2025-06-03 11:00:00', '20'),
(5, 6,  '2025-06-03', '2025-06-03 11:00:00', '2025-06-03 12:00:00', '20');
