import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import TableSummary from "./components/sesion-summary";
import TableManager from "./components/sesion-manager";

export default function Page() {
  return (
    <div className="flex flex-col items-center w-full min-h-screen p-8 bg-gray-50">
      {/* Título centrado */}
      <h1 className="text-3xl font-bold mb-6 text-center">Gestión de Sesiones</h1>

      {/* Tabs centrados */}
      <Tabs defaultValue="manager" className="w-full max-w-5xl">
        <div className="flex justify-center">
          <TabsList className="mb-4">
            <TabsTrigger value="manager">Manager</TabsTrigger>
            <TabsTrigger value="summary">Summary</TabsTrigger>
          </TabsList>
        </div>

        {/* Contenido del tab */}
        <TabsContent value="manager">
          <div className="w-full">
            <TableManager />
          </div>
        </TabsContent>
        <TabsContent value="summary">
          <div className="w-full">
            <TableSummary />
          </div>
        </TabsContent>
      </Tabs>
    </div>
  );
}

