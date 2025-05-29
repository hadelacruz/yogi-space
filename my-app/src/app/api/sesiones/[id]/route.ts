import { NextResponse } from "next/server";
import { prisma } from "@/lib/prisma";

// Eliminar sesión
export async function DELETE(
  request: Request,
  { params }: { params: { id: string } }
) {
  try {
    const sesionId = parseInt(params.id);
    await prisma.sesion.delete({
      where: { id: sesionId },
    });

    return NextResponse.json({ message: "Sesión eliminada con éxito" }, { status: 200 });
  } catch (error) {
    console.error(error);
    return NextResponse.json({ error: "No se pudo eliminar la sesión" }, { status: 500 });
  }
}

// Actualizar sesión
export async function PUT(
  request: Request,
  { params }: { params: { id: string } }
) {
  try {
    const sesionId = parseInt(params.id);
    const {
      fecha,
      horaInicio,
      horaFin,
      cupoMaximo,
      claseId,
      salaId,
      instructorId,
    } = await request.json();

    const sesionActualizada = await prisma.sesion.update({
      where: { id: sesionId },
      data: {
        fecha: new Date(fecha),
        horaInicio: new Date(horaInicio),
        horaFin: new Date(horaFin),
        cupoMaximo,
        claseId,
        salaId,
        instructorId,
      },
    });

    return NextResponse.json(sesionActualizada, { status: 200 });
  } catch (error) {
    console.error(error);
    return NextResponse.json(
      { error: "No se pudo actualizar la sesión", details: error },
      { status: 500 }
    );
  }
}