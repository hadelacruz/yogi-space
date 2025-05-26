-- CreateEnum
CREATE TYPE "valorCupo" AS ENUM ('10', '20', '30', '40');

-- CreateTable
CREATE TABLE "rol" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,

    CONSTRAINT "rol_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "usuario" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "correo" TEXT NOT NULL,
    "telefono" TEXT,
    "rol_id" INTEGER NOT NULL,

    CONSTRAINT "usuario_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "clase" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "descripcion" TEXT,

    CONSTRAINT "clase_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sala" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "ubicacion" TEXT,

    CONSTRAINT "sala_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sesion" (
    "id" SERIAL NOT NULL,
    "clase_id" INTEGER NOT NULL,
    "instructor_id" INTEGER NOT NULL,
    "sala_id" INTEGER,
    "fecha" TIMESTAMP(3) NOT NULL,
    "hora_inicio" TIMESTAMP(3) NOT NULL,
    "hora_fin" TIMESTAMP(3) NOT NULL,
    "cupo_maximo" "valorCupo" NOT NULL,

    CONSTRAINT "sesion_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "rol_nombre_key" ON "rol"("nombre");

-- CreateIndex
CREATE UNIQUE INDEX "usuario_correo_key" ON "usuario"("correo");

-- AddForeignKey
ALTER TABLE "usuario" ADD CONSTRAINT "usuario_rol_id_fkey" FOREIGN KEY ("rol_id") REFERENCES "rol"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sesion" ADD CONSTRAINT "sesion_clase_id_fkey" FOREIGN KEY ("clase_id") REFERENCES "clase"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sesion" ADD CONSTRAINT "sesion_instructor_id_fkey" FOREIGN KEY ("instructor_id") REFERENCES "usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sesion" ADD CONSTRAINT "sesion_sala_id_fkey" FOREIGN KEY ("sala_id") REFERENCES "sala"("id") ON DELETE SET NULL ON UPDATE CASCADE;

--Create View
CREATE OR REPLACE VIEW vista_sesiones_detalle AS
SELECT 
  s.id AS sesion_id,
  c.nombre AS clase_nombre,
  u.nombre AS instructor_nombre,
  s.fecha,
  s.hora_inicio,
  s.hora_fin,
  s.cupo_maximo
FROM sesion s
JOIN clase c ON s.clase_id = c.id
JOIN usuario u ON s.instructor_id = u.id;

CREATE OR REPLACE FUNCTION verificar_sesion_instructor()
RETURNS TRIGGER AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM sesion
    WHERE instructor_id = NEW.instructor_id
      AND fecha = NEW.fecha
      AND id <> COALESCE(NEW.id, -1)  -- para evitar conflicto con sí mismo en UPDATE
      AND (
        (NEW.hora_inicio < hora_fin AND NEW.hora_fin > hora_inicio)
      )
  ) THEN
    RAISE EXCEPTION 'El instructor ya tiene una sesión que se superpone con este horario.';
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--Create Trigger to Insert and Update session
CREATE TRIGGER trg_verificar_sesion_instructor
BEFORE INSERT OR UPDATE ON sesion
FOR EACH ROW
EXECUTE FUNCTION verificar_sesion_instructor();