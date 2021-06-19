with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Ver_Escribir_Orden_Inverso is
   type T_Vector is array (Positive range<>) of Integer;
   V: T_Vector(1..10);

   procedure Escribir_Orden_Inverso (V: T_Vector) is
   begin
      if V'Length /= 0 then
         put(V(V'Last));
         Escribir_Orden_Inverso(V(V'First..V'Last-1));
      end if;
   end Escribir_Orden_Inverso;

begin
   Put_Line("Introduzca un vector de 10 enteros");
   for i in V'range loop
      get(V(i));
   end loop;
   Put_Line("El vector introducido en orden inverso es: ");
   Escribir_Orden_Inverso(V);
end Ver_Escribir_Orden_Inverso;