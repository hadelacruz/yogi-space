import { NextResponse } from "next/server";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export async function POST(req: Request) {
  const data = await req.json();

  const { fecha, horaInicio, horaFin, cupoMaximo, claseId, instructorId } =
    data;

  try {
    const sesion = await prisma.sesion.create({
      data: {
        fecha: new Date(fecha),
        horaInicio: new Date(horaInicio),
        horaFin: new Date(horaFin),
        cupoMaximo,
        claseId,
        instructorId,
      },
    });

    return NextResponse.json(sesion, { status: 201 });
  } catch (error: unknown) {
    console.error(error);

    const mensaje =
      error instanceof Error
        ? error.message
        : "Datos inválidos. Verifica los campos e intenta de nuevo.";

    return NextResponse.json({ error: mensaje }, { status: 500 });
  }
}
export async function GET() {
  try {
    const sesiones = await prisma.sesion.findMany({
      orderBy: {
        id: 'asc',
      },
      include: {
        clase: {
          select: { nombre: true },
        },
        instructor: {
          select: { nombre: true },
        },
      },
    });

    return NextResponse.json(sesiones);
  } catch (error) {
    return NextResponse.json(
      { error: "Error al obtener sesiones", details: error },
      { status: 500 }
    );
  }
}
