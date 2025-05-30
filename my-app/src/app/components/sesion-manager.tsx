"use client";

import { Edit, Trash2, Plus } from "lucide-react";
import { Button } from "@/components/ui/button";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { useEffect, useState } from "react";
import { useGetSession } from "@/hooks/useGetSesion";
import { useSessionCreate } from "@/hooks/useCreateSesion";
import { useSessionDelete } from "@/hooks/useDeleteSesion";
import { useUpdateSesion } from "@/hooks/useUpdateSesion";
import { AlertDemo } from "./alertDemo";

export default function TableManager() {
  const { sesiones, loading, error, refreshData } = useGetSession();
  const { createSesion } = useSessionCreate();
  const { deleteSesion } = useSessionDelete();
  const { updateSesion } = useUpdateSesion();
  const [errorMessage, setErrorMessage] = useState("");

  const [isModalOpen, setIsModalOpen] = useState(false);
  const [isEditing, setIsEditing] = useState(false);
  const [editId, setEditId] = useState<number | null>(null);

  const [formData, setFormData] = useState({
    claseId: "",
    instructorId: "",
    fecha: "",
    horaInicio: "",
    horaFin: "",
    cupoMaximo: "",
  });

  const handleInputChange = (field: string, value: string) => {
    setFormData((prev) => ({
      ...prev,
      [field]: value,
    }));
  };

  const handleDelete = async (id: number) => {
    const confirmar = window.confirm("¿Estás segura de eliminar esta sesión?");
    if (!confirmar) return;

    await deleteSesion(id);
    refreshData();
  };

  //Validación del lado del front
  const handleAddOrUpdateClass = async () => {
    const { claseId, instructorId, fecha, horaInicio, horaFin, cupoMaximo } =
      formData;

    if (
      !claseId ||
      !instructorId ||
      !fecha ||
      !horaInicio ||
      !horaFin ||
      !cupoMaximo
    ) {
      setErrorMessage("Por favor completa todos los campos.");
      return;
    }
    // Validar que la horaInicio sea menor que horaFin
    const inicio = new Date(`1970-01-01T${horaInicio}`);
    const fin = new Date(`1970-01-01T${horaFin}`);

    if (inicio >= fin) {
      setErrorMessage("La hora de inicio debe ser menor a la hora de fin.");
      return;
    }

    if (isEditing && editId !== null) {
      try {
        await updateSesion(editId, {
          claseId: Number(claseId),
          instructorId: Number(instructorId),
          fecha,
          horaInicio,
          horaFin,
          cupoMaximo,
        });
        alert("Sesión actualizada correctamente.");
      } catch {
        alert("Error: Ingresar datos válidos para actualizar una Sesión");
      }
    } else {
      try {
        await createSesion({
          claseId: Number(claseId),
          instructorId: Number(instructorId),
          fecha,
          horaInicio,
          horaFin,
          cupoMaximo,
        });
        alert("Sesión agregada correctamente.");
      } catch {
        alert("Error: Ingresar datos válidos para crear una nueva Sesión");
      }
    }

    refreshData();
    setIsModalOpen(false);
    setIsEditing(false);
    setEditId(null);
    setFormData({
      claseId: "",
      instructorId: "",
      fecha: "",
      horaInicio: "",
      horaFin: "",
      cupoMaximo: "",
    });
  };

  const handleEdit = (sesion: any) => {
    setFormData({
      claseId: String(sesion.claseId),
      instructorId: String(sesion.instructorId),
      fecha: sesion.fecha.split("T")[0],
      horaInicio: sesion.horaInicio.slice(11, 16),
      horaFin: sesion.horaFin.slice(11, 16),
      cupoMaximo: sesion.cupoMaximo,
    });
    setEditId(sesion.id);
    setIsEditing(true);
    setIsModalOpen(true);
  };

  useEffect(() => {
    if (errorMessage) {
      const timer = setTimeout(() => {
        setErrorMessage("");
      }, 3000);
      return () => clearTimeout(timer);
    }
  }, [errorMessage]);

  if (loading) return <p className="p-4">Cargando sesiones...</p>;
  if (error) return <p className="p-4 text-red-500">Error: {error}</p>;

  return (
    <div className="container mx-auto p-6">
      <div className="flex items-center justify-between mb-6">
        <h1 className="text-2xl font-bold">CRUD Sesiones</h1>
        <Dialog open={isModalOpen} onOpenChange={setIsModalOpen}>
          <DialogTrigger asChild>
            <Button
              className="flex items-center gap-2"
              onClick={() => {
                setIsEditing(false);
                setFormData({
                  claseId: "",
                  instructorId: "",
                  fecha: "",
                  horaInicio: "",
                  horaFin: "",
                  cupoMaximo: "",
                });
              }}
            >
              <Plus className="h-4 w-4" />
              Agregar Sesión
            </Button>
          </DialogTrigger>
          <DialogContent className="sm:max-w-[425px]">
            <DialogHeader>
              <DialogTitle>
                {isEditing ? "Editar Sesión" : "Agregar Nueva Sesión"}
              </DialogTitle>
            </DialogHeader>

            {errorMessage && (
              <AlertDemo title="Error" description={errorMessage} />
            )}

            <div className="grid gap-4 py-4">
              {[
                { id: "claseId", label: "ID Clase" },
                { id: "instructorId", label: "ID Instructor" },
                { id: "fecha", label: "Fecha", type: "date" },
                { id: "horaInicio", label: "Hora Inicio", type: "time" },
                { id: "horaFin", label: "Hora Fin", type: "time" },
              ].map(({ id, label, type = "text" }) => (
                <div key={id} className="grid grid-cols-4 items-center gap-4">
                  <Label htmlFor={id} className="text-right">
                    {label}
                  </Label>
                  <Input
                    id={id}
                    type={type}
                    value={formData[id as keyof typeof formData]}
                    onChange={(e) => handleInputChange(id, e.target.value)}
                    placeholder={
                      id === "instructorId"
                        ? "Ingrese valores del 1-10"
                        : id === "claseId"
                        ? "Ingrese valores del 1-10"
                        : undefined
                    }
                    className="col-span-3"
                  />
                </div>
              ))}
              <div className="grid grid-cols-4 items-center gap-4">
                <Label htmlFor="cupoMaximo" className="text-right">
                  Cupo Máximo
                </Label>
                <select
                  id="cupoMaximo"
                  value={formData.cupoMaximo}
                  onChange={(e) =>
                    handleInputChange("cupoMaximo", e.target.value)
                  }
                  className="col-span-3 border rounded-md p-2 text-sm"
                >
                  <option value="">Selecciona un cupo</option>
                  <option value="CUP_10">10</option>
                  <option value="CUP_20">20</option>
                  <option value="CUP_30">30</option>
                  <option value="CUP_40">40</option>
                </select>
              </div>
            </div>
            <div className="flex justify-end gap-2">
              <Button variant="outline" onClick={() => setIsModalOpen(false)}>
                Cancelar
              </Button>
              <Button onClick={handleAddOrUpdateClass}>
                {isEditing ? "Actualizar Sesión" : "Agregar Sesión"}
              </Button>
            </div>
          </DialogContent>
        </Dialog>
      </div>

      <div className="border rounded-lg overflow-hidden">
        <Table className="w-full">
          <TableHeader>
            <TableRow>
              <TableHead className="w-[80px]">ID</TableHead>
              <TableHead>ID Clase</TableHead>
              <TableHead>ID Instructor</TableHead>
              <TableHead>Fecha</TableHead>
              <TableHead>Hora Inicio</TableHead>
              <TableHead>Hora Fin</TableHead>
              <TableHead>Cupo</TableHead>
              <TableHead className="w-[120px]">Acciones</TableHead>
            </TableRow>
          </TableHeader>
          <TableBody>
            {sesiones.map((sesion) => (
              <TableRow key={sesion.id}>
                <TableCell className="font-medium">{sesion.id}</TableCell>
                <TableCell>{sesion.claseId}</TableCell>
                <TableCell>{sesion.instructorId}</TableCell>
                <TableCell>{sesion.fecha.split("T")[0]}</TableCell>
                <TableCell>{sesion.horaInicio.slice(11, 16)}</TableCell>
                <TableCell>{sesion.horaFin.slice(11, 16)}</TableCell>
                <TableCell>{sesion.cupoMaximo.replace("CUP_", "")}</TableCell>
                <TableCell>
                  <div className="flex items-center gap-2">
                    <Button
                      variant="ghost"
                      size="icon"
                      onClick={() => handleEdit(sesion)}
                      className="h-8 w-8 hover:bg-blue-100 hover:text-blue-600"
                    >
                      <Edit className="h-4 w-4" />
                      <span className="sr-only">Editar clase</span>
                    </Button>
                    <Button
                      variant="ghost"
                      size="icon"
                      onClick={() => handleDelete(sesion.id)}
                      className="h-8 w-8 hover:bg-red-100 hover:text-red-600"
                    >
                      <Trash2 className="h-4 w-4" />
                      <span className="sr-only">Eliminar clase</span>
                    </Button>
                  </div>
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </div>
    </div>
  );
}
