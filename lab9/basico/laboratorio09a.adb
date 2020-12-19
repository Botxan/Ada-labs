package body Laboratorio09a is

   ----------
   -- Esta --
   ----------

   function Esta (L: in T_Lista_Dinamica; N: in Integer) return Boolean is
      -- Copiamos L para no sobreescribir su valor
      actual: T_Lista_Dinamica;
      encontrado: Boolean := False;
   begin
      actual := L;

      while not encontrado and actual /= null loop
         encontrado := actual.info = N;
         actual := actual.sig;
      end loop;

      return encontrado;
   end Esta;

   --------------
   -- Posicion --
   --------------

   function Posicion (L: in T_Lista_Dinamica; N: in Integer) return Natural is
      actual: T_Lista_Dinamica;
      pos: Integer := 0;
      encontrado: Boolean:= False;
   begin
      actual := L;

      while not encontrado and actual /= null loop
         pos := pos + 1;
         encontrado := actual.info = N;
         actual := actual.sig;
      end loop;

      if not encontrado then
         pos := Integer'Last;
      end if;
      return pos;
   end Posicion;

   ----------------------
   -- Insertar_Delante --
   ----------------------

   procedure Insertar_Delante (L: in out T_Lista_Dinamica; Num: Integer) is
   begin
      L := new T_Nodo_Enteros'(num, L);
   end Insertar_Delante;

   ---------------------
   -- Insertar_Detras --
   ---------------------

   procedure Insertar_Detras (L: in out T_Lista_Dinamica; Num: Integer) is
   begin
      if L = null then
         L := new T_Nodo_Enteros'(num, null);
      else
         Insertar_Detras(L.sig, num);
      end if;
   end Insertar_Detras;

   ------------------------------
   -- Insertar_Elemento_En_Pos --
   ------------------------------

   procedure Insertar_Elemento_En_Pos (L: in out T_Lista_Dinamica; Num: in Integer; Pos: in Integer) is
      actual: T_Lista_Dinamica;
      i: Integer := 1;
      pos_r: Integer := pos;
   begin
      -- Si la lista esta vacia
      if (pos_r <= 1 or L = null) then
         L := new T_Nodo_Enteros'(num, L);
      else
         actual := L;
         -- Iterar hasta la posicion y colocar el nuevo nodo
         while actual.sig /= null and i < pos_r-1 loop
            actual := actual.sig;
            i := i + 1;
         end loop;
         actual.sig := new T_Nodo_Enteros'(num, actual.sig);
      end if;
   end Insertar_Elemento_En_Pos;

   ------------
   -- Borrar --
   ------------

   procedure Borrar (L: in out T_Lista_Dinamica; Num: in Integer) is
   begin
      if L /= null then
         if L.info = num then
            L := L.sig;
         else
            borrar(L.sig, num);
         end if;
      end if;
   end Borrar;

   ----------------
   -- Concatenar --
   ----------------

   procedure Concatenar (L1, L2: in out T_Lista_Dinamica) is
   begin
      if L1 = null then
         L1 := L2;
      else
         if L1.sig = null then
            L1.sig := L2;
         else
            concatenar(L1.sig, L2);
         end if;
      end if;
   end Concatenar;

   --------------
   -- Invertir --
   --------------
   procedure Invertir (L: in out T_Lista_Dinamica) is
      previo, siguiente: T_Lista_Dinamica;
      actual: T_Lista_Dinamica := L;
   begin
      while actual /= null loop
         siguiente := actual.sig;
         actual.sig := previo;
         previo := actual;
         actual := siguiente;
      end loop;
      L := previo;
   end Invertir;

   -----------------
   -- Simplificar --
   -----------------

   procedure Simplificar (L: in out T_Lista_Puntos; Cuantos: out Natural) is
      L_aux: T_Lista_Puntos := L;
   begin
      cuantos := 0;
      if L_aux /= null then
         cuantos := cuantos + 1;
         if L_aux.sig /= null then
            cuantos := cuantos + 1;
            while L_aux.sig.sig /= null loop
               if (L_aux.info.x - L_aux.sig.info.x < 0.001 and L_aux.info.x - L_aux.sig.info.x > -0.001) and
                  (L_aux.info.y - L_aux.sig.info.y < 0.001 and L_aux.info.y - L_aux.sig.info.y > -0.001) then
                  L_aux.sig := L_aux.sig.sig;
               else
                  cuantos := cuantos + 1;
                  L_aux := L_aux.sig;
               end if;
            end loop;
         end if;
      end if;
   end Simplificar;

end Laboratorio09a;
