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

--Cliente

INSERT INTO usuario (nombre, correo, telefono, rol_id) VALUES
('Camila López', 'camila.lopez@cliente.com', '5552-0008', 1),
('Javier Gómez', 'javier.gomez@cliente.com', '5552-0009', 1),
('Lucía Martínez', 'lucia.martinez@cliente.com', '5552-0010', 1),
('Mateo Herrera', 'mateo.herrera@cliente.com', '5552-0011', 1),
('Sofía Morales', 'sofia.morales@cliente.com', '5552-0012', 1),
('Sebastián Pérez', 'sebastian.perez@cliente.com', '5552-0013', 1),
('Valentina Díaz', 'valentina.diaz@cliente.com', '5552-0014', 1),
('Alejandro Torres', 'alejandro.torres@cliente.com', '5552-0015', 1),
('Isabella Ríos', 'isabella.rios@cliente.com', '5552-0016', 1),
('Diego Ramírez', 'diego.ramirez@cliente.com', '5552-0017', 1),

('Mariana Cruz', 'mariana.cruz@cliente.com', '5552-0018', 1),
('Tomás Castillo', 'tomas.castillo@cliente.com', '5552-0019', 1),
('Renata Sánchez', 'renata.sanchez@cliente.com', '5552-0020', 1),
('Nicolás Pineda', 'nicolas.pineda@cliente.com', '5552-0021', 1),
('Emily Barrios', 'emily.barrios@cliente.com', '5552-0022', 1),
('Andrés Molina', 'andres.molina@cliente.com', '5552-0023', 1),
('Daniela Juárez', 'daniela.juarez@cliente.com', '5552-0024', 1),
('Carlos Rivera', 'carlos.rivera@cliente.com', '5552-0025', 1),
('Fernanda Meza', 'fernanda.meza@cliente.com', '5552-0026', 1),
('Gabriel Ortiz', 'gabriel.ortiz@cliente.com', '5552-0027', 1),

('María José Salazar', 'mariajose.salazar@cliente.com', '5552-0028', 1),
('Luis Fernando Méndez', 'luisfernando.mendez@cliente.com', '5552-0029', 1),
('Paula Estrada', 'paula.estrada@cliente.com', '5552-0030', 1),
('Miguel Ángel López', 'miguel.lopez@cliente.com', '5552-0031', 1),
('Alexa Godoy', 'alexa.godoy@cliente.com', '5552-0032', 1),
('José Manuel Soto', 'josemanuel.soto@cliente.com', '5552-0033', 1),
('Dayana Aguilar', 'dayana.aguilar@cliente.com', '5552-0034', 1),
('Álvaro Peralta', 'alvaro.peralta@cliente.com', '5552-0035', 1),
('Vanessa Herrera', 'vanessa.herrera@cliente.com', '5552-0036', 1),
('Ricardo Ruiz', 'ricardo.ruiz@cliente.com', '5552-0037', 1),

('Natalia Vásquez', 'natalia.vasquez@cliente.com', '5552-0038', 1),
('Ángel Cabrera', 'angel.cabrera@cliente.com', '5552-0039', 1),
('Antonella Marroquín', 'antonella.marroquin@cliente.com', '5552-0040', 1),
('Emilio Barrios', 'emilio.barrios@cliente.com', '5552-0041', 1),
('Julieta Castañeda', 'julieta.castaneda@cliente.com', '5552-0042', 1),
('Benjamín Guerra', 'benjamin.guerra@cliente.com', '5552-0043', 1),
('Nicole Palma', 'nicole.palma@cliente.com', '5552-0044', 1),
('Pablo Linares', 'pablo.linares@cliente.com', '5552-0045', 1),
('Ximena Corado', 'ximena.corado@cliente.com', '5552-0046', 1),
('Iván Cifuentes', 'ivan.cifuentes@cliente.com', '5552-0047', 1),

('Bianca López', 'bianca.lopez@cliente.com', '5552-0048', 1),
('Kevin Juárez', 'kevin.juarez@cliente.com', '5552-0049', 1),
('Camilo Estrada', 'camilo.estrada@cliente.com', '5552-0050', 1),
('Regina López', 'regina.lopez@cliente.com', '5552-0051', 1),
('Thiago Salguero', 'thiago.salguero@cliente.com', '5552-0052', 1),
('Allison Pérez', 'allison.perez@cliente.com', '5552-0053', 1),
('Lucas Carranza', 'lucas.carranza@cliente.com', '5552-0054', 1),
('Mía Rodríguez', 'mia.rodriguez@cliente.com', '5552-0055', 1),
('Santiago Mejía', 'santiago.mejia@cliente.com', '5552-0056', 1),
('Valery Morales', 'valery.morales@cliente.com', '5552-0057', 1);


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

-- Insertar salas
INSERT INTO sala (nombre, ubicacion) VALUES
('Sala Zen', 'Primer Nivel'),
('Estudio del Sol', 'Segundo Nivel'),
('Terraza Tranquila', 'Tercer Nivel'),
('Salón Armonía', 'Cuarto Nivel'),
('Espacio Interior', 'Sótano'),
('Jardín de Paz', 'Área Verde'),
('Cúpula Interior', 'Nivel Intermedio'),
('Estudio Zen 2', 'Cuarto Nivel'),
('Rincón Sereno', 'Segundo Nivel'),
('Sala de Cristal', 'Azotea');

--Insertar sesiones
-- Insertar sesiones
INSERT INTO sesion (clase_id, instructor_id, sala_id, fecha, hora_inicio, hora_fin, cupo_maximo) VALUES
-- 1 de junio
(1, 1, 1, '2025-06-01', '2025-06-01 07:00:00', '2025-06-01 08:00:00', '20'),
(2, 2, 2, '2025-06-01', '2025-06-01 08:00:00', '2025-06-01 09:00:00', '30'),
(3, 3, 3, '2025-06-01', '2025-06-01 09:00:00', '2025-06-01 10:00:00', '20'),
(4, 4, 4, '2025-06-01', '2025-06-01 10:00:00', '2025-06-01 11:00:00', '10'),
(5, 5, 5, '2025-06-01', '2025-06-01 11:00:00', '2025-06-01 12:00:00', '20'),

-- 2 de junio
(6, 6, 1, '2025-06-02', '2025-06-02 07:00:00', '2025-06-02 08:00:00', '20'),
(7, 7, 2, '2025-06-02', '2025-06-02 08:00:00', '2025-06-02 09:00:00', '30'),
(8, 8, 3, '2025-06-02', '2025-06-02 09:00:00', '2025-06-02 10:00:00', '10'),
(9, 9, 4, '2025-06-02', '2025-06-02 10:00:00', '2025-06-02 11:00:00', '20'),
(10, 10, 5, '2025-06-02', '2025-06-02 11:00:00', '2025-06-02 12:00:00', '10'),

-- 3 de junio
(1, 2, 6, '2025-06-03', '2025-06-03 07:00:00', '2025-06-03 08:00:00', '20'),
(2, 3, 7, '2025-06-03', '2025-06-03 08:00:00', '2025-06-03 09:00:00', '30'),
(3, 4, 8, '2025-06-03', '2025-06-03 09:00:00', '2025-06-03 10:00:00', '10'),
(4, 5, 9, '2025-06-03', '2025-06-03 10:00:00', '2025-06-03 11:00:00', '20'),
(5, 6, 10, '2025-06-03', '2025-06-03 11:00:00', '2025-06-03 12:00:00', '20');
