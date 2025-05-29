export type valorCupo = "10"| "20" | "30" | "40"

export interface SesionData {
  id: number
  claseId: number
  instructorId: number
  salaId: number
  fecha: string
  horaInicio: string
  horaFin: string
  cupoMaximo: string
}

export interface SesionSummary {
  sesion_id: number;
  clase_nombre: string;
  instructor_nombre: string;
  fecha: string;
  hora_inicio: string;
  hora_fin: string;
  cupo_maximo: string;
}

export interface NuevaSesion {
  claseId: number | string
  instructorId: number | string
  salaId: number | string
  fecha: string
  horaInicio: string
  horaFin: string
  cupoMaximo: string
}




