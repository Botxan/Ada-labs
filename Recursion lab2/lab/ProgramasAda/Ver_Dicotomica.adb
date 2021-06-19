with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Ver_Dicotomica is

   type T_Vector is array (Positive range <>) of Integer;

   Vector: T_Vector (1..10);
   I: Integer;

   function Dicotomica (Vector: T_Vector; N:Integer) return Integer is
      medio: Integer := (Vector'First + Vector'Last) / 2;
   begin
      if Vector'Length = 0 then
         return -1;
      elsif N = Vector(medio) then
         return medio;
      elsif N < Vector(medio) then
         return Dicotomica(Vector(Vector'First..medio-1), N);
      else
         return Dicotomica(Vector(medio+1..Vector'Last), N);
      end if;
   end Dicotomica;


begin
   Put_Line ("Dame un vector ordenado de menor a mayor de 10 enteros, un entero Por linea:");
   for J in Vector'range loop
      Get(Vector(J));
   end loop;
   Put_Line ("Dame un entero a buscar:");
   Get (I);
   Put_line ("La posicion del entero a buscar es:");
   Put (Dicotomica(Vector,I));
end Ver_Dicotomica;
