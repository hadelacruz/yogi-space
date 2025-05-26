"use client";

import { useGetSession } from '@/hooks/useGetSesion'

export default function ListaSesionesManager() {
  const { sesiones, loading, error } = useGetSession()
  

  if (loading) return <p>Cargando sesiones...</p>
  if (error) return <p>Error: {error}</p>

  return (
    <><ul>
      {sesiones.map((sesion) => (
        <li key={sesion.id}>
          {sesion.id} | {sesion.clase_id} |{sesion.fecha} | {sesion.cupo_maximo}
        </li>
      ))}
    </ul>
    </>
  )
}
