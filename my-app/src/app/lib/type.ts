export type valorCupo = "10"| "20" | "30" | "40"

export interface SesionData {
  id: number;
  fecha: string;
  hora_inicio: string;
  hora_fin: string;
  cupo_maximo: valorCupo;
  clase_id: number;
  sala_id: number;
  instructor_id: number;
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
  fecha: string;
  hora_inicio: string;
  hora_fin: string;
  cupo_maximo: string;
  clase_id: number;
  sala_id: number;
  instructor_id: number;
}




