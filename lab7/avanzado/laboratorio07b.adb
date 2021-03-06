with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;
package body Laboratorio07b is

   ------------
   -- Trigon --
   ------------

   function Trigon (C: in T_Complejo_Polar) return T_Complejo_Tri is
   begin
      return (A => C.Argumento * cos(C.angulo), B => C.Argumento * sin(C.angulo));
   end Trigon;

   -------------------
   -- Dia_Siguiente --
   -------------------

   procedure Dia_Siguiente (F: in out T_Fecha) is
      -- Formula para saber si el anno es bisiesto
      esBisiesto: Integer range 0..1 := ( if (F.anno mod 4 = 0 or F.anno mod 400 = 0) and (F.anno mod 100 /= 0) then 1 else 0 );
      -- Formula para saber la cantidad de dias del mes
      dias_en_mes: T_Dia := (if (T_Mes'Pos(F.mes) + 1) = 2 then (28 + esBisiesto) else 31 - ((T_Mes'Pos(F.mes) + 1) - 1) rem 7 rem 2);
   begin
      -- ultimo dia del mes
      if F.Dia = dias_en_mes then
         F.Dia := 1;
            -- ultimo mes del anno T_Datos_Pluviometricos
            if F.Mes = Diciembre then
               F.Mes := Enero;
               F.anno := F.anno + 1;
            else
               F.Mes := T_Mes'Val(T_Mes'Pos(F.Mes) + 1);
            end if;
      else
         F.Dia := F.Dia + 1;
      end if;
   end Dia_Siguiente;

   ------------
   -- Maximo --
   ------------

   procedure Maximo (Lluvia: in T_Datos_Pluviometricos; F1, F2: T_Fecha; F: out T_Fecha) is
      esBisiesto: Integer range 0..1;
      dias_en_mes: T_Dia;
      m_first, m_last: T_Mes;
      d_first, d_last: T_Dia;
      suma_lluvias: Natural;
      max: Integer := Integer'First;
   begin
      -- Si las dos fechas (mes y anno) coinciden
      if F1.Mes = F2.Mes and F1.anno = F2.anno then
         F := F1;
      else
         -- Recorremos todos los a�os entre F1 y F2 (incluidos)
         for anno in F1.anno..F2.anno loop
            --new_line(2);
            --put("***Anno " & anno'img);
            --new_line(2);

            -- Comprobar si el anno es bisiesto
            esBisiesto := ( if (anno mod 4 = 0 or anno mod 400 = 0) and (anno mod 100 /= 0) then 1 else 0 );

            -- Primer y ultimo anno solo computan los meses seleccionados
            if anno = F1.anno then
               m_first := F1.mes;
               m_last := Diciembre;
            elsif anno = F2.anno then
               m_first := Enero;
               m_last := F2.mes;
            else
               m_first := Enero;
               m_last := Diciembre;
            end if;

            for mes in m_first..m_last loop
               --put("  **Mes: " & mes'img);

               -- Calcular la cantidad de dias por mes
               dias_en_mes := (if (T_Mes'Pos(mes) + 1) = 2 then (28 + esBisiesto) else 31 - ((T_Mes'Pos(mes) + 1) - 1) rem 7 rem 2);

               -- Primer y ultimo mes solo computan los dias seleccionados
               if anno = F1.anno and mes = F1.Mes then
                  d_first := F1.Dia;
                  d_last := dias_en_mes;
               elsif anno = F2.anno and mes = F2.Mes then
                  d_first := 1;
                  d_last := F2.dia;
               else
                  d_first := 1;
                  d_last := dias_en_mes;
               end if;
               --put("(" & d_first'img & " - " & d_last'img & ") dias");
               suma_lluvias := 0; -- Resetear por cada mes
               for dia in d_first..d_last loop
                  suma_lluvias := suma_lluvias + Lluvia(anno)(mes)(dia);
               end loop;
               if suma_lluvias > max then
                  max := suma_lluvias;
                  -- El dia es irrelevante
                  F := (1, mes, anno);
               end if;
               --put(" ---> Total de lluvia: " & suma_lluvias'img);
               --new_line;
            end loop;
         end loop;
      end if;
   end Maximo;

   -----------------
   -- Simplificar --
   -----------------

   procedure Simplificar (L:  in out T_Estatica_Carreteras; Peaje: out T_Estatica_Carreteras) is
      eliminados: Natural range 0..5 := 0;
      i: Integer := L.Ctras'First;
   begin
      Peaje.Cont := 0;

      -- Seguir en el bucle si:
         -- 1. Se han eliminado menos de 5 carreteras
         -- 2. Una de las siguientes (o ambas)
            -- 2.1. La iteracion llega hasta el contador (L.cont)
            -- 2.2. El contador se ha reducido hasta 0
      while eliminados /= 5 and i /= L.Cont+1 and L.cont /= 0 loop
         if L.Ctras(i).Peaje_km > 0.0 then
            -- Anadir a Peaje la carretera de peaje encontrada
            eliminados := eliminados + 1;
            Peaje.Ctras(Peaje.Ctras'First+eliminados-1) := L.Ctras(i);
            Peaje.Cont := Peaje.Cont + 1;

            -- Desplazar una pos a la derecha todos las siguientes carreteras (hasta L.cont)
            for j in L.Ctras'First+i-1..L.Ctras'First+L.Cont-2 loop
               L.Ctras(j) := L.Ctras(j+1);
            end loop;
            L.Cont := L.Cont - 1;
         else
            i := i + 1;
         end if;
      end loop;
   end Simplificar;

   -----------------
   -- Simplificar --
   -----------------

   procedure Simplificar (L: in out T_Estatica_Puntos) is
      last: T_Punto := L.Ptos(L.Ptos'First+L.Num-1);
      pos: Integer := 2;
      i: Integer := L.Ptos'First;
      j: Integer;
      cont: Natural := 1;
      cent_encontrado: Boolean := L.Ptos(L.Ptos'First) = CENTINELA;
   begin
      loop
         j := 1;
         -- Comprobar si el centinela se encuentra en el salto de 3 valores
         loop
            exit when L.Ptos(i+j) = CENTINELA or j = 4;
            j := j + 1;
         end loop;
         -- Comprobar que el valor siguiente al salto es el centinela
         i := i + j;
         exit when L.Ptos(i) = CENTINELA;
         -- Pasamos el elemento 3 posiciones mas adelante al de la posicion actual
         L.Ptos(pos) := L.Ptos(i);
         pos := pos + 1;
         cont := cont+1;
      end loop;

      -- Reducimos el L.Num;
      if L.Ptos(L.Ptos'First+cont-1) /= last then
         cont := cont + 1;
      end if;
      L.Num := cont;

      -- A�adimos el ultimo elemento a la lista (porque hay que conservar los extremos)
      L.Ptos(L.Ptos'First+L.Num-1) := last;

      -- Y colocamos el centinela despues del ultimo elemento
      L.Ptos(L.Ptos'First+L.Num) := CENTINELA;
   end Simplificar;

   -----------------
   -- Simplificar --
   -----------------

   procedure Simplificar (L: in out T_Estatica_Carreteras) is
      i, pto: Integer;
   begin
      -- Iterar sobre cada carretera (hasta contador)
      for ctra in L.Ctras'First..L.Cont loop
         -- Iterar sobre cada punto en el trazado (desde el segundo hasta el penultimo)
         -- conservando el primer y ultimo punto
         pto:= L.Ctras(ctra).Trazado.Ptos'First;
         while pto < L.Ctras(ctra).Trazado.Num and L.Ctras(ctra).Trazado.Num > 2 loop
            if L.Ctras(ctra).Trazado.Ptos(pto).X - L.Ctras(ctra).Trazado.Ptos(pto+1).X < 0.001 and
            L.Ctras(ctra).Trazado.Ptos(pto).Y - L.Ctras(ctra).Trazado.Ptos(pto+1).Y < 0.001 and
            L.Ctras(ctra).Trazado.Ptos(pto).X - L.Ctras(ctra).Trazado.Ptos(pto+1).X > -0.001 and
            L.Ctras(ctra).Trazado.Ptos(pto).Y - L.Ctras(ctra).Trazado.Ptos(pto+1).Y > -0.001 then
               -- Desplazar los puntos a la derecha del actual una posicion a la izquierda
               i:= pto+1;
               while i < L.Ctras(ctra).Trazado.Num loop
                  L.Ctras(ctra).Trazado.Ptos(i) := L.Ctras(ctra).Trazado.Ptos(i+1);
                  i := i + 1;
               end loop;
               -- Reducir el contador del trazado
               L.Ctras(ctra).Trazado.Num := L.Ctras(ctra).Trazado.Num-1;
            else
               pto := pto + 1;
            end if;
         end loop;
      end loop;
   end Simplificar;

   --------------------------
   -- DNI_Mayor_Patrimonio --
   --------------------------

   -- He creado un registro que almacene el dni y el patrimonio acumulado
   -- y un vector que guarde valores del tipo definido previamente

   -- En una urbanizacion puede haber hasta Num_Bloques bloques (20)
   -- En cada bloque puede haber hasta Max_Plantas plantas (10)
   -- En cada planta puede haber hasta Max_Aparamentos_Por_Planta apartamentos (8)
   -- Luego el total de propietarios posible es de 20*10*8 = 1600

   function DNI_Mayor_Patrimonio (U: in T_Urbanizacion) return Integer is

      -- Declaro un nuevo registro para almacenar los propietarios y su patrimonio total
      Max_Propietarios: constant Integer := 1600;
      type T_Dni_Patr is record
         Dni, Patrimonio: Integer;
      end record;
      type patrimonios is array(Integer range 1..Max_Propietarios) of T_Dni_Patr;

      dni_patr: patrimonios := (others => (Integer'First, 0));
      pos: Integer;
      encontrado: Boolean := False;
      max, dni_max: Integer := Integer'First;
   begin
      -- Iterar sobre cada edificio
      for edif in U'range loop
         for planta in U(edif)'range loop
            for apart in U(edif)(planta).Apartamentos'First..U(edif)(planta).Num_Apartamentos loop
               -- Comprobar si se ha registrado el propietario actual
               -- Condiciones para salir del bucle:
               --    1. Nos encontramos con un agregado (Integer'First, Integer'First)
               --    2. Nos encontramos al propietario (es decir, que ya esta registrado)
               -- En cada iteracion, aumentos pos_registro

               pos:= dni_patr'First;
               loop
                  encontrado := dni_patr(pos).Dni = U(edif)(planta).Apartamentos(apart).Propietario_Actual.Dni;
                  exit when encontrado or dni_patr(pos) = (Integer'First, 0);
                  pos := pos + 1;
               end loop;

               if not encontrado then
                  dni_patr(pos).Dni := U(edif)(planta).Apartamentos(apart).Propietario_Actual.Dni;
               end if;

               dni_patr(pos).Patrimonio := dni_patr(pos).Patrimonio + U(edif)(planta).Apartamentos(apart).Precio;

            end loop;
         end loop;
      end loop;

      -- Busca el propietario con el patrimonio mas alto
      for prop in dni_patr'range loop
         if dni_patr(prop).Patrimonio > max then
            max := dni_patr(prop).Patrimonio;
            dni_max := dni_patr(prop).Dni;
         end if;
      end loop;
      return dni_max;
   end DNI_Mayor_Patrimonio;

   ------------------------------
   -- encontrar_espacio_blanco --
   ------------------------------

   procedure encontrar_espacio_blanco (P: in T_Puzle; F, C: out Integer) is
      row: integer := P'First(1);
      col: integer := P'First(2);
      encontrado: Boolean := False;
   begin
      while row < P'Last(1) and not encontrado loop
         col := 1;
         while not encontrado and col <= P'Last(2) loop
            if P(row, col) = 0 then
               encontrado := True;
               F := row;
               C := col;
            else
               col := col + 3;
            end if;
         end loop;
         row := row + 3;
      end loop;
   end encontrar_espacio_blanco;

   -----------------------------
   -- rotar_matriz_derecha_90 --
   -----------------------------

   procedure rotar_matriz_derecha_90 (F: in out T_Ficha) is
      F2: T_Ficha := F;
      inicio, final, temp: Integer;
   begin
      -- 1. Transponer la matriz
      for row in F'range(1) loop
         for col in F'range(2) loop
            F(col, row) := F2(row, col);
         end loop;
      end loop;

      -- 2. Invertir cada fila
      for row in F'range(1) loop
         inicio:=  F'First(1);
         final := F'Last(1);
         while inicio < final loop
            temp := F(row, inicio);
            F(row, inicio) := F(row, final);
            F(row, final) := temp;

            inicio := inicio + 1;
            final := final - 1;
         end loop;
      end loop;

   end rotar_matriz_derecha_90;

   ---------------------
   -- filas_correctas --
   ---------------------

   function filas_correctas (P: in T_Puzle; Ficha: in T_Ficha; F, C: in Integer) return Boolean is
      existe: Boolean := False;
      i: Integer := 0;
      j: Integer;
      f_c: Integer;
   begin
      -- Iterar por cada fila (scope ficha)
      while not existe and i /= 3 loop
         j := 0;
         -- iterar por cada columna (scope ficha)
         while not existe and j /= 3 loop
            -- Comprobar que el numero no esta ni en la fila y en la columna (scope sudoku)
            f_c := 1;
            while not existe and f_c /= T_Puzle'Last+1 loop
               existe := P(F+i, f_c) = ficha(i+1, j+1) or P(f_c, C+j) = ficha(i+1, j+1);
               f_c := f_c + 1;
            end loop;
            j := j + 1;
         end loop;
         i := i + 1;
      end loop;
      return not existe;
   end filas_correctas;

end Laboratorio07b;
