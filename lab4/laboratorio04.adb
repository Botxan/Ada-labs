WITH Ada.Text_IO, Ada.Integer_Text_IO;
USE Ada.Text_IO, Ada.Integer_Text_IO;

package body Laboratorio04 is

   -------------------------------------------------------------------
   -- Autor: oihan IRASTORZA CARRASCO
   -- Grupo: B
   -- Fecha: 13/10/2020
   -------------------------------------------------------------------


   --------------
   -- Digito_I --
   --------------

   function Digito_I (Num, I: in Natural) return T_Digito is
      num_dividiendo: Natural:= num; -- Copia de parametro in num para realizar operaciones
      length: Natural:= 0; -- Cantidad de digitos
   BEGIN
      -- Contador de digitos porque no puedo usar (o no existe) una function length()
      WHILE num_dividiendo /= 0 LOOP
         length := length + 1;
         num_dividiendo := num_dividiendo / 10;
      END LOOP;

      return (num / 10 ** (length-I)) rem 10;
   end Digito_I;

   --------------
   -- Digito_I --
   --------------

   procedure Digito_I (Num, I: in Natural; Dig_I: out T_Digito) is
   begin
      dig_i:= (num / 10 ** (I - 1)) rem 10;
   end Digito_I;

   --------------------
   -- Contar_Digitos --
   --------------------

   function Contar_Digitos (Num : in Positive) return Natural is
      num_mutable: Positive := num;
      contar_digitos: Natural := 0;
   begin

      loop
         contar_digitos := contar_digitos + 1;
         exit when num_mutable / 10 = 0;
         num_mutable := num_mutable / 10;
      end loop;

      return Contar_Digitos;
   end Contar_Digitos;

   --------------------
   -- Contar_Digitos --
   --------------------

   procedure Contar_Digitos (Num : in Positive; digitos: out Natural) is
      num_mutable: Positive := Num;
   begin

      digitos := 0; -- inicializar el contador

      loop
         digitos := digitos + 1;
         exit when num_mutable / 10 = 0;
         num_mutable := num_mutable / 10;
      end loop;
   end Contar_Digitos;

   ------------------------
   -- Iteracion_Kaprekar --
   ------------------------

   procedure Iteracion_Kaprekar (Num: in Natural; resultado: out Natural) is
      max_min, min_max: Natural := 0; -- de mayor a menor, y de menor a mayor
      count_max_min: Natural := 0; -- Para no tener que crear otro for, utilizare esta variable para ordenar el numero de mayor a menor
      tmp_num, digit: Natural;
   begin
      if contar_digitos(num) <= 4 then

         -- Comprobamos los numeros de 1 a 9 y si algun digito coincide con la i, lo vamos asignando a los numeros max_min y min_max
         for i in 0..9 loop
            tmp_num:= num; -- tmpNumber vuelve a ser todo el numero en cada iteracion

            while(tmp_num > 0) loop -- dividir el numero entre 10 hasta que no se pueda dividir mas
               digit := tmp_num mod 10; -- tomar el primer digito

               if (digit = i) then -- si coincide con el indice de la iteracion, a�adir el digito a min_max y max_min
                  -- orden de menor a mayor
                  min_max := min_max * 10 + digit;

                  -- orden de mayor a menor
                  max_min := max_min + digit * (10 ** count_max_min);
                  count_max_min := count_max_min + 1;
               end if;

               tmp_num:= tmp_num / 10;
            end loop;
         end loop;

         -- A�adirle los 0 correspondientes al numero maximo
         while contar_digitos(max_min) /= 4 loop
            max_min := max_min * 10;
         end loop;
         resultado := max_min - min_max;

      else
         raise constraint_error with "El numero introducido no tiene 4 digitos";
      end if;
   end Iteracion_Kaprekar;

   ----------------
   -- es_Capicua --
   ----------------

   function es_Capicua (Num: in Positive) return Boolean is
      es_capicua: Boolean := True;
      digitos: Natural;
   begin
      digitos := contar_digitos(num);
      put("Cantidad de digitos: " & Integer'Image(digitos));
      new_line;
      for I in 1..(digitos/2)+1 loop
         if (num / 10 ** (I-1) rem 10 ) /= (num / 10 ** (digitos - I) rem 10) then
            es_capicua := False;
            exit;
         end if;
      end loop;

      return es_capicua;
   end es_Capicua;

   --------------
   -- es_Omirp --
   --------------

   function es_Omirp (Num: in Positive) return Boolean is
      num_mutable: Natural := num;
      num_reverse: Natural := 0;
   begin
      while num_mutable > 0 loop
         num_reverse := num_reverse * 10 + (num_mutable mod 10);
         num_mutable := num_mutable / 10;
      end loop;

      if (num = 1) then
         return False;
      else
         for i in 2..num_reverse-1 loop
            if num /= i then
               if (num mod i = 0) or (num_reverse mod i = 0) then
                  return false;
               end if;
            end if;
         end loop;
      end if;

      return True;
   end es_Omirp;

   ---------------
   -- es_odioso --
   ---------------

   function es_odioso (Num: in Positive) return Boolean is
      num_mutable: Natural := num;
      count_1: Natural := 0;
   begin
      while num_mutable > 0 loop
         if num_mutable mod 2 = 1 then
            count_1 := count_1 + 1;
         end if;

         num_mutable := num_mutable / 2;
      end loop;

      if count_1 mod 2 = 1 then
        return true;
      else
         return false;
      end if;
   end es_odioso;

   ----------------------
   -- lleva_a_kaprekar --
   ----------------------

   procedure lleva_a_kaprekar is
      num: Integer; -- el numero introducido por el usuario
      resultado_kaprekar: Natural; -- se almacena el resultado de la funcion iteracion_kaprekar
      lleva_a_kaprekar: Boolean; -- Booleana que evalua si el numero llega a la constante kaprekar
      iteraciones: Natural; -- contador accesible desde fuera del loop (a diferencia de la variable i)
   begin
      put("Introduce una secuencia de numeros de 4 digitos: ");
      get(num);
      while num /= 0 loop
         if contar_digitos(num) <= 4 then
            iteraciones := 0;
            new_line;
            put("Iteracion para numero: " & Integer'Image(num));
            new_line;
            for i in 1..100 loop
               iteraciones := iteraciones + 1;
               iteracion_kaprekar(num, resultado_kaprekar);

               put("Resultado de la iteracion: " & Integer'image(resultado_kaprekar));
               new_line;

               if resultado_kaprekar = 6174 then
                  lleva_a_kaprekar := True;
                  exit;
               -- Si el resultado de la iteracion es 0, se termina el programa (no vale la pena iterar otras n veces)
               elsif resultado_kaprekar = 0 then
                  lleva_a_kaprekar := False;
                  exit;
               end if;

               num := resultado_kaprekar;
            end loop;
            put("Lleva a kaprekar? " & boolean'image(lleva_a_kaprekar) & ". Iteraciones realizadas: " & integer'image(iteraciones));
            new_line;
            put("Iteraciones terminadas");
            new_line(3);
         else
            raise constraint_error with "El numero introducido no tiene 4 digitos";
         end if;

         get(num);
      end loop;
      skip_line;
   end lleva_a_kaprekar;

   ----------------
   -- es_collatz --
   ----------------

   procedure es_collatz (resultado: out Boolean) is
      secuencia_correcta, numero: Integer;
   begin
      new_line;
      put("--ES_COLLATZ--");
      put("Introduce una secuencia de numeros terminada en 0: ");
      get(numero);

      resultado := False; -- * si se utiliza varias veces el programa, podria devolver falsos positivos
      secuencia_correcta := numero; -- El punto de partida
      while secuencia_correcta < 1 and numero = secuencia_correcta loop
         --Secuencia Collatz
         if numero mod 2 = 0 then -- par
            secuencia_correcta := secuencia_correcta / 2;
            numero := numero / 2;
         else -- impar
            secuencia_correcta := secuencia_correcta * 3 + 1;
            numero := numero * 3 + 1;
         end if;

         get(numero);
      end loop;

      -- Si el final de la secuencia es 1 y todas las operaciones son correctas, entonces True
      if numero = 1 and numero = secuencia_correcta then -- como el ultimo numero es -1, sumarle +2 para que sea 1
         Resultado := True;
      end if;

      new_line;
      put("Es una secuencia de collatz valida? " & Boolean'Image(resultado));
      skip_line; -- Limpia el buffer del input del usuario
   end es_collatz;

   ---------------
   -- pos_omirp --
   ---------------

   procedure pos_omirp (el_omirp:out Natural; Pos: out Natural) is
      num: Natural;
   begin
      new_line;
      put("--POS_OMIRP--");
      new_line;
      put("Introduce una secuencia de numeros terminada en 0: ");
      get(num);
      pos := 0;

      -- La secuencia terminara en 0
      loop
         exit when es_omirp(num) or num = 0;
         pos:= pos + 1;
         get(num);
      end loop;
      if num /= 0 then
         el_omirp := num;
      else
         el_omirp := 0;
         pos := 0;
      end if;
      skip_line; -- Limpia el buffer del input del usuario
   end pos_omirp;

   -----------------------
   -- secuencia_odiosos --
   -----------------------

   procedure secuencia_odiosos (suma_odiosa: out Boolean) is
      num: Natural;
      suma_imp_odiosos, contador_imp_odiosos: Natural := 0;
   begin
      new_line;
      put("--SECUENCIA_ODIOSOS--");
      put("Introduzca una secuencia (terminada en 0) de numeros positivos: ");
      get(num);

      while num /= 0 and contador_imp_odiosos < 5 loop
         if num mod 2 /= 0 and es_odioso(num) then
            suma_imp_odiosos:= suma_imp_odiosos + num;
            contador_imp_odiosos := contador_imp_odiosos + 1;
         end if;
         get(num);
      end loop;

      put("Suma odiosa: " & Integer'Image(suma_imp_odiosos));
      new_line;

      if suma_imp_odiosos = 0 then
         suma_odiosa := False;
      else
         suma_odiosa := es_odioso(suma_imp_odiosos);
      end if;

   end secuencia_odiosos;

end Laboratorio04;
