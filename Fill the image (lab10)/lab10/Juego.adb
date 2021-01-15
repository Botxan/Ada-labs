with Laboratorio10, Ada.Text_io, Ada.Integer_Text_IO, Ada.Directories, nt_console;
use Laboratorio10, Ada.Text_io, Ada.Integer_Text_IO, Ada.Directories, nt_console;
procedure Juego is
   L_Pistas: T_Lista_E_Pistas;
   F,C:Integer;
   Solucion: T_Lista_D_Pistas := null;
   Opcion: Integer;
   dir_tableros: constant String := "./tableros/";
   dir_guardados: constant String := "./partidas_guardadas/";
   long_original: Natural;
   type T_nombre_Fichero is record
      name: String(1..100);
      long: Natural;
   end record;
   nombre_fichero: T_nombre_Fichero;

   procedure Seleccionar_fichero (Directorio, Extension: in String; nombre_fichero:out T_nombre_Fichero) is
      Ficheros: Search_Type;
      type T_L_Ficheros is array (1..9) of Directory_Entry_Type;
      L_Juegos: T_L_Ficheros;
      I: Integer;
      Opcion: Integer;
   begin
      nombre_fichero.Long := 0;
      loop
         I := 0;
         Start_Search(Search=>Ficheros,
            Directory=>Directorio,
            Pattern=>"*." & Extension,
            Filter=>(Ordinary_File=>True, others=>False));
         while More_Entries(Ficheros) and I < 9 loop
            I := I + 1;
            Get_Next_Entry(Ficheros, L_Juegos(I));
            Put(I,2);Put(" ");
            Put_line(Simple_name(L_Juegos(I)));
         end loop;
         New_Line;
         Put("Elige una opcion [0 para salir]->");
         Get(Opcion);
         exit when Opcion in 0..I;
         Put_Line("ERROR: Se esperaba un numero entre 0 y"&I'Img);
         New_Line;
      end loop;
      if Opcion >0 then
         nombre_fichero.long := Base_Name(Simple_Name(L_Juegos(Opcion)))'length;
         nombre_fichero.name(1..nombre_fichero.long) := Base_Name(Simple_Name(L_Juegos(Opcion)));
       end if;
   end Seleccionar_Fichero;
begin
   Put_Line("              :::::::::: ::::::::::: :::        :::                         ");
   Put_Line("              :+:            :+:     :+:        :+:                         ");
   Put_Line("              +:+            +:+     +:+        +:+                         ");
   Put_Line("              :#::+::#       +#+     +#+        +#+                         ");
   Put_Line("              +#+            +#+     +#+        +#+                         ");
   Put_Line("              #+#            #+#     #+#        #+#                         ");
   Put_Line("              ###        ########### ########## ##########                  ");
   Put_Line("                                   :::                                      ");
   Put_Line("                                 :+: :+:                                    ");
   Put_Line("                                +:+   +:+                                   ");
   Put_Line("                 +#++:++#++:++ +#++:++#++: +#++:++#++:++                    ");
   Put_Line("                               +#+     +#+                                  ");
   Put_Line("                               #+#     #+#                                  ");
   Put_Line("                               ###     ###                                  ");
   Put_Line("::::::::: ::::::::::: :::::::: ::::::::::: :::    ::: :::::::::  :::::::::: ");
   Put_Line(":+:    :+:    :+:    :+:    :+:    :+:     :+:    :+: :+:    :+: :+:        ");
   Put_Line("+:+    +:+    +:+    +:+           +:+     +:+    +:+ +:+    +:+ +:+        ");
   Put_Line("+#++:++#+     +#+    +#+           +#+     +#+    +:+ +#++:++#:  +#++:++#   ");
   Put_Line("+#+           +#+    +#+           +#+     +#+    +#+ +#+    +#+ +#+        ");
   Put_Line("#+#           #+#    #+#    #+#    #+#     #+#    #+# #+#    #+# #+#        ");
   Put_Line("###       ########### ########     ###      ########  ###    ### ########## ");
   new_line;
   loop
      loop
         Put_Line("     +================+");
         Put_Line("     | MENU PRINCIPAL |");
         Put_Line("     +================+");
         New_Line;
         Put_Line("[1] Resolver juego automaticamente");
         Put_Line("[2] Elegir y jugar a un juego");
         Put_Line("[3] Reanudar juego guardado");
         Put_Line("[4] Guardar juego");
         New_Line;
         Put("Elige una opcion [0 para salir]-> ");
         Get(Opcion);
         exit when Opcion in 0..4;
         Put_Line("ERROR: Se esperaba un numero entre 0 y 4");
         New_Line;
      end loop;
      exit when Opcion = 0;
      clear_screen;
      case Opcion is
         when 1 =>
            -- Resolucion automatica
            Put_Line("Tableros disponibles:");
            new_line;
            Seleccionar_fichero(dir_tableros,"txt",nombre_fichero);
            if Nombre_Fichero.Long = 0 then
               clear_screen;
            else
               Put_Line("Cargando " & nombre_Fichero.name(1..nombre_fichero.long) &"..."); New_Line;
               Iniciar_Juego(dir_tableros&nombre_Fichero.name(1..nombre_fichero.long),F,C,L_Pistas);
               Solucion := null; -- eliminar solucion en cache
               delay 0.7;
               clear_screen;
               Fase_1(F,C,L_Pistas,Solucion);
            end if;
         when 2 =>
            -- Resolucion asistida
            Put_Line("Tableros disponibles:");
            new_line;
            Seleccionar_fichero(dir_tableros,"txt",nombre_fichero);
            if Nombre_Fichero.Long = 0 then
               clear_screen;
            else
               Put_Line("Cargando " & nombre_Fichero.name(1..nombre_fichero.long) &"..."); New_Line;
               Iniciar_Juego(dir_tableros&nombre_Fichero.name(1..nombre_fichero.long),F,C,L_Pistas);
               Solucion := null; -- eliminar solucion en cache
               delay 0.7;
               clear_screen;
               Fase_2(F,C,L_Pistas,Solucion);
            end if;
         when 3 =>
            -- Cargar juego
            Put_Line("Selecciona una partida:");
            new_line;
            Seleccionar_fichero(dir_guardados,"game", nombre_fichero);
            if Nombre_Fichero.Long = 0 then
               clear_screen;
            else
               Put_Line("Reanudando " & nombre_Fichero.name(1..nombre_fichero.long) &"..."); New_Line;
               delay 0.7;
               clear_screen;
               Reanudar_Juego(dir_guardados&nombre_Fichero.name(1..nombre_fichero.long),F,C,L_Pistas,Solucion);
               Fase_2(F,C,L_Pistas,Solucion);
            end if;
         when others =>
            -- Guardar juego
            long_original := nombre_fichero.long;
            while exists(compose(dir_guardados,nombre_Fichero.name(1..nombre_fichero.long),"game")) loop

               while exists(compose(dir_guardados,nombre_Fichero.name(1..nombre_fichero.long),"old.game")) loop
                  nombre_fichero.Name(1..nombre_fichero.long+4) := nombre_Fichero.name(1..nombre_fichero.long) & ".old";
                  nombre_fichero.Long := nombre_fichero.Long + 4;
               end loop;

               Put_Line("renombrando "& nombre_Fichero.name(1..nombre_fichero.long) &" a "&compose(dir_guardados,nombre_Fichero.name(1..nombre_fichero.long),"old.game")&"...");
               rename(compose(dir_guardados, nombre_Fichero.name(1..nombre_fichero.long)&".game"),compose(dir_guardados,nombre_Fichero.name(1..nombre_fichero.long),"old.game"));
               nombre_fichero.long := long_original;
            end loop;

            if Nombre_Fichero.Long /= 0 then
               Put_Line("Guardando "&compose(Current_Directory,nombre_Fichero.name(1..nombre_fichero.long),"game") & "...");
               Guardar_Juego(dir_guardados&nombre_Fichero.name(1..nombre_fichero.long), F,C,L_Pistas, Solucion);
               delay 0.7;
               Put_Line("Juego guardado!");
               new_line;
            end if;
      end case;
   end loop;
   new_line;
   Put_Line("Gracias por jugar!");
end Juego;