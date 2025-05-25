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

-- Insertar sesiones
DO $$
DECLARE
  i INT;
  clase_id INT;
  instructor_id INT;
  sala_id INT;
  fecha DATE;
  hora_inicio TIMESTAMP;
  hora_fin TIMESTAMP;
  cupo "CupoMaximo";
BEGIN
  FOR i IN 1..50 LOOP
    clase_id := (SELECT id FROM clase ORDER BY random() LIMIT 1);
    instructor_id := (SELECT id FROM usuario WHERE rol_id = 2 ORDER BY random() LIMIT 1);
    sala_id := (SELECT id FROM sala ORDER BY random() LIMIT 1);
    fecha := DATE '2025-06-01' + (random() * 14)::INT;
    hora_inicio := fecha + interval '7 hours' + interval '1 hour' * (random() * 10)::INT;
	hora_fin := hora_inicio + interval '1 hour';
	cupo := (ARRAY['10', '20', '30', '40'])[floor(random() * 4 + 1)]::"CupoMaximo";

    INSERT INTO sesion (clase_id, instructor_id, sala_id, fecha, hora_inicio, hora_fin, cupo_maximo)
    VALUES (clase_id, instructor_id, sala_id, fecha, hora_inicio, hora_fin, cupo);
  END LOOP;
END;
$$ LANGUAGE plpgsql;


-- Insertar inscripciones
DO $$
DECLARE
  i INT;
  cliente_id INT;
  sesion_id INT;
BEGIN
  FOR i IN 1..100 LOOP
    cliente_id := (SELECT id FROM usuario WHERE rol_id = 1 ORDER BY random() LIMIT 1);
    sesion_id := (SELECT id FROM sesion ORDER BY random() LIMIT 1);

    BEGIN
      INSERT INTO inscripcion (sesion_id, cliente_id)
      VALUES (sesion_id, cliente_id);
    EXCEPTION
      WHEN unique_violation THEN
        -- ya estaba inscrito, lo ignoramos
        CONTINUE;
    END;
  END LOOP;
END;
$$ LANGUAGE plpgsql;

-- Insertar asistencias
DO $$
DECLARE
  ins_id INT;
  asistio BOOL;
BEGIN
  FOR ins_id IN SELECT id FROM inscripcion LOOP
    asistio := random() < 0.75; -- 75% chance de asistir
    INSERT INTO asistencia (inscripcion_id, asistio)
    VALUES (ins_id, asistio);
  END LOOP;
END;
$$ LANGUAGE plpgsql;

-- Insertar citas personales
DO $$
DECLARE
  i INT;
  cliente_id INT;
  instructor_id INT;
  fecha DATE;
  hora_inicio TIMESTAMP;
  hora_fin TIMESTAMP;
  motivo TEXT;
BEGIN
  FOR i IN 1..30 LOOP
    cliente_id := (SELECT id FROM usuario WHERE rol_id = 1 ORDER BY random() LIMIT 1);
    instructor_id := (SELECT id FROM usuario WHERE rol_id = 2 AND id <> cliente_id ORDER BY random() LIMIT 1);
    fecha := DATE '2025-06-01' + (random() * 14)::INT;
    hora_inicio := fecha + interval '8 hours' + interval '1 hour' * (random() * 8)::INT;
	hora_fin := hora_inicio + interval '45 minutes';
    motivo := 'Sesión personalizada ' || i;

    BEGIN
      INSERT INTO cita_personal (cliente_id, instructor_id, fecha, hora_inicio, hora_fin, motivo)
      VALUES (cliente_id, instructor_id, fecha, hora_inicio, hora_fin, motivo);
    EXCEPTION
      WHEN OTHERS THEN
        CONTINUE;
    END;
  END LOOP;
END;
$$ LANGUAGE plpgsql;



