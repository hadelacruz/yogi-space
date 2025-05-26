import { NextResponse } from "next/server";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export async function GET() {
  try {
    const sesiones = await prisma.$queryRaw`
      SELECT * FROM vista_sesiones_detalle
    `;
    return NextResponse.json(sesiones);
  } catch (error) {
    return NextResponse.json(
      { error: "Error al obtener sesiones", details: error },
      { status: 500 }
    );
  }
}
