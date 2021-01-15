With Ada.Text_IO, nt_console;
Use Ada.Text_IO, nt_console;

package body Laboratorio10.extra is

   -------------
   -- Mostrar --
   -------------

   procedure Mostrar(Img: in T_Imagen; Le: in T_Lista_E_Pistas; Ld: T_Lista_D_pistas := null) is
      encontrada: Boolean;
      i: Integer;
      val: Character;
      Ld_aux: T_Lista_D_pistas;
      fila, columna: Natural;

      -- Subprograma para pintar una casilla
      procedure Pintar(Img: T_Imagen; Fil, Col: Integer; Val: Character) is
      begin
         case Img(fil, Col) is
            when blanco =>
               Set_Background(White);
               put(' ' & val);
            when negro =>
               Set_Background(Black);
               put(' ' & val);
            when duda =>
               Set_Background(Gray);
               put(' ' & val);
         end case;
         Set_Background(Black);
      end Pintar;

   begin
      Put("    ");
      -- Mostrar indices de columna
      for col in Img'Range(2) loop
         columna := col;
         while columna >= 10 loop
            columna := columna - 10;
         end loop;
         put(columna'img);
      end loop;

      new_line(2);


      for fil in Img'range(1) loop
         -- Mostrar indices de fila
         fila := fil;
         while fila >= 10 loop
            fila := fila - 10;
         end loop;
         Set_Foreground(Gray);
         put(fila'img & "  ");
         Set_Foreground(Cyan);
         -- Mostrar tablero
         for col in Img'range(2) loop
            -- Buscar pista en lista de pistas restantes
            encontrada := False;
            i := 1;
            val := ' ';
            while i <= Le.cont and not encontrada loop
               if Le.Rest(i).Fil = fil and Le.Rest(i).Col = col then
                  encontrada := True;
                  val := Character'Val((Le.Rest(i).Valor) + 48);
               end if;
               i := i + 1;
            end loop;

            if encontrada then
               Pintar(Img, fil, col, val);
            else
               -- Buscar en lista de pistas resueltas
               Ld_aux := Ld;
               while Ld_aux /= null and not encontrada loop
                  if Ld_aux.Pista.Fil = fil and Ld_aux.Pista.Col = col then
                     encontrada := True;
                     val := Character'Val((Ld_Aux.Pista.Valor) + 48);
                  end if;
                  Ld_aux := Ld_aux.sig;
               end loop;
               Pintar(Img, fil, col, val);
            end if;
         end loop;
         new_line;
      end loop;
      Set_Foreground(Gray);

   end Mostrar;

   ------------
   -- existe --
   ------------

   function Existe(L: in T_Lista_E_Pistas; Fil, Col: in Integer) return Boolean is
      i: Integer := 1;
      encontrada: Boolean := False;
   begin
      while i <= L.cont and not encontrada loop
         encontrada := L.Rest(i).Fil = Fil and L.Rest(i).Col = Col;
         i := i + 1;
      end loop;

      return encontrada;
   end Existe;

   ------------
   -- existe --
   ------------
   function Existe(L: in T_Lista_D_Pistas; Fil, Col: in Integer) return Boolean is
      L_aux: T_Lista_D_Pistas := L;
      encontrada: Boolean := False;
   begin
      while L_aux /= null and not encontrada loop
         encontrada := L_aux.Pista.Fil = Fil and L_aux.Pista.Col = Col;
         L_aux := L_aux.sig;
      end loop;

      return encontrada;
   end Existe;

   ------------------------------
   -- Comprobar_Pista_Resuelta --
   ------------------------------
   function Pista_Resuelta(Img: T_Imagen; P: in T_Pista) return Boolean is
      cont: T_Contador;
   begin
      contar_cuadros(Img, P.Fil, P.Col, cont);
      return cont(Blanco) = P.Valor and Cont(Duda) = 0;
   end;

end Laboratorio10.extra;