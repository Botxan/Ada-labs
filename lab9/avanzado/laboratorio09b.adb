package body Laboratorio09b is

   -----------
   -- Media --
   -----------

   function Media (L: in T_Lista_Dinamica) return Float is
      suma, contador: Integer := 0;
      L_aux: T_Lista_Dinamica := L;
      media: Float := Float'Last;
   begin
      if L /= null then
         media := 0.0;
         while L_aux /= null loop
            suma := suma + L_aux.info;
            contador := contador + 1;
            L_aux := L_aux.sig;
         end loop;
         media := Float(suma) / Float(contador);
      end if;
      return media;
   end Media;

   ------------
   -- Maximo --
   ------------

   procedure Maximo (L: in T_Lista_Dinamica; Max, pos: out Integer) is
      L_aux: T_Lista_Dinamica := L;
      i: Integer := 1;
   begin
      max := Integer'First;
      pos := 0;
      if L_aux /= null then
         while L_aux /= null loop
            if L_aux.info > max then
               max := L_aux.info;
               pos := i;
            end if;
            i := i + 1;
            L_aux := L_aux.sig;
         end loop;
      end if;
   end Maximo;

   --------------
   -- Insertar --
   --------------

   procedure Insertar (L: in out T_Lista_Dinamica; Num: in Integer) is
      L_aux: T_Lista_Dinamica := L;
      --nuevo: T_Lista_Dinamica := new T_Nodo_Enteros(num, null);
   begin
      -- Comprobar que la lista no este vacia
      if L_aux /= null then
         -- Si la insercion es en la primera posicion
         if num < L_aux.info then
            L_aux := new T_Nodo_Enteros'(num, L_aux);
            L := L_aux;
         else
            -- Recorrer lista hasta que el siguiente sea menor o se llegue al ultimo
            while L_aux.sig /= null and then num > L_aux.sig.info loop
               L_aux := L_aux.sig;
            end loop;
            L_aux.sig := new T_Nodo_Enteros'(num, L_aux.sig);
         end if;
      else
         L := new T_Nodo_Enteros'(num, null);
      end if;

   end Insertar;

   -------------------------
   -- Clonar_y_Concatenar --
   -------------------------

   procedure Clonar_y_Concatenar (L1,L2: in T_Lista_Dinamica; L: out T_Lista_Dinamica) is
      L1_aux: T_Lista_Dinamica := L1; -- Para no perder L1
      L2_aux: T_Lista_Dinamica := L2; -- Para no perder L2
      L_aux: T_Lista_Dinamica;
   begin
      if L1_aux /= null or L2_aux /= null then
         if L1_aux /= null then
            L_aux := new T_Nodo_Enteros'(L1_aux.all);
            L := L_aux;
            while L1_aux.sig /= null loop
               L1_aux := L1_aux.sig;
               L_aux.sig := new T_Nodo_Enteros'(L1_aux.all);
               L_aux := L_aux.sig;
            end loop;
         end if;

         if L2_aux /= null then
            if L_aux = null then
               -- Inicializar L y L_aux si L1 null
               L_aux := new T_Nodo_Enteros'(L2_aux.all);
               L := L_aux;
            else
               L_aux.sig := new T_Nodo_Enteros'(L2_aux.all);
               L_aux := L_aux.sig;
            end if;
            while L2_aux.sig /= null loop
               L2_aux := L2_aux.sig;
               L_aux.sig := new T_Nodo_Enteros'(L2_aux.all);
               L_aux := L_aux.sig;
            end loop;
         end if;
      end if;
   end Clonar_y_Concatenar;

   ------------
   -- Borrar --
   ------------

   procedure Borrar (L: in out T_Lista_Dinamica; Num: Integer) is
   begin
      -- Comprobar que la lista no esta vacia
      if L /= null then
         -- Si el primer valor coincide con el numero, borrarlo
         if L.info = num then
            L := L.sig;
            borrar(L, num);
         else
            -- Si el numero al cual se apunta coincide con el numero, apuntar al siguiente
            if L.sig /= null and then L.sig.info = num then
               L.sig := L.sig.sig;
            else
               borrar(L.sig, num);
            end if;
         end if;
      end if;
   end Borrar;

   ------------------
   -- Interseccion --
   ------------------

   procedure Interseccion
     (L1,L2: in out T_Lista_Dinamica;
      Comunes, NoComunes: out T_Lista_Dinamica)
   is
      comunes_aux, noComunes_aux: T_Lista_Dinamica;
   begin
      comunes := new T_Nodo_Enteros'(0, null);
      comunes_aux := comunes;
      noComunes:= new T_Nodo_Enteros'(0, null);
      noComunes_aux := noComunes;

      -- Comprobar los comune y no comunes hasta que una de las dos listas llegue al final
      while L1 /= null and L2 /= null loop
         if L1.info = L2.info then
            comunes_aux.sig := L1;
            L1 := L1.sig;
            comunes_aux.sig.sig := L2;
            L2 := L2.sig;
            comunes_aux:= comunes_aux.sig.sig;
         elsif L1.info < L2.info then
            noComunes_aux.sig := L1;
            L1 := L1.sig;
            noComunes_aux := noComunes_aux.sig;
         else
            noComunes_aux.sig := L2;
            L2 := L2.sig;
            noComunes_aux := noComunes_aux.sig;
         end if;
      end loop;

      -- Si alguna de las dos listas no ha sido recorrida entera, terminarla
      if L1 /= null then
         while L1 /= null loop
            noComunes_aux.sig := L1;
            L1 := L1.sig;
            noComunes_aux := noComunes_aux.sig;
         end loop;
      elsif L2 /= null then
         while L2 /= null loop
            noComunes_aux.sig := L2;
            L2 := L2.sig;
            noComunes_aux := noComunes_aux.sig;
         end loop;
      end if;

      -- Eliminar los restantes de L1/L2 de comunes
      if comunes_aux /= null and then comunes_aux.sig /= null then
         comunes_aux.sig := null;
      end if;
      comunes := comunes.sig;
      noComunes := noComunes.sig;
   end Interseccion;

   -----------------
   -- Son_iguales --
   -----------------

   function Son_iguales (L1,L2: in T_Lista_Dinamica) return Boolean is
   begin
      -- Final de ambas listas
      if L1 = null and L2 = null then
         return True;
      end if;

      if L1 /= null and L2 /= null then
         return son_iguales(L1.sig, L2.sig);
      else
         return False;
      end if;
   end Son_iguales;

   -----------------
   -- Simplificar --
   -----------------

   procedure Simplificar (L: in out T_lista_Puntos; Cuantos: out Natural) is
      L_aux: T_Lista_Puntos:= L;
   begin
      cuantos := 0;
      if L_aux /= null then -- Al menos 1 elemento
         cuantos := cuantos + 1;
         if L_aux.sig /= null then -- Al menos 2 elementos

            -- Comprobar posiciones de 4 en 4
            while L_aux.sig /= null and then L_aux.sig.sig /= null and then L_aux.sig.sig.sig /= null and then L_aux.sig.sig.sig.sig /= null loop
               L_aux.sig:= L_aux.sig.sig.sig.sig;
               L_aux := L_aux.sig;
               cuantos := cuantos + 1;
            end loop;

            -- Modificar lista para los 4 ultimos casos
            if L_aux.sig /= null then
               cuantos := cuantos + 1;
               while L_aux.sig /= null and then L_aux.sig.sig /= null loop
                  L_aux.sig := L_aux.sig.sig;
               end loop;
            end if;
         end if;
      end if;
   end Simplificar;

   -------------------------
   -- Crear_Arbol_Binario --
   -------------------------
   procedure Crear_Arbol_Binario
     (V:in T_Vector_Enteros;
      A:out T_Arbol_Binario)
   is
      -- Puntero que construye el arbol
      nodo: T_Arbol_Binario;
      encontrado: Boolean := False;
   begin
      if V'length > 0 then
         -- Raiz
         A := new T_Nodo_Arbol'(V(V'first), null, null);
         nodo := A;

         -- Iterar sobre todos los elementos del vector excepto la raiz
         for i in V'first+1..V'last loop
               --put_line("Insertar numero " & V(i)'img & " en el arbol.");
               encontrado := False;
               while not encontrado loop
                  --put_line("-Intento de insercion-");
                  if V(i) < nodo.info then -- V(i) es menor
                     --Put_line("Accediendo a nodo menor de: " & nodo.info'img);
                     if nodo.menores = null then -- si no existe un valor menor
                        --put_line("No hay menor por debajo del nodo " & nodo.info'img);
                        --put_line("Creando nodo menor: " & V(i)'img);
                        -- Crear el nuevo nodo
                        encontrado := True;
                        nodo.menores := new T_Nodo_Arbol'(V(i), null, null);
                     else
                        --put("Encontrado nodo menor al actual: " & nodo.menores.info'img);
                        -- Acceder al nodo menor
                        nodo := nodo.menores;
                     end if;
                  elsif V(i) > nodo.info then -- V(i) es mayor
                     --put_line("Accediendo a nodo mayor de: " & nodo.info'img);
                     if nodo.mayores = null then -- si no existe un valor mayor
                         --put_line("No hay mayor por debajo del nodo " & nodo.info'img);
                         --put_line("Creando nodo menor: " & V(i)'img);
                        -- Crear el nuevo nodo
                        encontrado := True;
                        nodo.mayores := new T_Nodo_Arbol'(V(i), null, null);
                     else
                        --put("Encontrado nodo mayor al actual: " & nodo.mayores.info'img);
                        -- Acceder al nodo mayor
                        nodo := nodo.mayores;
                     end if;
                  else -- Los numeros son iguales salimos del bucle
                     --Put_line("--el nodo ya existe-");
                     encontrado := True;
                  end if;
               end loop;
               nodo := A;
               --new_line(2);
         end loop;
      end if;
   end Crear_Arbol_Binario;

end Laboratorio09b;
