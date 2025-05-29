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
          salaId: Number(nuevaSesion.salaId),
          fecha: nuevaSesion.fecha,
          horaInicio: `${nuevaSesion.fecha}T${nuevaSesion.horaInicio}`,
          horaFin: `${nuevaSesion.fecha}T${nuevaSesion.horaFin}`,
          cupoMaximo: nuevaSesion.cupoMaximo,
        }),
      });

      if (!res.ok) {
        throw new Error(`Error al crear sesión: ${res.status}`);
      }

      setSuccess(true);
    } catch (e) {
      setError(e instanceof Error ? e.message : "Error desconocido");
    } finally {
      setLoading(false);
    }
  };

  return { createSesion, loading, error, success };
}
