import { NextResponse } from "next/server"
import { prisma } from "@/lib/prisma"

export async function DELETE(
  request: Request,
  { params }: { params: { id: string } }
) {
  try {
    const sesionId = parseInt(params.id)
    await prisma.sesion.delete({
      where: { id: sesionId },
    })

    return NextResponse.json({ message: "Sesión eliminada con éxito" }, { status: 200 })
  } catch (error) {
    console.error(error);
    return NextResponse.json({ error: "No se pudo eliminar la sesión" }, { status: 500 })
  }
}
