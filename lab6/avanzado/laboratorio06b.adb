WITH Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
USE Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;

package body Laboratorio06b is

   ----------------
   -- Cent_A_Sex --
   ----------------

   procedure Cent_A_Sex
     (Centesimales: in Float;
      Sexagesimales:out T_Grados_Sex)
   is
      g, m, s: Natural;
   begin
      g:= Integer(Float'Truncation(Centesimales));
      m:= Integer((Centesimales - Float(g)) * 60.0);
      s:= Integer((Centesimales - Float(g) - Float(m)/60.0 )* 3600.0);
      sexagesimales := (g, m, s);
   end Cent_A_Sex;

   -------------------
   -- Rotar_Derecha --
   -------------------

   procedure Rotar_Derecha (V:in out T_Vector_Enteros) is
      ultimo:Integer := V(V'Last);
   begin
      for i in reverse V'First+1..V'Last loop
         V(i) := V(i-1);
      end loop;
      V(V'First) := ultimo;
   end Rotar_Derecha;

   -----------------------------
   -- esta_en_vector_ordenado --
   -----------------------------

   function esta_en_vector_ordenado(V: in T_vector_enteros; N: in Integer) return Boolean is
      i: Integer := V'first;
      n_encontrado: Boolean:= N = V(i);
   begin
      while (not n_encontrado) and (i /= V'last+1) loop
         n_encontrado:= N = V(i);
         i := i+1;
      end loop;

      return n_encontrado;
   end esta_en_vector_ordenado;

   --------------------------------
   -- eliminar_elemento_ordenado --
   --------------------------------

   procedure eliminar_elemento_ordenado
     (pos: in Integer;
      V: in out T_vector_enteros)
   is
      i: Integer := 1;
   begin
      if pos in V'range then
         -- Reordenar elementos (se borra el elemento en la posicion)
         for j in pos..V'Last-1 loop
            V(j) := V(j+1);
         end loop;
         -- Borrar el ultimo elemento del array (que sera basura)
         V(V'Last) := VACIO;
      end if;

   end eliminar_elemento_ordenado;

   --------------------------------
   -- insertar_elemento_ordenado --
   --------------------------------

   procedure insertar_elemento_ordenado (num:  in Integer; V: in out T_Vector_Enteros) is
      pos: Integer := 1;
      sitio_encontrado: Boolean := num <= V(V'First);
      cent_pos: Integer := 1;
   begin
      while not sitio_encontrado and V(V'First+pos-1) /= VACIO loop
         sitio_encontrado := num >= V(V'First+pos-1) and num <= V(V'First+pos);
         pos := pos + 1;
      end loop;

      -- Buscar la posicion del centinela
      while V(V'First+cent_pos-1) /= VACIO loop
         cent_pos := cent_pos + 1;
      end loop;

      --put("Loco, el rango es de " & Integer'Image(V'First+pos) & " - a - " & Integer'Image(V'First+cent_pos));

      -- Reorganizar el array desde el nuevo elemento hasta el centinela
      for i in reverse V'First+pos..V'First+cent_pos loop
         V(i) := V(i-1);
      end loop;

      -- Anadir el nuevo elemento a la lista
      V(V'First+pos-1) := num;
   end insertar_elemento_ordenado;

   ------------------------
   -- Eliminar_Repetidos --
   ------------------------

   procedure Eliminar_Repetidos (V: in out T_Vector_Enteros) is
      j: Integer;
   begin
      for i in V'range loop
         j := i;
         while j /= V'Last+1 loop
            if i /= j and V(j) /= VACIO and V(i) = V(j) then
               -- Slice para borrar elemento
               V(j..V'Last-1) := V(j+1..V'Last);
               V(V'Last) := VACIO;
            else
               j := j+1;
            end if;
         end loop;
      end loop;
   end Eliminar_Repetidos;

   ------------------------
   -- Letra_Mas_Repetida --
   ------------------------

   function Letra_Mas_Repetida (Texto: in T_Info_Texto) return T_LETRA is
      contadores: T_contadores_letras := (others => 0);
      letra: Character;
      p_cont, l_cont: Integer := 1;
      mas_repetida: Character := 'A';
   begin

      while p_cont+1 /= Texto.palabras'Last loop
         l_cont := 1;
         while l_cont+1 /= Texto.palabras(p_cont).Letras'Last and Texto.palabras(p_cont).Letras(l_cont) /= ' ' loop
            letra := Texto.palabras(p_cont).Letras(l_cont);
            if letra >= 'a' and letra <= 'z' then
               letra := Character'Val(Character'Pos(letra) - 32);
            end if;

            if letra >= 'A' and letra <= 'Z' then
               contadores(letra) := contadores(letra) + 1;
            end if;
            l_cont := l_cont + 1;
         end loop;
         p_cont := p_cont + 1;
      end loop;

      for i in reverse contadores'range loop
         if contadores(i) >= contadores(mas_repetida) then
            mas_repetida := i;
         end if;
      end loop;
      return mas_repetida;
   end Letra_Mas_Repetida;

   -----------------------
   -- Ordenar_Insercion --
   -----------------------

   procedure Ordenar_Insercion (V: in out T_Vector_Enteros) is
      V2: T_Vector_Enteros := V;
      j: Integer;
      pos: Integer;
      menor: Integer;
   begin
      -- Printeamos los minimos
      for i in V2'range loop
         menor:= Integer'Last;
         for j in V2'range loop
            if V2(j) /= Integer'Last and V2(j) <= menor then
               menor := V2(j);
               pos := j;
            end if;
         end loop;
         V2(pos) := Integer'Last;
         V(i) := menor;
      end loop;
   end Ordenar_Insercion;

   -----------------
   -- Es_Toeplitz --
   -----------------

   function Es_Toeplitz (M: T_Matriz) return Boolean is
      es_toplitz: Boolean:= True;
      row: Integer := M'First(1);
      col: Integer;
   begin
      if M'Length(1) = M'Length(2) then -- es cuadrada
         while es_toplitz and row /= M'Last(1) loop
            col:= M'First(2);
            while es_toplitz and col /= M'Last(2) loop
               if M(row, col) /= M(row+1, col+1) then
                  es_toplitz := False;
               end if;
               col := col + 1;
            end loop;
            row := row + 1;
         end loop;
      else
         es_toplitz := False;
      end if;

      return es_toplitz;
   end Es_Toeplitz;

end Laboratorio06b;
