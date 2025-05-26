import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import ListaSesionesSummary from "./components/sesion-summary";
import ListaSesionesManager from "./components/sesion-manager";

export default function Page() {
  return (
    <Tabs defaultValue="manager" className="w-[400px]">
      <TabsList>
        <TabsTrigger value="manager">Manager</TabsTrigger>
        <TabsTrigger value="summary">Summary</TabsTrigger>
      </TabsList>
      <TabsContent value="manager"><ListaSesionesManager /></TabsContent>
      <TabsContent value="summary"><ListaSesionesSummary /></TabsContent>
    </Tabs>
  );
}
