-- CreateEnum
CREATE TYPE "CupoMaximo" AS ENUM ('10', '20', '30', '40');

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
    "cupo_maximo" "CupoMaximo" NOT NULL,

    CONSTRAINT "sesion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "inscripcion" (
    "id" SERIAL NOT NULL,
    "sesion_id" INTEGER NOT NULL,
    "cliente_id" INTEGER NOT NULL,
    "fecha_inscripcion" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "inscripcion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "asistencia" (
    "id" SERIAL NOT NULL,
    "inscripcion_id" INTEGER NOT NULL,
    "asistio" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "asistencia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cita_personal" (
    "id" SERIAL NOT NULL,
    "cliente_id" INTEGER NOT NULL,
    "instructor_id" INTEGER NOT NULL,
    "fecha" TIMESTAMP(3) NOT NULL,
    "hora_inicio" TIMESTAMP(3) NOT NULL,
    "hora_fin" TIMESTAMP(3) NOT NULL,
    "motivo" TEXT,

    CONSTRAINT "cita_personal_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "rol_nombre_key" ON "rol"("nombre");

-- CreateIndex
CREATE UNIQUE INDEX "usuario_correo_key" ON "usuario"("correo");

-- CreateIndex
CREATE UNIQUE INDEX "inscripcion_sesion_id_cliente_id_key" ON "inscripcion"("sesion_id", "cliente_id");

-- CreateIndex
CREATE UNIQUE INDEX "asistencia_inscripcion_id_key" ON "asistencia"("inscripcion_id");

-- AddForeignKey
ALTER TABLE "usuario" ADD CONSTRAINT "usuario_rol_id_fkey" FOREIGN KEY ("rol_id") REFERENCES "rol"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sesion" ADD CONSTRAINT "sesion_clase_id_fkey" FOREIGN KEY ("clase_id") REFERENCES "clase"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sesion" ADD CONSTRAINT "sesion_instructor_id_fkey" FOREIGN KEY ("instructor_id") REFERENCES "usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sesion" ADD CONSTRAINT "sesion_sala_id_fkey" FOREIGN KEY ("sala_id") REFERENCES "sala"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "inscripcion" ADD CONSTRAINT "inscripcion_sesion_id_fkey" FOREIGN KEY ("sesion_id") REFERENCES "sesion"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "inscripcion" ADD CONSTRAINT "inscripcion_cliente_id_fkey" FOREIGN KEY ("cliente_id") REFERENCES "usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "asistencia" ADD CONSTRAINT "asistencia_inscripcion_id_fkey" FOREIGN KEY ("inscripcion_id") REFERENCES "inscripcion"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cita_personal" ADD CONSTRAINT "cita_personal_cliente_id_fkey" FOREIGN KEY ("cliente_id") REFERENCES "usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cita_personal" ADD CONSTRAINT "cita_personal_instructor_id_fkey" FOREIGN KEY ("instructor_id") REFERENCES "usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

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