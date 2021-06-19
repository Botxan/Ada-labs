with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Ver_Menores is
   type T_Vector is array (Positive range<>) of Integer;
   V: T_Vector(1..10);
   n: Integer;

   function Menores (V: T_Vector; n: Integer) return Integer is
   begin
      if V'Length = 0 then
         return 0;
      end if;
      if V(V'First) < n then
         return 1 + Menores(V(V'First+1..V'Last), n);
      else
         return Menores(V(V'First+1..V'Last), n);
      end if;
   end Menores;

begin
   Put_Line("Introduzca un vector de 10 enteros");
   for i in V'range loop
      get(V(i));
   end loop;
   Put_Line("Introduzca un numero con el que comparar");
   get(n);
   Put_Line("Cantidad de elementos menores: " & Menores(V, n)'img);
end Ver_Menores;