'use client'

import { useSessionSummary } from '@/hooks/useGetSesionSummary'

export default function ListaSesionesSummary() {
  const { sesiones, loading, error } = useSessionSummary()

  if (loading) return <p>Cargando sesiones...</p>
  if (error) return <p>Error: {error}</p>

  return (
    <ul>
      {sesiones.map((sesion) => (
        <li key={sesion.sesion_id}>
          {sesion.fecha} | {sesion.hora_inicio} - {sesion.hora_fin} | Clase: {sesion.clase_nombre} | Instructor: {sesion.instructor_nombre} | Cupo: {sesion.cupo_maximo}
        </li>
      ))}
    </ul>
  )
}
