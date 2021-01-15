With Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, nt_console, Laboratorio10.extra;
Use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, nt_console, Laboratorio10.extra;

-- Unicamente estan escritos los subprogramas necesarios
-- El resto de subprogramas necesarios estan definidos en el Laboratorio10.extra

package body Laboratorio10 is

   ----------------
   -- Es_Lateral --
   ----------------

   function Es_Lateral (Img:in T_Imagen; Fil,Col:in Positive) return Boolean
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Es_Lateral unimplemented");
      raise Program_Error with "Unimplemented function Es_Lateral";
      return Es_Lateral (Img, Fil, Col);
   end Es_Lateral;

   ----------------
   -- Es_Esquina --
   ----------------

   function Es_Esquina (Img:in T_Imagen; Fil,Col:in Positive) return Boolean
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Es_Esquina unimplemented");
      raise Program_Error with "Unimplemented function Es_Esquina";
      return Es_Esquina (Img, Fil, Col);
   end Es_Esquina;

   -----------------
   -- Es_Interior --
   -----------------

   function Es_Interior (Img: in T_Imagen; Fil,Col: in Positive) return Boolean
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Es_Interior unimplemented");
      raise Program_Error with "Unimplemented function Es_Interior";
      return Es_Interior (Img, Fil, Col);
   end Es_Interior;

   ------------------
   -- Imagen_vacia --
   ------------------

   function Imagen_vacia (filas,columnas: in Integer) return T_Imagen is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Imagen_vacia unimplemented");
      raise Program_Error with "Unimplemented function imagen_vacia";
      return Imagen_vacia (filas, columnas);
   end Imagen_vacia;

   -------------
   -- Mostrar --
   -------------

   procedure Mostrar (Img: in T_Imagen) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Mostrar unimplemented");
      raise Program_Error with "Unimplemented procedure Mostrar";
   end Mostrar;

   --------------------
   -- Contar_cuadros --
   --------------------

   procedure Contar_cuadros
     (Img: in T_Imagen;
      Fil, Col: in Integer;
      Contador: out T_contador)
   is
   begin
      -- Inicializar contadores
      Contador := (others => 0);

      -- Comprobar si fil y col son validas
      if Fil in Img'First(1)..Img'Last(1) and Col in Img'First(2)..Img'Last(2) then
         for i in -1..1 loop
            for j in -1..1 loop
               -- Computar solo las casillas circundantes existentes/validas
               if Fil+i >= Img'First(1) and Fil+i <= Img'Last(1) and Col+j >= Img'First(2) and Col+j <= Img'Last(2) then
                  Contador(Img(Fil+i, Col+j)) := Contador(Img(Fil+i, Col+j)) + 1;
               end if;
            end loop;
         end loop;
      else
         raise CONSTRAINT_ERROR with "La casilla introducida no es valida";
      end if;
   end Contar_cuadros;

   --------------
   -- Completa --
   --------------

   function Completa (Img: in T_Imagen) return Boolean is
      resuelto: Boolean := True;
      i: Integer := Img'First(1);
      j: Integer;
   begin
      while resuelto and i <= Img'Last(1) loop
         j := Img'First(2);
         while resuelto and j <= Img'Last(2) loop
            resuelto := Img(i, j) /= Duda;
            j := j + 1;
         end loop;
         i := i + 1;
      end loop;

      return resuelto;
   end Completa;

   --------------
   -- Colorear --
   --------------

   procedure Colorear (Img: in out T_Imagen; P: in T_Pista) is
      val: T_Casilla := Blanco;
      cont: T_Contador;
   begin
      Contar_Cuadros(Img, P.Fil, P.Col, cont);

      -- Evaluar el color a utilizar
      if cont(Blanco) = P.Valor then
         val := Negro;
      elsif cont(Negro) - (cont(Blanco) + cont(Duda)) = P.Valor or
            (cont(Duda) = P.Valor and cont(Blanco) = 0) or
            cont(Blanco) + cont(Duda) = P.Valor then
         val := Blanco;
      else
         raise PROGRAM_ERROR with "La pista a colorear no se puede resolver";
      end if;

      -- Cambiar todas las casillas de Duda al nuevo valor
      for i in -1..1 loop
         for j in -1..1 loop
            -- Comprobar que la casilla existe y es Duda
            if ( P.Fil+i >= Img'First(1) and P.Fil+i <= Img'Last(1) and
               P.Col+j >= Img'First(2) and P.Col+j <= Img'Last(2) ) and then
               Img(P.Fil+i, P.Col+j) = Duda then
               Img(P.Fil+i, P.Col+j) := val;
            end if;
         end loop;
      end loop;
   end Colorear;

   -------------
   -- Mostrar --
   -------------

   procedure Mostrar (L: in T_Lista_E_Pistas) is
   begin
      for i in L.Rest'First..L.Cont loop
         Put("(" & L.Rest(i).Fil'img & "," & L.Rest(i).Col'img & "): " & L.Rest(i).Valor'img );
         new_line;
      end loop;
   end Mostrar;

   ------------
   -- Anadir --
   ------------

   procedure Anadir (L: in out T_Lista_E_Pistas; P: in T_Pista) is
   begin
      L.Rest(L.Rest'First + L.Cont) := P;
      L.Cont := L.Cont + 1;
   end Anadir;

   ------------
   -- Borrar --
   ------------

   procedure Borrar (L: in out T_Lista_E_Pistas; P: in T_Pista) is
      i: Integer := L.Rest'First;
      encontrado: Boolean := False;
   begin
      -- Buscar la pista en la lista
      loop
         encontrado := L.Rest(i).Fil = P.Fil and L.Rest(i).Col = P.Col;
         exit when i > L.Cont or encontrado;
         i := i + 1;
      end loop;

      -- Desplazar la lista para borrar el elemento
      L.Rest(i..L.cont-1) := L.Rest(i+1..L.cont);
      L.cont := L.cont - 1;
   end Borrar;

   ------------------
   -- Buscar_Pista --
   ------------------

   procedure Buscar_Pista
     (Lp: in T_Lista_E_Pistas;
      Img: in T_Imagen;
      P: out T_Pista)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Buscar_Pista unimplemented");
      raise Program_Error with "Unimplemented procedure Buscar_Pista";
   end Buscar_Pista;

   --------------
   -- longitud --
   --------------

   function longitud (L:in T_Lista_D_Pistas) return Natural is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "longitud unimplemented");
      raise Program_Error with "Unimplemented function longitud";
      return longitud (L);
   end longitud;

   ------------
   -- Anadir --
   ------------

   procedure Anadir (L: in out T_Lista_D_Pistas; P: in T_Pista) is
      L_aux: T_Lista_D_Pistas;
   begin
      if L = null then
         L := new T_Nodo_Pista'(P, null);
      else
         L_aux := L;
         while L_aux.sig /= null loop
            L_aux := L_aux.sig;
         end loop;
         L_aux.sig := new T_Nodo_Pista'(P, null);
      end if;
   end Anadir;

   ----------------
   -- Concatenar --
   ----------------

   procedure Concatenar (L1,L2: in out T_Lista_D_Pistas) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Concatenar unimplemented");
      raise Program_Error with "Unimplemented procedure Concatenar";
   end Concatenar;

   -------------
   -- Mostrar --
   -------------

   procedure Mostrar (L: in T_Lista_D_Pistas) is
      L_aux: T_Lista_D_Pistas := L;
   begin
      while L_aux /= null loop
            Put_Line("(" & L_aux.Pista.Fil'img & "," & L_aux.Pista.Col'img & "): " & L_aux.Pista.Valor'img);
            L_aux := L_aux.sig;
      end loop;
   end Mostrar;

   -------------------
   -- Iniciar_Juego --
   -------------------

   procedure Iniciar_Juego
     (Ruta: in String;
      filas,columnas:  out Integer;
      Lp :  out T_Lista_E_Pistas)
   is
      fichero: File_Type;
      casilla: Character;
      i, j: Integer := 1;
   begin
      -- Preparar el fichero de entrada del tablero
      Open(fichero, In_File, Ruta & ".txt");
      -- Obtener las dimensiones del tablero
      get(fichero, filas);
      get(fichero, columnas);

      skip_line(fichero);

      -- Obtener las pistas
      Lp.Cont := 0;
      loop
         j := 1;
         loop
            get(fichero, casilla);
            if casilla in '0'..'9' then
               Anadir(LP, (i, j, Character'Pos(casilla) - 48));
            end if;
            exit when end_of_line(fichero);
            j := j + 1;
         end loop;
         exit when end_of_file(fichero);
         skip_line(fichero);
         i := i + 1;
      end loop;
      Close(fichero);
   end Iniciar_Juego;

   -------------------
   -- Guardar_Juego --
   -------------------

   procedure Guardar_Juego
     (filename: in String;
      fils,cols:  in Integer;
      Lp :  in T_Lista_e_Pistas;
      Ls :  in T_lista_D_Pistas)
   is
      fichero: file_type;
      ls_cont: Integer := 0;
      Ls_aux: T_Lista_D_Pistas := Ls;
   begin
      -- Detener guardado si no se especifica el nombre del archivo
      if filename = "" then
         clear_screen;
         Set_Foreground(Red);
         Put_Line("No se ha encontrado una partida");
         Set_Foreground(Gray);
         new_line;
         return;
      end if;

      -- Crear archivo
      Create(fichero, Out_File, filename & ".game");

      -- Escribir filas y columnas
      Put(fichero, fils, 0); Put(fichero, ' '); Put(fichero, cols, 0);
      new_line(fichero);

      -- Escribir cantidad de pistas restantes
      Put(fichero, Lp.Cont, 0);
      new_line(fichero);

      -- Escribir pistas restantes
      if Lp.Cont > 0 then
         for i in 1..Lp.Cont loop
            Put(fichero, Lp.Rest(i).Fil, 0); Put(fichero, ' '); Put(fichero, Lp.Rest(i).Col, 0); Put(fichero, ' '); Put(fichero, Lp.Rest(i).Valor, 0);
            -- Evitar el espacio final
            if i < Lp.Cont then
               Put(fichero, ' ');
            end if;
         end loop;
      end if;
      new_line(fichero, 2);

      -- Escribir cantidad de pistas resueltas
      while Ls_aux /= null loop
         ls_cont := ls_cont + 1;
         Ls_aux := Ls_aux.sig;
      end loop;
      Put(fichero, ls_cont, 0);

      -- Escribir pistas resueltas
      Ls_aux := Ls;
      while Ls_aux /= null loop
         Put(fichero, Ls_aux.Pista.Fil'img & Ls_aux.Pista.Col'img & Ls_aux.Pista.Valor'img);
         Ls_aux := Ls_aux.sig;
      end loop;
      Close(fichero);
   end Guardar_Juego;

   --------------------
   -- Reanudar_Juego --
   --------------------

   procedure Reanudar_Juego
     (filename: in String;
      filas, columnas:  out Integer;
      Lp :  out T_Lista_e_Pistas;
      Ls :  out T_lista_D_Pistas)
   is
      fichero: File_Type;
      num: Integer;
      Ls_aux: T_Lista_D_Pistas;
   begin
      -- Detener programa si no se especifica el nombre del archivo
      if filename = "" then
         clear_screen;
         Set_Foreground(Red);
         Put_Line("No se ha encontrado una partida guardada");
         Set_Foreground(Gray);
         new_line;
         return;
      end if;

      -- Abrir el archivo de entrada del tablero
      Open(fichero, In_File, filename & ".game");

      -- Obtener las dimensiones del tablero
      get(fichero, filas);
      get(fichero, columnas);

      skip_line(fichero, 2);

      -- Cargar lista de pistas restantes
      Lp.cont := 0;
      while not end_of_line(fichero) loop
         Lp.Cont := Lp.Cont + 1;
         get(fichero, Lp.Rest(Lp.Cont).fil);
         get(fichero, Lp.Rest(Lp.Cont).Col);
         get(fichero, Lp.Rest(Lp.Cont).Valor);
      end loop;

      skip_line;

      -- Cargar lista de pistas resueltas
      get(fichero, num);
      if num > 0 then
         -- Cargar la primera pista para vincular las listas dinamicas
         Ls_aux := new T_Nodo_Pista;
         Ls := Ls_aux;
         loop
            get(fichero, Ls_aux.Pista.Fil);
            get(fichero, Ls_aux.Pista.Col);
            get(fichero, Ls_aux.Pista.Valor);
            exit when end_of_line(fichero);
            Ls_aux.sig := new T_Nodo_Pista;
            Ls_aux := Ls_aux.sig;
         end loop;
      end if;

      -- Cerrar fichero
      Close(fichero);

   end Reanudar_Juego;

   -------------------------
   -- Es_Posible_Resolver --
   -------------------------

   function Es_Posible_Resolver
     (Img: in T_Imagen;
      P: in T_Pista)
      return Boolean
   is
      cont: T_Contador;
   begin
      Contar_Cuadros(Img, P.Fil, P.Col, cont);
      return cont(Blanco) = P.Valor or -- Todas los blancos encontrados
             cont(Blanco) + cont(Duda) = P.Valor or -- Faltan algunos blancos y encontrados todos los negros
             cont(Negro) - (cont(Blanco) + cont(Duda)) = P.Valor or
             (cont(Duda) = P.Valor and cont(Blanco) = 0);
   end Es_Posible_Resolver;

   -------------------
   -- Obtener_Pista --
   -------------------

   procedure Obtener_Pista
     (Filas,Columnas: in Integer;
      Lp: in T_Lista_E_Pistas;
      P: out T_Pista)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Obtener_Pista unimplemented");
      raise Program_Error with "Unimplemented procedure Obtener_Pista";
   end Obtener_Pista;

   --------------
   -- Resolver --
   --------------

   function Resolver
     (Filas, Columnas: in Integer;
      Lp: in T_Lista_E_Pistas)
      return T_Imagen
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Resolver unimplemented");
      raise Program_Error with "Unimplemented function Resolver";
      return Resolver (Filas, Columnas, Lp);
   end Resolver;

   ------------
   -- Fase_1 --
   ------------

   procedure Fase_1
     (filas, columnas: in Integer;
      Lp:in out T_Lista_E_Pistas;
      Sol: out T_Lista_D_Pistas)
   is
      Img: T_Imagen(1..filas, 1..columnas) := (others => (others => Duda));
      i: Integer := 1;
      decision: Character;
      Lp_const: constant T_Lista_E_Pistas := Lp;
      vel: Float;
   begin
      -- Decision: comenzar juego
      loop
         -- Mostrar escenario inicial
         Put_Line("Resolucion semiautomatica");
         new_line;
         Mostrar(Img, Lp, Sol);
         new_line;
         Put_Line("+=========================================================================================+");
         Put_Line("                                    *  Instrucciones  *                                    ");
         new_line;
         Put_Line(" * El programa solucionara el tablero. El usuario tiene 3 opciones en cada paso:");
         Put_Line(" S -> El programa muestra el siguiente paso");
         Put_Line(" N -> Volver al menu principal");
         Put_Line(" A -> Se cambia el modo a resolucion automatica.");
         Put_Line("      El programa resuelve las pistas restantes a la velocidad introducida por el usuario.");
         Put_Line("+=========================================================================================+");
         new_line;
         Put("Comenzar juego? [S/N]");
         get_immediate(decision);
         if decision = 's' or decision = 'n' then
            decision := Character'Val(Character'Pos(decision) - 32);
         end if;
         exit when decision = 'S' or decision= 'N';
         clear_screen;
      end loop;

      -- Respuesta decision 'N': abandonar juego
      if decision = 'N' then
         clear_screen;
         return;
      end if;

      -- Comenzar a resolver la imagen
      -- Hasta que no haya pistas o las que queden sean irresolubles
      while Lp.cont > 0 and i <= Lp.cont loop
         -- Mostrar situacion actual de la imagen
         -- Refrescar pantalla solo si la imagen ha cambiado
         if i = 1 then
            clear_screen;
            Put("Resolucion");
            if decision = 'A' then
               Put_Line(" automatica");
            else
               Put_Line(" semiautomatica");
            end if;
            new_line;
            Mostrar(Img, Lp, Sol);

            -- Decision: mostrar siguiente paso
            if decision /= 'A' then
               new_line;
               Put("Siguiente paso?[S/N/A][Por defecto S]");
               get_immediate(decision);

               if decision = 'N' or decision = 'n' then -- Abandonar juego
                  clear_screen;
                  return;
               elsif decision = 'A' or decision = 'a' then -- Resolucion automatica
                  decision := 'A';
                  -- Seleccionar tasa de refresco de la imagen
                  new_line;
                  Put("Selecciona la velocidad (s): ");
                  get(vel);
               end if;
            end if;

            delay Duration(vel);

            if decision = 'A' then
               Put_Line("Resolviendo...");
            end if;
         end if;

         -- Resolver pista
         if Es_Posible_Resolver(Img, Lp.Rest(i)) then -- Pista resoluble

            -- Colorear/solucionar la pista
            Colorear(Img, Lp.Rest(i));

            -- Guardar pista en la solucion
            Anadir(Sol, Lp.Rest(i));

            -- Eliminar pista de las restantes y volver al principio
            Borrar(Lp, Lp.Rest(i));
            i := 1;

         else -- Pista no resoluble
            i := i + 1;
         end if;
      end loop;

      -- Juego terminado
      clear_screen;
      Mostrar(Img, Lp, Sol);
      new_line;

      Put_Line("*** FIN DEL JUEGO ***");
      if Completa(img) then
         Set_Foreground(Green);
         Put_Line(" *Tablero resuelto* ");
      else
         Set_Foreground(Red);
         Put_Line("*Tablero irresoluble*");
      end if;
      Set_Foreground(Gray);

      new_line(2);

      -- Decision: mostrar pistas
      loop
         Put("Mostrar pistas resueltas? [S/N]");
         get_immediate(decision);
         new_line;
         if decision = 's' or decision = 'n' then
            decision := Character'Val(Character'Pos(decision) - 32);
         end if;
         exit when decision = 'S' or decision= 'N';
      end loop;

      if decision = 'N' then
         clear_screen;
         return;
      else
         -- Mostrar las pistas
         Put_Line("Pistas resueltas:");
         new_line;
         Mostrar(Sol);
         new_line(2);
      end if;
   end Fase_1;

   ------------
   -- Fase_2 --
   ------------

   procedure Fase_2
     (filas, columnas: in Integer;
      Lp: in out T_Lista_E_Pistas;
      Sol: in out T_Lista_D_Pistas)
   is
      Img: T_Imagen(1..filas, 1..columnas) := (others => (others => Duda));
      decision: Character;
      i: Integer := 1;
      j: Integer;
      x, y: Integer;
      encontrada: Boolean;
      resoluble: Boolean;
      Sol_aux: T_Lista_D_Pistas;
   begin
      -- Si se carga una partida
      if Sol /= null then
         Sol_aux := Sol;

         while Sol_aux /= null loop
            Colorear(Img, Sol_aux.Pista);
            Sol_aux := Sol_aux.sig;
         end loop;
      end if;

      -- Decision: comenzar juego
      loop
         -- Mostrar escenario inicial
         Mostrar(Img, Lp, Sol);
         new_line;
         Put_Line("+===========================================================================================+");
         Put_Line("                                     *  Instrucciones  *                                      ");
         new_line;
         Put_Line(" * El programa le asistira con la resolucion del tablero.");
         Put_Line(" * El usuario escribe la cordenada de la pista que desea resolvera.");
         Put_Line(" * El programa resolvera la pista si esta es resoluble.");
         Put_Line(" * El juego finaliza cuando no quedan pistas por resolver o las que quedan son irresolubles.");
         Put_Line(" * Para volver al menu principal el usuario debe introducir las coordenadas (-1 -1).");
         Put_Line("+===========================================================================================+");
         new_line;

         If sol = null then
            Put("Comenzar juego? [S/N]");
         else
            Put("Reanudar juego? [S/N]");
         end if;

         get_immediate(decision);
         if decision = 's' or decision = 'n' then
            decision := Character'Val(Character'Pos(decision) - 32);
         end if;
         exit when decision = 'S' or decision= 'N';
         clear_screen;
      end loop;

      -- Respuesta decision 'N': abandonar juego
      if decision = 'N' then
         clear_screen;
         return;
      end if;

      clear_screen;

      -- Decision: seleccionar pista (coordenadas)
      loop
         -- Comprobar si existe alguna pista resoluble
         -- Eliminar pistas que se hayan solucionado al solucionar otras pistas
         resoluble := False;
         i := 1;
         while i <= Lp.cont and not resoluble loop
            if Pista_Resuelta(Img, Lp.Rest(i)) then
               Anadir(Sol, Lp.Rest(i));
               Borrar(Lp, Lp.Rest(i));
            else
               resoluble := Es_Posible_Resolver(Img, Lp.Rest(i));
               i := i + 1;
            end if;
         end loop;
         exit when Lp.cont = 0 or (Lp.cont > 0 and not resoluble);
         Put_Line("Resolucion asistida");
         new_line;
         Mostrar(Img, Lp, Sol);
         new_line;
         loop
            begin
               Put("Introduce una pista [x y] (-1 -1 -> Menu principal): ");
               get(x);
               get(y);
               exit;
            exception
               when Data_Error =>
                  clear_screen;
                  Put_Line("Resolucion asistida");
                  new_line;
                  Mostrar(Img, Lp, Sol);
                  new_line;
                  Put_Line("Coordenadas invalidas. Intentelo de nuevo.");
                  Skip_Line;
            end;
         end loop;

         -- Volver al menu principal
         if x = -1 and x = -1 then
            clear_screen;
            return;
         end if;

         clear_screen;

         if y in 1..filas and x in 1..columnas then
            if Existe(Lp, y, x) then -- La pista esta por resolver
                  -- Buscar la pista en la lista de pistas borrables
                  encontrada := False;
                  j := 1;
                  loop
                     encontrada := Lp.Rest(j).Fil = y and Lp.Rest(j).Col = x;
                     exit when j > Lp.Rest'Last or encontrada;
                     j := j + 1;
                  end loop;

                  -- Comprobar si se puede resolver
                  if Es_Posible_Resolver(Img, Lp.Rest(j)) then
                     -- Colorear/solucionar la pista
                     Colorear(Img, Lp.Rest(j));

                     -- Guardar pista en la solucion
                     Anadir(Sol, Lp.Rest(j));

                     -- Eliminar pista del estado actual y volver al principio
                     Borrar(Lp, Lp.Rest(j));
                  else
                     Set_Foreground(Red);
                     Put_Line("La pista seleccionada no se puede resolver");
                  end if;
            elsif Existe(Sol, y, x) then -- La pista esta resuelta
               Set_Foreground(Yellow);
               Put_Line("La pista seleccionada ya ha sido resuelta");
            else -- No existe una pista en las coordenadas indicadas
               Set_Foreground(Red);
               Put_Line("Las coordenadas introducidas no contienen una pista");
            end if;
         else
            Set_Foreground(Red);
            Put_Line("Introduzca unas coordenadas validas");
         end if;
         -- Volver al color por defecto
         Set_Foreground(Gray);
      end loop;

      -- Juego terminado
      clear_screen;
      Mostrar(Img, Lp, Sol);
      new_line;

      Put_Line("*** FIN DEL JUEGO ***");

      if Completa(img) then
         Set_Foreground(Green);
         Put_Line(" *Tablero resuelto* ");
      else
         Set_Foreground(Red);
         Put_Line("*Tablero irresoluble*");
      end if;
      Set_Foreground(Gray);

      new_line(2);

      -- Decision: mostrar pistas
      loop
         Put("Mostrar pistas resueltas? [S/N]");
         get_immediate(decision);
         new_line;
         if decision = 's' or decision = 'n' then
            decision := Character'Val(Character'Pos(decision) - 32);
         end if;
         exit when decision = 'S' or decision= 'N';
      end loop;

      if decision = 'N' then
         clear_screen;
         return;
      else
         -- Mostrar las pistas
         Put_Line("Pistas resueltas:");
         new_line;
         Mostrar(Sol);
         new_line(2);
      end if;
   end Fase_2;
end Laboratorio10;
