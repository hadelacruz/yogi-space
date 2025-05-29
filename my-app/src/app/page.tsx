import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import TableSummary from "./components/sesion-summary";
import TableManager from "./components/sesion-manager";

export default function Page() {
  return (
    <Tabs defaultValue="manager" className="w-[400px]">
      <TabsList>
        <TabsTrigger value="manager">Manager</TabsTrigger>
        <TabsTrigger value="summary">Summary</TabsTrigger>
      </TabsList>
      {/*Este Component es de ejemplo, donde esta el diseño de la tabla y botones*/}
      <TabsContent value="manager"><TableManager /></TabsContent>
      <TabsContent value="summary"><TableSummary /></TabsContent>
    </Tabs>
  );
}
