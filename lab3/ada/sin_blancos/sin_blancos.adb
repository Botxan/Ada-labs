WITH Ada.Text_IO;
USE Ada.Text_IO;
PROCEDURE sin_blancos IS
   char: Character;
   cuenta_espacios: Integer := 0;
BEGIN

   -- Entrada: una serie de caracteres
   -- Pre: la serie termina en '.'
   -- Salida: una serie de caracteres
   -- Post: la serie de salida contiene los mismos caracteres
   --       que la entrada sin los espacios en blanco (incluido el punto)

   put("Introduzca caracteres hasta introducir un punto: ");
   get(char);

   WHILE char /= '.' LOOP
      if char /= ' ' then
         put(char);
      else
         cuenta_espacios := cuenta_espacios + 1;
      end if;
      get(char);
   END LOOP;

   new_line;
   put("Espacios eliminados: " & Integer'Image(cuenta_espacios));

END sin_blancos;