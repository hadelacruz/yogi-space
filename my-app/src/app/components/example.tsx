"use client"

import { Edit, Trash2, Plus } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table"
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogTrigger } from "@/components/ui/dialog"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { useState } from "react"

export default function Component() {
  const classes = [
    {
      id: 1,
      class: "Yoga Matutino",
      instructor: "María González",
      date: "2024-01-15",
      time_start: "08:00",
      time_end: "09:30",
    },
    {
      id: 2,
      class: "Pilates Intermedio",
      instructor: "Carlos Rodríguez",
      date: "2024-01-15",
      time_start: "10:00",
      time_end: "11:00",
    },
    {
      id: 3,
      class: "Spinning",
      instructor: "Ana López",
      date: "2024-01-15",
      time_start: "18:00",
      time_end: "19:00",
    },
    {
      id: 4,
      class: "Crossfit",
      instructor: "Miguel Torres",
      date: "2024-01-16",
      time_start: "07:00",
      time_end: "08:00",
    },
    {
      id: 5,
      class: "Zumba",
      instructor: "Laura Martín",
      date: "2024-01-16",
      time_start: "19:30",
      time_end: "20:30",
    },
  ]

  const [isModalOpen, setIsModalOpen] = useState(false)
  const [formData, setFormData] = useState({
    class: "",
    instructor: "",
    date: "",
    time_start: "",
    time_end: "",
  })

  const handleInputChange = (field: string, value: string) => {
    setFormData((prev) => ({
      ...prev,
      [field]: value,
    }))
  }

  const handleAddClass = () => {
    console.log("Agregar nueva clase:", formData)
    // Aquí puedes agregar la lógica para agregar la nueva clase
    setIsModalOpen(false)
    setFormData({
      class: "",
      instructor: "",
      date: "",
      time_start: "",
      time_end: "",
    })
  }

  const handleEdit = (id: number) => {
    console.log(`Editar clase con ID: ${id}`)
    // Aquí puedes agregar la lógica para editar
  }

  const handleDelete = (id: number) => {
    console.log(`Eliminar clase con ID: ${id}`)
    // Aquí puedes agregar la lógica para eliminar
  }

  return (
    <div className="container mx-auto p-6">
      <div className="flex items-center justify-between mb-6">
        <h1 className="text-2xl font-bold">Horario de Clases</h1>
        <Dialog open={isModalOpen} onOpenChange={setIsModalOpen}>
          <DialogTrigger asChild>
            <Button className="flex items-center gap-2">
              <Plus className="h-4 w-4" />
              Agregar Sesión
            </Button>
          </DialogTrigger>
          <DialogContent className="sm:max-w-[425px]">
            <DialogHeader>
              <DialogTitle>Agregar Nueva Sesión</DialogTitle>
            </DialogHeader>
            <div className="grid gap-4 py-4">
              <div className="grid grid-cols-4 items-center gap-4">
                <Label htmlFor="class" className="text-right">
                  Clase
                </Label>
                <Input
                  id="class"
                  value={formData.class}
                  onChange={(e) => handleInputChange("class", e.target.value)}
                  className="col-span-3"
                  placeholder="Nombre de la clase"
                />
              </div>
              <div className="grid grid-cols-4 items-center gap-4">
                <Label htmlFor="instructor" className="text-right">
                  Instructor
                </Label>
                <Input
                  id="instructor"
                  value={formData.instructor}
                  onChange={(e) => handleInputChange("instructor", e.target.value)}
                  className="col-span-3"
                  placeholder="Nombre del instructor"
                />
              </div>
              <div className="grid grid-cols-4 items-center gap-4">
                <Label htmlFor="date" className="text-right">
                  Fecha
                </Label>
                <Input
                  id="date"
                  type="date"
                  value={formData.date}
                  onChange={(e) => handleInputChange("date", e.target.value)}
                  className="col-span-3"
                />
              </div>
              <div className="grid grid-cols-4 items-center gap-4">
                <Label htmlFor="time_start" className="text-right">
                  Hora Inicio
                </Label>
                <Input
                  id="time_start"
                  type="time"
                  value={formData.time_start}
                  onChange={(e) => handleInputChange("time_start", e.target.value)}
                  className="col-span-3"
                />
              </div>
              <div className="grid grid-cols-4 items-center gap-4">
                <Label htmlFor="time_end" className="text-right">
                  Hora Fin
                </Label>
                <Input
                  id="time_end"
                  type="time"
                  value={formData.time_end}
                  onChange={(e) => handleInputChange("time_end", e.target.value)}
                  className="col-span-3"
                />
              </div>
            </div>
            <div className="flex justify-end gap-2">
              <Button variant="outline" onClick={() => setIsModalOpen(false)}>
                Cancelar
              </Button>
              <Button onClick={handleAddClass}>Agregar Sesión</Button>
            </div>
          </DialogContent>
        </Dialog>
      </div>

      <div className="border rounded-lg overflow-hidden">
        <Table className="w-full">
          <TableHeader>
            <TableRow>
              <TableHead className="w-[80px]">ID</TableHead>
              <TableHead>Clase</TableHead>
              <TableHead>Instructor</TableHead>
              <TableHead>Fecha</TableHead>
              <TableHead>Hora Inicio</TableHead>
              <TableHead>Hora Fin</TableHead>
              <TableHead className="w-[120px]">Acciones</TableHead>
            </TableRow>
          </TableHeader>
          <TableBody>
            {classes.map((classItem) => (
              <TableRow key={classItem.id}>
                <TableCell className="font-medium">{classItem.id}</TableCell>
                <TableCell>{classItem.class}</TableCell>
                <TableCell>{classItem.instructor}</TableCell>
                <TableCell>{classItem.date}</TableCell>
                <TableCell>{classItem.time_start}</TableCell>
                <TableCell>{classItem.time_end}</TableCell>
                <TableCell>
                  <div className="flex items-center gap-2">
                    <Button
                      variant="ghost"
                      size="icon"
                      onClick={() => handleEdit(classItem.id)}
                      className="h-8 w-8 hover:bg-blue-100 hover:text-blue-600"
                    >
                      <Edit className="h-4 w-4" />
                      <span className="sr-only">Editar clase</span>
                    </Button>
                    <Button
                      variant="ghost"
                      size="icon"
                      onClick={() => handleDelete(classItem.id)}
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
  )
}
