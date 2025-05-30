"use client";

import { useSessionSummary } from "@/hooks/useGetSesionSummary";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";

export default function TableSummary() {
  const { sesiones, loading, error } = useSessionSummary();

  if (loading) return <p className="p-4">Cargando sesiones...</p>;
  if (error) return <p className="p-4 text-red-500">Error: {error}</p>;

  return (
    <>
      <h1 className="text-2xl font-bold mb-5">View Sesiones</h1>
      <div className="border rounded-lg overflow-hidden">
        <Table className="w-full">
          <TableHeader>
            <TableRow>
              <TableHead>ID</TableHead>
              <TableHead>Clase</TableHead>
              <TableHead>Instructor</TableHead>
              <TableHead>Fecha</TableHead>
              <TableHead>Hora Inicio</TableHead>
              <TableHead>Hora Fin</TableHead>
              <TableHead>Cupo</TableHead>
            </TableRow>
          </TableHeader>
          <TableBody>
            {sesiones.map((sesion) => (
              <TableRow key={sesion.sesion_id}>
                <TableCell className="font-medium">
                  {sesion.sesion_id}
                </TableCell>
                <TableCell>{sesion.clase_nombre}</TableCell>
                <TableCell>{sesion.instructor_nombre}</TableCell>
                <TableCell>{sesion.fecha.slice(0, 10)}</TableCell>
                <TableCell>{sesion.hora_inicio.slice(11, 16)}</TableCell>
                <TableCell>{sesion.hora_fin.slice(11, 16)}</TableCell>
                <TableCell>{sesion.cupo_maximo.replace("CUP_", "")}</TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </div>
    </>
  );
}
