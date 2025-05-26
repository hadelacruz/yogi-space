"use client"

import { useState } from "react"

export function useSessionDelete() {
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [success, setSuccess] = useState(false)

  const deleteSesion = async (id: number) => {
    setLoading(true)
    setError(null)
    setSuccess(false)

    try {
      const res = await fetch(`/api/sesiones/${id}`, {
        method: "DELETE",
      })

      if (!res.ok) {
        throw new Error("No se pudo eliminar la sesión.")
      }

      setSuccess(true)
    } catch (e) {
      setError(e instanceof Error ? e.message : "Error desconocido");
    } finally {
      setLoading(false)
    }
  }

  return { deleteSesion, loading, error, success }
}
