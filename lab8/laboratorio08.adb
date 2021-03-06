WITH Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
USE Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;

package body Laboratorio08 is

   -------------
   -- Comunes --
   -------------

   function Comunes (V1,V2: in T_vector_enteros) return Natural is
      i: Integer := V1'First;
      j: Integer := V2'First;
      comunes: Integer := 0;
   begin
      while i /= V1'Last+1 and j /= V2'Last+1 loop
         if V1(i) < V2(j) then
            i := i + 1 ;
         elsif V1(i) > V2(j) then
            j := j + 1;
         elsif V1(i) = V2(j) then
            comunes := comunes + 1;
            i := i + 1;
            j := j + 1;
         end if;
      end loop;

      return comunes;
   end Comunes;

   ---------------
   -- Encriptar --
   ---------------

   procedure Encriptar
     (N,Clave: in T_Vector_Enteros;
      Num: out T_Vector_Enteros)
   is
   begin
      for i in 1..Num'Length loop
         -- Se asignan 0's hasta llegar a valores definidos
         If N'Length + i <= Clave'Length then
            put(Clave'First+i-1);
            Num(Num'First + Clave(Clave'First+i-1) - 1) := 0;
         else
            Num(Num'First + Clave(Clave'First+i-1) - 1) := N(N'First+(i-(Clave'Length-N'Length))-1);
         end if;
      end loop;
   end Encriptar;

   -----------------------
   -- Insertar_En_Medio --
   -----------------------

   procedure Insertar_En_Medio (L: in out T_Lista_Estatica; Num: in Integer)
   is
   begin
      if L.cont mod 2 = 0 then
         L.cont := L.cont + 1;
         if L.cont > 1 then
            for i in reverse L.cont/2+1..L.cont loop
               L.Dato(L.Dato'First+i-1) := L.Dato(L.Dato'First+i-2);
            end loop;
         end if;
         L.Dato(L.cont/2+1) := num;
      end if;
   end Insertar_En_Medio;

   -----------------------
   -- Borrar_Intermedio --
   -----------------------

   procedure Borrar_Intermedio (L: in out T_Lista_Estatica) is
   begin
      if L.cont mod 2 /= 0 then
         if L.cont > 0 then
            for i in L.cont/2+1..L.cont+1 loop
               L.Dato(L.Dato'First+i-1) := L.Dato(L.Dato'First+i);
            end loop;
            L.cont := L.cont - 1;
         end if;
      end if;
   end Borrar_Intermedio;

   --------------------------------------
   -- Obtener_Num_Vecinos_por_Vivienda --
   --------------------------------------

   procedure Obtener_Num_Vecinos_por_Vivienda
     (C: in T_Comunidad;
      R:out T_Rascacielos)
   is
   begin
      R := (others => (others => 0));
      for vec in C'range loop
         R(C(vec).piso, C(vec).mano) := R(C(vec).piso, C(vec).mano) + 1;
      end loop;
   end Obtener_Num_Vecinos_por_Vivienda;

   ----------------------
   -- Obtener_Consumos --
   ----------------------

   procedure Obtener_Consumos
     (E: in T_Edificio;
      Consumo_electrico: out Float;
      Consumo_gas: out T_Consumo_Medio_Manos)
   is
      habitantes_totales, habitantes_mano: Natural := 0;
   begin
      for mano in E'range(1) loop
         habitantes_mano := 0;
         for piso in E'range(2) loop
            -- Sumar el consumo electrico
            consumo_electrico := consumo_electrico + E(mano, piso).consumo_electrico;
            -- Sumar el consumo de gas
            consumo_gas(mano) := consumo_gas(mano) + E(mano, piso).consumo_gas;
            --Contar habitantes para hacer la media
            habitantes_mano := habitantes_mano + E(mano, piso).Habitantes;
         end loop;

         -- Media de gas por mano
         consumo_gas(mano) := consumo_gas(mano) / Float(habitantes_mano);

         -- Sumar los habitantes de la mano a los habitantes totales
         habitantes_totales := habitantes_totales + habitantes_mano;

      end loop;
      -- Media de consumo electrico total
      consumo_electrico := consumo_electrico / Float(habitantes_totales);
   end Obtener_Consumos;

end Laboratorio08;
