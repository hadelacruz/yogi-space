"use client";

import { useCallback, useEffect, useState } from "react";
import { SesionSummary } from "@/lib/type";

export function useSessionSummary() {
  const [sesiones, setSesiones] = useState<SesionSummary[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [refreshTrigger, setRefreshTrigger] = useState(0);

  const refreshData = useCallback(() => {
    setRefreshTrigger((prev) => prev + 1);
  }, []);

  useEffect(() => {
    const fetchSesiones = async () => {
      try {
        const res = await fetch("/api/summary");
        if (!res.ok) {
          throw new Error(`API request failed with status ${res.status}`);
        }
        const data: SesionSummary[] = await res.json();
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