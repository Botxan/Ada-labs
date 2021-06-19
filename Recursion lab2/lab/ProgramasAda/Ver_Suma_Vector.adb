with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Ver_Suma_Vector is
   type T_Vector is array (Positive range<>) of Integer;
   V: T_Vector(1..10);

   function Suma_Vector (V: T_Vector) return Integer is
   begin
      if V'Length = 0 then
         return 0;
      end if;
      return V(V'First) + Suma_Vector(V(V'First+1..V'Last));
   end Suma_Vector;

begin
   Put_Line("Introduzca un vector de 10 enteros");
   for i in V'range loop
      get(V(i));
   end loop;
   Put_Line("La suma de todos los enteros del vector es: " & Suma_Vector(V)'img);


end Ver_Suma_Vector;