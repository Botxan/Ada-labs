with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Ver_Vector_Prefijo is
   type T_Vector is array (Positive range<>) of Integer;
   V1: T_Vector(1..10);
   V2: T_Vector(1..5);

   function Vector_Prefijo (V1: T_Vector; V2: T_Vector) return Boolean is
   begin
      if V2'Length = 0 then
         return true;
      end if;
      if V1(V1'First) = V2(V2'First) then
         return Vector_Prefijo(V1(V1'First+1..V1'Last), V2(V2'First+1..V2'Last));
      end if;
      return false;
   end Vector_Prefijo;

begin
   Put_Line("Introduzca un vector de 10 enteros");
   for i in V1'range loop
      get(V1(i));
   end loop;
   new_line;
   Put_Line("Introduzca un vector de 5 enteros");
   for i in V2'range loop
      get(V2(i));
   end loop;
   Put_Line("Es el segundo vector prefijo del primero? " & Vector_Prefijo(V1, V2)'img);
end Ver_Vector_Prefijo;