with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Ver_Escribir_Mismo_Orden is
   type T_Vector is array (Positive range<>) of Integer;
   V: T_Vector(1..10);

   procedure Escribir_Mismo_Orden (V: T_Vector) is
   begin
      if V'Length /= 0 then
         put(V(V'First));
         Escribir_Mismo_Orden(V(V'First+1..V'Last));
      end if;
   end Escribir_Mismo_Orden;

begin
   Put_Line("Introduzca un vector de 10 enteros");
   for i in V'range loop
      get(V(i));
   end loop;
   Put_Line("El vector introducido es: ");
   Escribir_Mismo_Orden(V);
end Ver_Escribir_Mismo_Orden;