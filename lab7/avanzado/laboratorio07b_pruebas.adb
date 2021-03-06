-- "Si me encuentro mas de un return, te bajo nota."
--                                                  -Tomas, 2020 (o antes)

-- Hay secciones de codigo marcadas para descomentar. Puedes descomentarlas si quieres que se muestren los resultados completos.
-- (estan comentadas porque ocupan mucho espacio en la consola).

WITH Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Laboratorio07b;
USE Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Laboratorio07b;

PROCEDURE laboratorio07b_pruebas IS
   C: T_Complejo_Polar;
   T: T_Complejo_Tri;
   F: T_Fecha;
   Lluvia : T_Datos_Pluviometricos;
   F1, F2: T_Fecha;
   L, Peaje: T_Estatica_Carreteras;
   LP: T_Estatica_Puntos;
   P: T_Puzle;
   FF, CC: Integer;
   ficha: T_Ficha;

   -- Usado para vaciar un objeto Peajes despues de cada caso de prueba
   L_vacia: constant T_Estatica_Carreteras := (
      Ctras => (
         others => ( (others => ' '), (others => ' '), (others => ' '), 0.0, ( (others => (0.0, 0.0)), 0) )
      ),
      Cont => 0
   );

   U: T_Urbanizacion;

   -- programa auxiliar para representar por consola un objeto T_Datos_Pluviometricos
   procedure mostrar_datos_pluviometricos (Lluvia: T_Datos_Pluviometricos) IS
   BEGIN
      put("-- Datos pluviometricos --");
      for aa in Lluvia'range loop -- iterar sobre anno
         put("Anno: " & aa'img);
         new_line;
         for mm in Lluvia(aa)'range loop -- iterar sobre mes
            put("  Mes: " & mm'img);
            new_line;
            for dd in Lluvia(aa)(mm)'range loop -- iterar sobre dia
               put("    Dia: " & dd'img & ". Valor --> " & Lluvia(aa)(mm)(dd)'img);
               new_line;
            end loop;
            new_line(2);
         end loop;
         new_line(5);
      end loop;
      put("-- Final datos pluviometricos --");
   END mostrar_datos_pluviometricos;

   -- programa auxiliar para representar por consola un objeto T_Estatica_Carreteras
   procedure mostrar_carreteras(L: T_Estatica_Carreteras; inicio: Integer:= 1; final: Integer := Max_Carreteras) is
   begin
      for crt in inicio..final loop
         Put("   Carretera " & crt'img);
         new_line;
         Put_Line("      Codigo: " & L.Ctras(crt).Codigo);
         Put("      Peaje_km: "); put(L.Ctras(crt).Peaje_km, 1, 2, 0);
         new_line(2);
      end loop;
   end mostrar_carreteras;

   -- programa auxiliar para representar por consola un objeto T_Punto (hasta centinela si lo hubiese)
   procedure mostrar_puntos_por_carretera(L: T_Estatica_Carreteras) is
      ptos: V_puntos(1..max_puntos);
      ptos_cont: Natural;
   begin
      for ctra in L.Ctras'First..L.Ctras'First+L.Cont-1 loop
         put("   Carretera " & L.Ctras(ctra).Codigo);
         new_line;

         ptos := L.Ctras(ctra).Trazado.Ptos;
         ptos_cont := L.Ctras(ctra).Trazado.Num;
         for pto in ptos'First..ptos'First+ptos_cont-1  loop
            put("      ("); put(ptos(pto).X, 1, 5, 0); put(", "); put(ptos(pto).Y, 1, 5, 0); put(")");
            new_line;
         end loop;
         new_line;
      end loop;
   end mostrar_puntos_por_carretera;

   -- programa auxiliar para representar por consola un objeto T_Estatica_Puntos, hasta encontrarse con CENTINELA
   procedure mostrar_puntos(L: T_Estatica_Puntos) is
      k: Integer := L.Ptos'First;
   begin
      while LP.Ptos(k) /= CENTINELA loop
         put("("); put(LP.Ptos(k).X, 1, 1, 0); put(", "); put(LP.Ptos(k).Y, 1, 1, 0); put(")");
         k := k + 1;
      end loop;
   end mostrar_puntos;

   -- programa auxiliar para representar por consola un objeto T_Urbanizacion
   procedure mostrar_urbanizacion(U: T_Urbanizacion) is
   begin
      put("-- Mostrar urbanizacion --");
      new_line;

      for bloque in U'range loop -- iterar sobre cada bloque
         put("Bloque: " & bloque'img);
         new_line;
         for planta in U(bloque)'range loop
            put("   Planta: " & planta'img);
            new_line;
            for apart in U(bloque)(planta).Apartamentos'First..U(bloque)(planta).Num_Apartamentos loop
               Put_Line("      Apartamento: " & apart'img);
                  Put_Line("         Propietario: " & U(bloque)(planta).Apartamentos(apart).Propietario_Actual.Dni'img);
                  Put_Line("         Precio: " & U(bloque)(planta).Apartamentos(apart).Precio'img);
                  new_line;
            end loop;
            new_line;
         end loop;
         new_line;
      end loop;

      new_line(2);
      put("-- Final mostrar urbanizacion --");
   end mostrar_urbanizacion;

   -- programa auxiliar para representar por consola un objeto T_Ficha
   procedure mostrar_ficha(F: T_Ficha) is
   begin
      for i in F'range(1) loop
         for j in F'range(2) loop
            put(F(i, j), 2);
         end loop;
         new_line;
      end loop;
   end mostrar_ficha;

BEGIN

   Put_Line("Algunas secciones del codigo han sido comentadas para reducir la carga en la consola.");

   new_line(2);

   ------------
   -- Trigon --
   ------------
   Put_Line("***** Trigon *****");
   new_line;

   -- Caso 1
   C:= (0.0,0.0);
   Put_Line("Numero en forma polar (0.0, 0.0) a forma trigonometrica: (0.0, 0.0)");
   T := Trigon(C); Put("A: "); Put(T.A, 1, 2, 0); Put(". B: "); Put(T.B, 1, 2, 0);

   new_line(2);

   -- Caso 2
   C:= (23.45, 62.91);
   Put_Line("Numero en forma polar (23.45, 62.91) a forma trigonometrica: (23.38, 1.83)");
   T := Trigon(C);
   Put("A: "); Put(T.A, 1, 2, 0); Put(". B: "); Put(T.B, 1, 2, 0);

   new_line(2);

   -- Caso 3
   C:= (99.99, 1.11);
   Put_Line("Numero en forma polar (99.99, 1.11) a forma trigonometrica: (44.46, 89.56)");
   T := Trigon(C); Put("A: "); Put(T.A, 1, 2, 0); Put(". B: "); Put(T.B, 1, 2, 0);


   -------------------
   -- Dia_Siguiente --
   -------------------
   new_line(3);
   Put_Line("***** Dia_Siguiente *****");
   new_line;

   -- Caso 1: Fecha normal
   F:= (4, Enero, 1972);
   Put_Line("El siguiente dia al 4 de enero del 1972 es el 5 de enero del 1972");
   Dia_Siguiente(F);
   Put_Line(F.Dia'img & " de " & F.Mes'img & " del " & F.anno'img);

   new_line;

   -- Caso 2: Cambio de mes
   F:= (31, Agosto, 2010);
   Put_Line("El siguiente dia al 31 de agosto del 2010 es el 1 de septiembre del 2010");
   Dia_Siguiente(F);
   Put_Line(F.Dia'img & " de " & F.Mes'img & " del " & F.anno'img);

   new_line;

   -- Caso 3: Cambio de mes (mes de 30 dias)
   F:= (30, Abril, 2013);
   Put_Line("El siguiente dia al 30 de Abril del 2013 es el 1 de Mayo del 2013");
   Dia_Siguiente(F);
   Put_Line(F.Dia'img & " de " & F.Mes'img & " del " & F.anno'img);

   new_line;

   -- Caso 4: Cambio de anno
   F:= (31, Diciembre, 2017);
   Put_Line("El siguiente dia al 31 de Diciembre del 2017 es el 1 de Enero del 2018");
   Dia_Siguiente(F);
   Put_Line(F.Dia'img & " de " & F.Mes'img & " del " & F.anno'img);

   new_line;

   -- Caso 5: 28 de febrero de anno no bisiesto
   F:= (28, Febrero, 2019);
   Put_Line("El siguiente dia al 28 de Febrero del 2019 es el 1 de Marzo del 2019");
   Dia_Siguiente(F);
   Put_Line(F.Dia'img & " de " & F.Mes'img & " del " & F.anno'img);

   new_line;

   -- Caso 6: 28 de febrero de anno bisiesto
   F:= (28, Febrero, 2020);
   Put_Line("El siguiente dia al 28 de Febrero del 2020 es el 29 de Febrero del 2020");
   Dia_Siguiente(F);
   Put_Line(F.Dia'img & " de " & F.Mes'img & " del " & F.anno'img);


   ------------
   -- Maximo --
   ------------
   new_line(3);
   Put_Line("***** Maximo *****");
   new_line;

   -- Datos pluviometricos para todos los casos de prueba
   Lluvia:= (2001..2010 => ( Enero..Junio => (1..16 => 78, 17..31 => 250), Julio..Diciembre => (1..16 => 10, 17..31 => 2)),
             2011..2020 => ( Enero..Junio => (1..16 => 25, 17..31 => 32), Julio..Diciembre => (1..16 => 20, 17..31 => 40)));

   put("(Descomenta la call a mostrar_datos_pluviometricos() para mostrar todos los datos pluviometricos)");
   new_line;
   --mostrar_datos_pluviometricos(Lluvia);

   new_line;

   -- Caso 1: Dos fechas cualesquiera
   F1 := (4, marzo, 2002);
   F2 := (16, agosto, 2018);
   Put_Line("Mes y anno con maximo de lluvias entre 4 de marzo de 2002 y 16 de agosto del 2018: mayo del 2002");
   maximo(Lluvia, F1, F2, F);
   put(F.mes'img & " del " & F.anno'img);

   new_line(2);

   -- Caso 2: Dos fechas con el mismo anno
   F1 := (9, abril, 2009);
   F2 := (1, septiembre, 2009);
   Put_Line("Mes y anno con maximo de lluvias entre 9 de abril de 2009 y 1 de septiembre del 2009: mayo del 2009");
   maximo(Lluvia, F1, F2, F);
   put(F.mes'img & " del " & F.anno'img);

   new_line(2);

   -- Caso 3: Primera y ultima fecha posible
   F1 := (1, enero, 2001);
   F2 := (31, diciembre, 2020);
   Put_Line("Mes y anno con maximo de lluvias entre 1 de enero de 2001 y 31 de diciembre del 2020: enero del 2001");
   maximo(Lluvia, F1, F2, F);
   put(F.mes'img & " del " & F.anno'img);

   new_line(2);

   -- Caso 4: Mismo anno y mes
   F1 := (13, julio, 2006);
   F2 := (22, julio, 2006);
   Put_Line("Mes y anno con maximo de lluvias entre 13 de julio de 2006 y 22 de julio del 2006: julio del 2006");
   maximo(Lluvia, F1, F2, F);
   put(F.mes'img & " del " & F.anno'img);
   new_line;

   ---------------------
   -- Simplificar (1) --
   ---------------------
   new_line(3);
   Put_Line("***** Simplificar (1) *****");
   new_line;

   Put_Line("(Descomentar las calls a mostrar_carreteras() para mostrar las T_Estatica_Carretera's utilizadas)");

   new_line(2);

   -- Caso 1: 5 o mas carreteras con peaje
   L := (
      Ctras => (
         ( ('c', '1', others => ' '), ('i', '1', others => ' '), ('f', '1', others => ' '), 1.5, ((others => (1.7, 9.4)), 8) ),
         ( ('c', '2', others => ' '), ('i', '2', others => ' '), ('f', '2', others => ' '), 2.5, ((others => (1.7, 9.4)), 8) ),
         ( ('c', '3', others => ' '), ('i', '3', others => ' '), ('f', '3', others => ' '), 3.5, ((others => (1.7, 9.4)), 8) ),
         ( ('c', '4', others => ' '), ('i', '4', others => ' '), ('f', '4', others => ' '), 4.5, ((others => (1.7, 9.4)), 8) ),
         ( ('c', '5', others => ' '), ('i', '5', others => ' '), ('f', '5', others => ' '), 5.5, ((others => (1.7, 9.4)), 8) ),
         ( ('c', '6', others => ' '), ('i', '6', others => ' '), ('f', '6', others => ' '), 6.5, ((others => (1.7, 9.4)), 8) ),
         ( ('c', '7', others => ' '), ('i', '7', others => ' '), ('f', '7', others => ' '), 7.5, ((others => (1.7, 9.4)), 8) ),
         others => ( ('c', 'x', others => ' '), ('c', 'x', others => ' '), ('c', 'x', others => ' '), 2.5, ( (others => (2.5, 1.9)), 8) )
      ),
      Cont => 6
   );
   Peaje := L_vacia; -- incializar Peaje con valores 'vacios'

   -- * Descomentar para ver los datos de las carreteras *
   -- mostrar_carreteras(L, L.Ctras'First, L.Ctras'Last);

   Put_Line("Se eliminan c1, c2, c3, c4, c5 y se pasan a la lista Peaje");
   Simplificar(L, Peaje);

   new_line;

   Put_Line("Lista de carreteras actualizada: (Carreteras validas: " & L.Cont'img & "): ");
   mostrar_carreteras(L, L.Ctras'First, L.Ctras'First+L.Cont-1);

   Put_Line("Lista de carreteras de peaje (Carreteras validas: " & Peaje.Cont'img & "): ");
   mostrar_carreteras(Peaje, Peaje.Ctras'First, Peaje.Ctras'First+Peaje.Cont-1);

   put("-------------------------");
   new_line(2);

   -- Caso 2: menos de 5 carreteras con peaje
   L := (
      Ctras => (
         ( ('c', '1', others => ' '), ('i', '1', others => ' '), ('f', '1', others => ' '), 3.8, ((others => (1.7, 9.4)), 8) ),
         ( ('c', '2', others => ' '), ('i', '2', others => ' '), ('f', '2', others => ' '), 0.0, ((others => (1.7, 9.4)), 8) ),
         ( ('c', '3', others => ' '), ('i', '3', others => ' '), ('f', '3', others => ' '), 0.0, ((others => (1.7, 9.4)), 8) ),
         ( ('c', '4', others => ' '), ('i', '4', others => ' '), ('f', '4', others => ' '), 0.0, ((others => (1.7, 9.4)), 8) ),
         ( ('c', '5', others => ' '), ('i', '5', others => ' '), ('f', '5', others => ' '), 1.1, ((others => (1.7, 9.4)), 8) ),
         ( ('c', '6', others => ' '), ('i', '6', others => ' '), ('f', '6', others => ' '), 0.0, ((others => (1.7, 9.4)), 8) ),
         ( ('c', '7', others => ' '), ('i', '7', others => ' '), ('f', '7', others => ' '), 0.0, ((others => (1.7, 9.4)), 8) ),
         others => ( ('c', 'x', others => ' '), ('c', 'x', others => ' '), ('c', 'x', others => ' '), 0.0, ( (others => (2.5, 1.9)), 8) )
      ),
      Cont => 7
   );
   Peaje := L_vacia; -- inicializar Peaje con valores 'vacios'

   -- * Descomentar para ver los datos de las carreteras *
   --mostrar_carreteras(L, L.Ctras'First, L.Ctras'Last);

   Put_Line("Se eliminan c1 y c5");
   Simplificar(L, Peaje);

   new_line;

   Put_Line("Lista de carreteras actualizada: (Carreteras validas: " & L.Cont'img & "): ");
   mostrar_carreteras(L, L.Ctras'First, L.Ctras'First+L.Cont-1);

   Put_Line("Lista de carreteras de peaje (Carreteras validas: " & Peaje.Cont'img & "): ");
   mostrar_carreteras(Peaje, Peaje.Ctras'First, Peaje.Ctras'First+Peaje.Cont-1);

   put("-------------------------");
   new_line(2);

   -- Caso 3: Ninguna carretera de peaje
   L:= (
      Ctras => (
         ( ('c', '1', others => ' '), ('i', '1', others => ' '), ('f', '1', others => ' '), 0.0, ((others => (1.7, 9.4)), 8) ),
         ( ('c', '2', others => ' '), ('i', '2', others => ' '), ('f', '2', others => ' '), 0.0, ((others => (1.7, 9.4)), 8) ),
         ( ('c', '3', others => ' '), ('i', '3', others => ' '), ('f', '3', others => ' '), 0.0, ((others => (1.7, 9.4)), 8) ),
         ( ('c', '4', others => ' '), ('i', '4', others => ' '), ('f', '4', others => ' '), 0.0, ((others => (1.7, 9.4)), 8) ),
         ( ('c', '5', others => ' '), ('i', '5', others => ' '), ('f', '5', others => ' '), 5.4, ((others => (1.7, 9.4)), 8) ),
         ( ('c', '6', others => ' '), ('i', '6', others => ' '), ('f', '6', others => ' '), 7.2, ((others => (1.7, 9.4)), 8) ),
         ( ('c', '7', others => ' '), ('i', '7', others => ' '), ('f', '7', others => ' '), 0.0, ((others => (1.7, 9.4)), 8) ),
         others => ( ('c', 'x', others => ' '), ('c', 'x', others => ' '), ('c', 'x', others => ' '), 0.0, ( (others => (2.5, 1.9)), 8) )
      ),
      Cont => 4
   );
   Peaje := L_vacia; -- inicializar Peaje con valores 'vacios'

   -- * Descomentar para ver los datos de las carreteras *
   --mostrar_carreteras(L, L.Ctras'First, L.Ctras'Last);

   Put_Line("No se borra ninguna carretera");
   Simplificar(L, Peaje);

   new_line;

   Put_Line("Lista de carreteras actualizada: (Carreteras validas: " & L.Cont'img & "): ");
   mostrar_carreteras(L, L.Ctras'First, L.Ctras'First+L.Cont-1);

   Put_Line("Lista de carreteras de peaje (Carreteras validas: " & Peaje.Cont'img & "): ");
   mostrar_carreteras(Peaje, Peaje.Ctras'First, Peaje.Ctras'First+Peaje.Cont-1);


   ---------------------
   -- Simplificar (2) --
   ---------------------
   new_line(3);
   Put_Line("***** Simplificar (2) *****");
   new_line;

   -- Caso 1: Se toman el primero, alguno/s del medio y el ultimo
   LP:= (((1.1,1.1),(2.2,2.2),(3.3,3.3),(4.4,4.4),(5.5,5.5),(6.6,6.6),(7.7,7.7),(8.8,8.8),(9.9,9.9), others => (-1.0, -1.0)), 9);
   Put_Line("La lista ((1.1,1.1),(2.2,2.2),(3.3,3.3),(4.4,4.4),(5.5,5.5),(6.6,6.6),(7.7,7.7),(8.8,8.8),(9.9,9.9),(-1.0, -1.0),...) respetando un valor si y 3 no (con los extremos incluidos): ");
   Put_Line("Resultado correcto: ((1.1,1.1),(5.5, 5.5),(9.9, 9.9),...)");
   Simplificar(LP);
   new_line;
   mostrar_puntos(LP);

   new_line(3);

   -- Caso 2: Solo se toma el primero/ultimo valor (lista de 1 valor)
   LP:= ((1 => (1.1,1.1), others => (-1.0,-1.0)),1);
   Put_Line("La lista ((1.1,1.1),(-1.0, -1.0),...) respetando un valor si y 3 no (con los extremos incluidos): ");
   Put_Line("Resultado correcto: ((1.1,1.1),...)");
   Simplificar(LP);
   new_line;
   mostrar_puntos(LP);

   new_line(3);

   -- Caso 3: Solo se toman el primer y el ultimo valor (lista de 2 valores)
   LP:= ((1 => (1.1,1.1), 2 => (2.2,2.2), others => (-1.0, -1.0)), 2);
   Put_Line("La lista ((1.1,1.1),(2.2,2.2),(-1.0, -1.0),...) respetando un valor si y 3 no (con los extremos incluidos): ");
   Put_Line("Resultado correcto: ((1.1,1.1),(2.2,2.2),...)");
   Simplificar(LP);
   new_line;
   mostrar_puntos(LP);


   ---------------------
   -- Simplificar (3) --
   ---------------------
   new_line(3);
   Put_Line("***** Simplificar (3) *****");
   new_line;

   Put("(Descomentar las calls a mostrar_puntos_por_carretera para ver los objetos T_Estatica_Carreteras.Ctras.Trazado utilizados)");

   new_line(2);

   -- Caso 1: Se borran varios valores
   L := (
      Ctras => (
         ( ('c', '1', others => ' '), ('i', '1', others => ' '), ('f', '1', others => ' '), 0.0, ((1=>(1.1, 1.1), 2=>(1.10001, 1.10001), 3=>(1.10002, 1.10002), 4=>(4.4, 4.4), 5=>(5.5, 5.5), 6=>(5.50001, 5.50001), 7=>(7.7, 7.7), 8=>(8.8, 8.8), others => (1.1, 1.1)), 8) ),
         ( ('c', '2', others => ' '), ('i', '2', others => ' '), ('f', '2', others => ' '), 0.0, ((others => (3.3, 3.3)), 2) ),
         ( ('c', '3', others => ' '), ('i', '3', others => ' '), ('f', '3', others => ' '), 0.0, ((others => (99.99, 99.99)), 2) ),
         ( ('c', '4', others => ' '), ('i', '4', others => ' '), ('f', '4', others => ' '), 0.0, ((others => (99.99, 99.99)), 2) ),
         ( ('c', '5', others => ' '), ('i', '5', others => ' '), ('f', '5', others => ' '), 5.4, ((others => (99.99, 99.99)), 2) ),
         ( ('c', '6', others => ' '), ('i', '6', others => ' '), ('f', '6', others => ' '), 7.2, ((others => (99.99, 99.99)), 2) ),
         ( ('c', '7', others => ' '), ('i', '7', others => ' '), ('f', '7', others => ' '), 0.0, ((others => (99.99, 99.99)), 2) ),
         others => ( ('c', 'x', others => ' '), ('c', 'x', others => ' '), ('c', 'x', others => ' '), 0.0, ( (others => (99.99, 99.99)), 2) )
      ),
      Cont => 4
   );

   -- Descomentar para ver situacion inicial de las carreteras
   -- mostrar_puntos_por_carretera(L);

   Simplificar(L);
   mostrar_puntos_por_carretera(L);

   put("-------------------------");

   new_line(2);

   -- Caso 2: Se borran todos los valores excepto el primero y el ultimo de cada carretera
   L := (
      Ctras => (
         ( ('c', '1', others => ' '), ('i', '1', others => ' '), ('f', '1', others => ' '), 0.0, ((others => (1.1, 1.1)), 4) ),
         ( ('c', '2', others => ' '), ('i', '2', others => ' '), ('f', '2', others => ' '), 0.0, ((others => (1.1, 1.1)), 4) ),
         ( ('c', '3', others => ' '), ('i', '3', others => ' '), ('f', '3', others => ' '), 0.0, ((others => (1.1, 1.1)), 4) ),
         ( ('c', '4', others => ' '), ('i', '4', others => ' '), ('f', '4', others => ' '), 0.0, ((others => (1.1, 1.1)), 4) ),
         ( ('c', '5', others => ' '), ('i', '5', others => ' '), ('f', '5', others => ' '), 5.4, ((others => (1.1, 1.1)), 4) ),
         ( ('c', '6', others => ' '), ('i', '6', others => ' '), ('f', '6', others => ' '), 7.2, ((others => (1.1, 1.1)), 4) ),
         ( ('c', '7', others => ' '), ('i', '7', others => ' '), ('f', '7', others => ' '), 0.0, ((others => (1.1, 1.1)), 4) ),
         others => ( ('c', 'x', others => ' '), ('c', 'x', others => ' '), ('c', 'x', others => ' '), 0.0, ( (others => (99.99, 99.99)), 4) )
      ),
      Cont => 5
   );

   -- Descomentar para ver situacion inicial de las carreteras
   -- mostrar_puntos_por_carretera(L);

   Simplificar(L);
   mostrar_puntos_por_carretera(L);

   --------------------------
   -- DNI_Mayor_Patrimonio --
   --------------------------
   new_line(3);
   Put_Line("***** DNI_Mayor_Patrimonio *****");
   new_line;

   Put_Line("(Descomentar las calls a mostrar_urbanizacion() para ver los objetos T_Urbanizacion utilizados)");
   new_line;

   -- Caso 1
   U:= (
      others => ( -- todo lo que haya aqui dentro es lo mismo para cada T_EDIFICIO
         others => ( -- todo lo que haya aqui dentro es lo mismo para cada T_PLANTA
            Apartamentos => (
               1 => (
                  Precio => 225600,
                  Propietario_Actual => (
                     Nom => "Patxi               ",
                     Apel => "Angulo              ",
                     Dni => 19223738),
                  Propietario_Anterior => (
                     Nom => "Tomas               ",
                     Apel => "Antonio Perez       ",
                     Dni => 52278964
                  )
               ),
               2|3 => (
                  Precio => 150000,
                  Propietario_Actual => (
                     Nom => "Ignacio             ",
                     Apel => "Morlan              ",
                     Dni => 37552874),
                  Propietario_Anterior => (
                     Nom => "Tomas               ",
                     Apel => "Antonio Perez       ",
                     Dni => 52278964
                  )
               ),
               4..6 => (
                  Precio => 240500,
                  Propietario_Actual => (
                     Nom => "Joseba              ",
                     Apel => "Macazaga            ",
                     Dni => 29334199),
                  Propietario_Anterior => (
                     Nom => "Tomas               ",
                     Apel => "Antonio Perez       ",
                     Dni => 52278964
                  )
               ),
               others => (
                  Precio => 250000,
                  Propietario_Actual => (
                     Nom => "Carlos              ",
                     Apel => "Amuchastegui        ",
                     Dni => 62446217),
                  Propietario_Anterior => (
                     Nom => "Tomas               ",
                     Apel => "Antonio Perez       ",
                     Dni => 52278964
                  )
               )
            ),
            Num_Apartamentos => 8
         )
      )
   );

   -- (Descomentar para ver toda la informacion del objeto T_Urbanizacion)
   -- new_line;
   -- mostrar_urbanizacion(U);
   new_line;

   Put_Line("DNI del propietario con mayor patrimonio de la urbanizacion: 29334199 (Joseba Macazaga)" );
   put(DNI_Mayor_Patrimonio(U));


   new_line;


   -- Caso 2
   U:= (
      others => ( -- todo lo que haya aqui dentro es lo mismo para cada T_EDIFICIO
         others => ( -- todo lo que haya aqui dentro es lo mismo para cada T_PLANTA
            Apartamentos => (
               1 => (
                  Precio => 225600,
                  Propietario_Actual => (
                     Nom => "Patxi               ",
                     Apel => "Angulo              ",
                     Dni => 19223738),
                  Propietario_Anterior => (
                     Nom => "Tomas               ",
                     Apel => "Antonio Perez       ",
                     Dni => 52278964
                  )
               ),
               2 => (
                  Precio => 150000,
                  Propietario_Actual => (
                     Nom => "Ignacio             ",
                     Apel => "Morlan              ",
                     Dni => 37552874),
                  Propietario_Anterior => (
                     Nom => "Tomas               ",
                     Apel => "Antonio Perez       ",
                     Dni => 52278964
                  )
               ),
               4 => (
                  Precio => 240500,
                  Propietario_Actual => (
                     Nom => "Joseba              ",
                     Apel => "Macazaga            ",
                     Dni => 29334199),
                  Propietario_Anterior => (
                     Nom => "Tomas               ",
                     Apel => "Antonio Perez       ",
                     Dni => 52278964
                  )
               ),
               others => (
                  Precio => 250000,
                  Propietario_Actual => (
                     Nom => "Carlos              ",
                     Apel => "Amuchastegui        ",
                     Dni => 62446217),
                  Propietario_Anterior => (
                     Nom => "Tomas               ",
                     Apel => "Antonio Perez       ",
                     Dni => 52278964
                  )
               )
            ),
            Num_Apartamentos => 8
         )
      )
   );

   -- (Descomentar para ver toda la informacion del objeto T_Urbanizacion)
   -- new_line;
   -- mostrar_urbanizacion(U);
   new_line;

   Put_Line("DNI del propietario con mayor patrimonio de la urbanizacion: 62446217 (Carlos Amuchastegui)" );
   put(DNI_Mayor_Patrimonio(U));


   ------------------------------
   -- encontrar_espacio_blanco --
   ------------------------------
   new_line(3);
   Put_Line("***** encontrar_espacio_blanco *****");
   new_line;

   -- Caso 1 - Espacio en blanco en el medio
   P := (
      (3,2,5,6,8,1,9,7,4),
      (6,7,4,3,9,5,2,1,8),
      (1,8,9,2,4,7,6,3,5),
      (5,4,8,0,0,0,7,2,1),
      (7,6,1,0,0,0,8,9,3),
      (2,9,3,0,0,0,5,4,6),
      (8,3,2,4,6,9,1,5,7),
      (9,1,7,8,5,3,4,6,2),
      (4,5,6,7,1,2,3,8,9)
   );
   Put_Line("Sudoku:");
   Put_Line("3 2 5 6 8 1 9 7 4");
   Put_Line("6 7 4 3 9 5 2 1 8");
   Put_Line("1 8 9 2 4 7 6 3 5");
   Put_Line("5 4 8 0 0 0 7 2 1");
   Put_Line("7 6 1 0 0 0 8 9 3");
   Put_Line("2 9 3 0 0 0 5 4 6");
   Put_Line("8 3 2 4 6 9 1 5 7");
   Put_Line("9 1 7 8 5 3 4 6 2");
   Put_Line("4 5 6 7 1 2 3 8 9");
   new_line;
   Put_Line("Coordenada superior izquierda donde se encuentra el espacio en blanco: (4,4)");
   encontrar_espacio_blanco(P,FF,CC);
   Put_Line(FF'img & "," & CC'img);

   new_line(2);

   -- Caso 2 - Espacio en blanco al principio
   P := (
      (0,0,0,2,1,5,9,4,8),
      (0,0,0,3,9,7,6,2,1),
      (0,0,0,8,4,6,5,7,3),
      (1,3,2,7,6,4,8,9,5),
      (5,8,9,1,2,3,7,6,4),
      (6,4,7,9,5,8,3,1,2),
      (9,2,5,6,3,1,4,8,7),
      (7,6,4,5,8,2,1,3,9),
      (8,1,3,4,7,9,2,5,6)
   );
   Put_Line("Sudoku:");
   Put_Line("0 0 0 2 1 5 9 4 8");
   Put_Line("0 0 0 3 9 7 6 2 1");
   Put_Line("0 0 0 8 4 6 5 7 3");
   Put_Line("1 3 2 7 6 4 8 9 5");
   Put_Line("5 8 9 1 2 3 7 6 4");
   Put_Line("6 4 7 9 5 8 3 1 2");
   Put_Line("9 2 5 6 3 1 4 8 7");
   Put_Line("7 6 4 5 8 2 1 3 9");
   Put_Line("8 1 3 4 7 9 2 5 6");
   new_line;
   Put_Line("Coordenada superior izquierda donde se encuentra el espacio en blanco: (1,1)");
   encontrar_espacio_blanco(P,FF,CC);
   Put_Line(FF'img & "," & CC'img);

   new_line(2);

   -- Caso 3 - Espacio en blanco al final
   P := (
      (5,9,7,4,1,8,3,2,6),
      (6,3,1,7,5,2,9,4,8),
      (4,8,2,6,3,9,1,7,5),
      (8,1,9,3,4,7,6,5,2),
      (3,6,4,2,9,5,8,1,7),
      (2,7,5,8,6,1,4,3,9),
      (7,2,6,1,8,3,0,0,0),
      (9,4,3,5,2,6,0,0,0),
      (1,5,8,9,7,4,0,0,0)
   );
   Put_Line("Sudoku:");
   Put_Line("5 9 7 4 1 8 3 2 6");
   Put_Line("6 3 1 7 5 2 9 4 8");
   Put_Line("4 8 2 6 3 9 1 7 5");
   Put_Line("8 1 9 3 4 7 6 5 2");
   Put_Line("3 6 4 2 9 5 8 1 7");
   Put_Line("2 7 5 8 6 1 4 3 9");
   Put_Line("7 2 6 1 8 3 0 0 0");
   Put_Line("9 4 3 5 2 6 0 0 0");
   Put_Line("1 5 8 9 7 4 0 0 0");
   new_line;
   Put_Line("Coordenada superior izquierda donde se encuentra el espacio en blanco: (7,7)");
   encontrar_espacio_blanco(P,FF,CC);
   Put_Line(FF'img & "," & CC'img);


   -----------------------------
   -- rotar_matriz_derecha_90 --
   -----------------------------
   new_line(3);
   Put_Line("***** rotar_matriz_derecha_90 *****");
   new_line;

   -- Caso 1
   ficha:= (
      (1,2,3),
      (4,5,6),
      (7,8,9)
   );
   Put_Line("La ficha: ");
   Put_Line("1 2 3");
   Put_Line("4 5 6");
   Put_Line("7 8 9");
   Put_Line("Rotada 90 grados a la derecha quedaria:");
   Put_Line("7 4 1");
   Put_Line("8 5 2");
   Put_Line("9 6 3");
   rotar_matriz_derecha_90(ficha);
   Put_Line("Resultado: ");
   mostrar_ficha(ficha);

   new_line(2);

   -- Caso 2
   ficha:= (
      (1,1,1),
      (2,2,2),
      (3,3,3)
   );
   Put_Line("La ficha: ");
   Put_Line("1 1 1");
   Put_Line("2 2 2");
   Put_Line("3 3 3");
   Put_Line("Rotada 90 grados a la derecha quedaria:");
   Put_Line("3 2 1");
   Put_Line("3 2 1");
   Put_Line("3 2 1");
   rotar_matriz_derecha_90(ficha);
   Put_Line("Resultado: ");
   mostrar_ficha(ficha);


   ---------------------
   -- filas_correctas --
   ---------------------
   new_line(3);
   Put_Line("***** filas_correctas *****");
   new_line;

   -- Caso 1: Insercion en el primer panel
   P:= (
      (0,0,0,1,2,6,7,3,5),
      (0,0,0,4,9,8,6,2,1),
      (0,0,0,7,3,5,8,9,4),
      (3,8,9,6,1,2,4,5,7),
      (5,4,1,3,7,9,2,6,8),
      (2,6,7,5,8,4,3,1,9),
      (9,2,4,8,6,1,5,7,3),
      (1,7,5,2,4,3,9,8,6),
      (8,3,6,9,5,7,1,4,2)
   );
   ficha := (
      (4,9,8),
      (7,5,3),
      (6,1,2)
   );
   Put_Line("Se puede implementar la ficha");
   new_line;
   Put_Line("4 9 8");
   Put_Line("7 5 3");
   Put_Line("6 1 2");
   new_line;
   Put_Line("En el sudoku");
   new_line;
   Put_Line("0 0 0 1 2 6 7 3 5");
   Put_Line("0 0 0 4 9 8 6 2 1");
   Put_Line("0 0 0 7 3 5 8 9 4");
   Put_Line("3 8 9 6 1 2 4 5 7");
   Put_Line("5 4 1 3 7 9 2 6 8");
   Put_Line("2 6 7 5 8 4 3 1 9");
   Put_Line("9 2 4 8 6 1 5 7 3");
   Put_Line("1 7 5 2 4 3 9 8 6");
   Put_Line("8 3 6 9 5 7 1 4 2 ? TRUE");
   Put_Line(filas_correctas(P, ficha, 1, 1)'img);

   new_line(2);

   -- Caso 2: Insercion en el panel del medio

   P:= (
      (6,7,3,5,9,4,2,1,8),
      (4,9,2,8,1,6,7,5,3),
      (5,1,8,3,7,2,6,4,9),
      (3,6,7,0,0,0,4,2,1),
      (9,2,1,0,0,0,8,3,5),
      (8,5,4,0,0,0,9,7,6),
      (1,4,6,2,3,9,5,8,7),
      (2,8,5,7,6,1,3,9,4),
      (7,3,9,4,5,8,1,6,2)
   );
   ficha := (
      (1,2,3),
      (4,5,6),
      (7,8,9)
   );

   Put_Line("Se puede implementar la ficha");
   new_line;
   Put_Line("1 2 3");
   Put_Line("4 5 6");
   Put_Line("7 8 9");
   new_line;
   Put_Line("En el sudoku");
   new_line;
   Put_Line("6 7 3 5 9 4 2 1 8");
   Put_Line("4 9 2 8 1 6 7 5 3");
   Put_Line("5 1 8 3 7 2 6 4 9");
   Put_Line("3 6 7 0 0 0 4 2 1");
   Put_Line("9 2 1 0 0 0 8 3 5");
   Put_Line("8 5 4 0 0 0 9 7 6");
   Put_Line("1 4 6 2 3 9 5 8 7");
   Put_Line("2 8 5 7 6 1 3 9 4");
   Put_Line("7 3 9 4 5 8 1 6 2 ? FALSE");
   Put_Line(filas_correctas(P, ficha, 4, 4)'img);

   new_line(2);

   -- Caso 3: Insercion en el panel del final

   P:= (
      (7,9,5,4,1,2,3,8,6),
      (8,4,3,5,6,9,2,1,7),
      (6,1,2,8,7,3,4,5,9),
      (2,3,1,7,9,5,8,6,4),
      (9,7,4,1,8,6,5,2,3),
      (5,6,8,2,3,4,9,7,1),
      (1,2,6,9,4,8,0,0,0),
      (3,5,9,6,2,7,0,0,0),
      (4,8,7,3,5,1,0,0,0)
   );
   ficha := (
      (7,3,5),
      (1,4,8),
      (6,9,2)
   );

   Put_Line("Se puede implementar la ficha");
   new_line;
   Put_Line("7 3 5");
   Put_Line("1 4 8");
   Put_Line("6 9 2");
   new_line;
   Put_Line("En el sudoku");
   new_line;
   Put_Line("7 9 5 4 1 2 3 8 6");
   Put_Line("8 4 3 5 6 9 2 1 7");
   Put_Line("6 1 2 8 7 3 4 5 9");
   Put_Line("2 3 1 7 9 5 8 6 4");
   Put_Line("9 7 4 1 8 6 5 2 3");
   Put_Line("5 6 8 2 3 4 9 7 1");
   Put_Line("1 2 6 9 4 8 0 0 0");
   Put_Line("3 5 9 6 2 7 0 0 0");
   Put_Line("4 8 7 3 5 1 0 0 0 ? TRUE");
   Put_Line(filas_correctas(P, ficha, 7, 7)'img);

END laboratorio07b_pruebas;