"use client";

import { NuevaSesion } from "@/lib/type";
import { useState } from "react";

export function useSessionCreate() {
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState(false);

  const createSesion = async (nuevaSesion: NuevaSesion) => {
    setLoading(true);
    setError(null);
    setSuccess(false);

    try {
      const res = await fetch("/api/sesiones", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          claseId: Number(nuevaSesion.claseId),
          instructorId: Number(nuevaSesion.instructorId),
          fecha: nuevaSesion.fecha,
          horaInicio: `${nuevaSesion.fecha}T${nuevaSesion.horaInicio}:00Z`,
          horaFin: `${nuevaSesion.fecha}T${nuevaSesion.horaFin}:00Z`,
          cupoMaximo: nuevaSesion.cupoMaximo,
        }),
      });

      if (!res.ok) {
        const errorData = await res.json();
        throw new Error(errorData.error || "Error al crear sesión");
      }

      setSuccess(true);
    } catch (e) {
      setError(e instanceof Error ? e.message : "Error desconocido");
      throw e;
    } finally {
      setLoading(false);
    }
  };

  return { createSesion, loading, error, success };
}
