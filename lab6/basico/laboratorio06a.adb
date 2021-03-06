with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;

package body Laboratorio06a is

   --------------------
   -- esta_en_vector --
   --------------------

   function esta_en_vector
     (V: in T_vector_enteros;
      N: in Integer)
      return Boolean
   is
      esta: Boolean:= False; -- Inicializo sino los casos de prueba se vuelven locos
      i: Integer:= V'first;
   begin
      while not esta and i < V'Last+1 loop
         esta:= V(i) = n;
         i:= i + 1;
      end loop;
      return esta;
   end esta_en_vector;

   --------------
   -- posicion --
   --------------

   function posicion (V: in T_Vector_enteros; Num: in Integer) return Integer is
      pos: Integer := Integer'Last;
      i: Integer := V'First;
   begin
      while pos = Integer'Last and i /= V'Last+1 loop
         if (v(i) = num) then
            pos := i;
         end if;
         i := i + 1;
      end loop;

      return pos;

   end posicion;

   -----------------
   -- Son_Iguales --
   -----------------

   function Son_Iguales (F1, F2: in T_Fecha) return Boolean is
   begin
      return f1=f2;
   end Son_Iguales;

   ------------------
   -- Centesimales --
   ------------------

   function Centesimales (Grados: in T_Grados_Sex) return Float is
   begin
      return Float(Grados.Grados) * 100.0 / 90.0 + Float(Grados.Minutos) / 60.0 + Float(Grados.Segundos) / 3600.0;
   end Centesimales;

   -----------------
   -- Son_Iguales --
   -----------------

   function Son_Iguales (L1, L2: in T_vector_enteros) return Boolean is
      i: Integer := 0;
      son_iguales: Boolean := True;
   begin
      while son_iguales and (L1(i+1) /= VACIO or L2(i+1) /= VACIO) loop
         son_iguales := L1(L1'First + i) = L2(L2'First + i);
         i := i + 1;
      end loop;
      return son_iguales;
   end Son_Iguales;

   -----------------------
   -- eliminar_elemento --
   -----------------------

   procedure eliminar_elemento
     (pos: in Integer;
      V: in out T_vector_enteros)
   is
   begin
      tomas:= t_vector_enteros(-10..-5) := (2,4,6,8,0,2);
      if (V(V'First + pos - 1) /= VACIO) then
         V(V'First + pos - 1) := VACIO;
      end if;
   end eliminar_elemento;

   ------------------------------
   -- insertar_elemento_en_pos --
   ------------------------------

   procedure insertar_elemento_en_pos(num: in Integer; pos: in Integer; V: in out T_Vector_Enteros) is
      i: Natural := 0;
   begin
      while V'First+pos-1 /= V'Last-i loop
         V(V'Last-i) := V(V'Last-i-1);
         i := i + 1;
      end loop;
      V(V'FIrst+pos-1) := num;
   end insertar_elemento_en_pos;

   ----------------
   -- Pos_Maximo --
   ----------------

   function Pos_Maximo (V: in T_Vector_Enteros) return Integer is
      max_pos: Integer := 1;
      max_num: Integer:= V(V'First);
   begin
      for i in V'First..V'Last-1 loop
         if V(i+1) > max_num then
            max_num := V(i+1);
            max_pos := i+1;
         end if;
      end loop;
      return max_pos;
   end Pos_Maximo;

   -----------------------
   -- Ordenar_Seleccion --
   -----------------------

   procedure Ordenar_Seleccion(V: in out T_Vector_Enteros) is
      V2: T_Vector_Enteros := V; -- Vector espejo donde eliminamos los maximos
      temp, max_pos_v, max_pos_v2: Integer;
   begin
      for i in V'range loop
         -- Ordenar V2
         max_pos_v2 := pos_maximo(v2);

         temp := V2(i);
         V2(i) := V2(max_pos_v2);
         v2(max_pos_v2) := temp;

         -- Ordenar V
         temp := V(i);
         V(i) := V(max_pos_v2);
         v(max_pos_v2) := temp;

         -- Eliminar maximo de v2 para coger siguiente maximo
         V2(i) := VACIO;

      end loop;
   end ordenar_seleccion;

end Laboratorio06a;
