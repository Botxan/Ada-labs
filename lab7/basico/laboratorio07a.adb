with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;

package body Laboratorio07a is

   ----------
   -- esta --
   ----------

   function esta (L: in T_Lista_Estatica; N: in Integer) return Boolean is
      i: Positive := 1;
      encontrado: Boolean := False;
   begin
      while not encontrado and i /= L.cont+1 loop
         encontrado := L.Dato(L.Dato'First + i - 1) = N;
         i := i + 1;
      end loop;
      return encontrado;
   end esta;

   --------------
   -- posicion --
   --------------

   function posicion (L: in T_Lista_Estatica; Num: in Integer) return Integer is
      i: Positive := 1;
      encontrado: Boolean;
   begin
      loop
         encontrado := L.Dato(L.Dato'First + i - 1) = Num;
         exit when encontrado or i = L.cont+1;
         i := i + 1;
      end loop;

      if not encontrado then
         i := Integer'Last;
      end if;

      return i;
   end posicion;

   -----------
   -- Polar --
   -----------

   function Polar (C: in T_Complejo_tri) return T_complejo_polar is
   begin
      return (abs(sqrt(C.A**2 + C.B**2)), arctan(C.B/C.A));
   end Polar;

   -----------------
   -- Son_Iguales --
   -----------------

   function Son_Iguales (L1, L2: in T_Lista_Estatica) return Boolean is
      iguales: Boolean := True;
      i: Integer :=  1;
   begin
      if L1.Cont = L2.Cont then
         while iguales and i /= L1.cont+1 loop
            iguales := L1.Dato(i) = L2.Dato(i);
            i := i + 1;
         end loop;
      end if;

      return iguales;
   end Son_Iguales;

   -----------------------
   -- eliminar_elemento --
   -----------------------

   procedure eliminar_elemento
     (num: in Integer;
      L: in out T_Lista_Estatica)
   is
   begin
      for i in 1..L.Cont loop
         if L.Dato(L.Dato'First+i-1) = num then
            L.Dato(L.Dato'First+i-1) := Integer'First;
         end if;
      end loop;
   end eliminar_elemento;

   ------------------------------
   -- insertar_elemento_en_pos --
   ------------------------------

   procedure insertar_elemento_en_pos
     (num, pos: in Integer;
      L: in out T_Lista_Estatica)
   is
   begin
      if pos in 1..L.cont+1 then
         -- Slice de los elementos n+1
         L.Dato(L.Dato'First+pos..L.Dato'First+L.cont+1) := L.Dato(L.Dato'First+pos-1..L.Dato'First+L.cont);
         L.Dato(L.Dato'First+pos-1) := num;
      end if;
   end insertar_elemento_en_pos;

   ----------------
   -- Pos_Maximo --
   ----------------

   function Pos_Maximo (L: in T_Lista_Estatica) return Integer is
      maximo_i: Integer:= L.Dato'First;
   begin
      for i in L.Dato'First+1..L.Dato'First+L.cont-1 loop
         if L.Dato(i) > L.Dato(maximo_i) then
            maximo_i := i;
         end if;
      end loop;

      return maximo_i;
   end Pos_Maximo;

   ---------------------
   -- Ordenar_Burbuja --
   ---------------------

   procedure Ordenar_Burbuja (L: in out T_Lista_Estatica) is
      L2: T_Lista_Estatica := L;
   begin
      for i in L.Dato'First..L.Dato'First+L.cont-1 loop
         L.Dato(i) := L2.Dato(pos_maximo(L2));
         L2.Dato(pos_maximo(L2)) := Integer'First;
      end loop;

   end Ordenar_Burbuja;

   --------------
   -- Posicion --
   --------------

   procedure Posicion
     (M: in T_Matriz;
      Num: in Integer;
      Fil,Col: out Integer)
   is
      i, j: Integer := 1;
      encontrado : Boolean := False;
   begin
      while not encontrado and i < M'Length(1)+1 loop
         j := 1;
         while not encontrado and j < M'Length(2)+1 loop
            encontrado := M(M'First(1)+i-1,M'First(2)+j-1) = num;
            j := j + 1;
         end loop;
         i := i + 1;
      end loop;

      if encontrado then
         Fil:= i-1;
         Col:= j-1;
      else
         Fil := 0;
         Col := 0;
      end if;
   end Posicion;

   ------------
   -- Maximo --
   ------------

   procedure Maximo (M: in T_Matriz; Maximo,Fila,Columna: out Integer) is
      i: Integer := M'Length(1);
      j: Integer := M'Length(2);
   begin
      maximo := Integer'First;

      while i > 0 loop
         j := M'Length(2);
         while j > 0 loop
            if M(M'first(1)+i-1, M'First(2)+j-1) >= maximo then
               maximo := M(M'first(1)+i-1, M'First(2)+j-1);
               fila := i;
               columna := j;
            end if;
            j := j - 1;
         end loop;
         i := i - 1;
      end loop;

      -- Caso especial: toda la matriz es de integer'first
      if maximo = Integer'First then
         fila := M'Last(1);
         columna := M'Last(2);
      end if;

   end Maximo;

end Laboratorio07a;
