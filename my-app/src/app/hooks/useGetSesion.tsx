"use client";

import { useCallback, useEffect, useState } from "react";
import { SesionData } from "@/lib/type";


export function useGetSession() {
  const [sesiones, setSesiones] = useState<SesionData[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [refreshTrigger, setRefreshTrigger] = useState(0);

  const refreshData = useCallback(() => {
    setRefreshTrigger((prev) => prev + 1);
  }, []);

  useEffect(() => {
    const fetchSesiones = async () => {
      try {
        const res = await fetch("/api/sesiones");
        if (!res.ok) {
          throw new Error(`API request failed with status ${res.status}`);
        }
        const data: SesionData[] = await res.json();
        setSesiones(data);
      } catch (e) {
        if (e instanceof Error) {
          setError(e.message);
        } else {
          setError("An unknown error occurred while fetching reservations.");
        }
        setSesiones([]);
      } finally {
        setLoading(false);
      }
    };

    fetchSesiones();
  }, [refreshTrigger]);

  return { sesiones, loading, error, refreshData };
}
