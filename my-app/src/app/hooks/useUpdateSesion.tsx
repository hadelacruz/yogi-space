"use client";

import { NuevaSesion } from "@/lib/type";
import { useState } from "react";

export function useUpdateSesion() {
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState(false);

  const updateSesion = async (id: number, sesionActualizada: NuevaSesion) => {
    setLoading(true);
    setError(null);
    setSuccess(false);

    try {
      const res = await fetch(`/api/sesiones/${id}`, {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          claseId: Number(sesionActualizada.claseId),
          instructorId: Number(sesionActualizada.instructorId),
          fecha: sesionActualizada.fecha,
          horaInicio: `${sesionActualizada.fecha}T${sesionActualizada.horaInicio}:00Z`,
          horaFin: `${sesionActualizada.fecha}T${sesionActualizada.horaFin}:00Z`,
          cupoMaximo: sesionActualizada.cupoMaximo,
        }),
      });

      if (!res.ok) {
        const errorData = await res.json();
        throw new Error(errorData.error || "Error al actualizar sesión");
      }

      setSuccess(true);
    } catch (e) {
      setError(e instanceof Error ? e.message : "Error desconocido");
      throw e;
    } finally {
      setLoading(false);
    }
  };

  return { updateSesion, loading, error, success };
}
