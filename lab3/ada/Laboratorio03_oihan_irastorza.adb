WITH Ada.Text_IO, Ada.Integer_Text_IO;
USE Ada.Text_IO, Ada.Integer_Text_IO;
package body Laboratorio03 is

   --------------------
   -- tipo_triangulo --
   --------------------

   function tipo_triangulo (A1, A2, A3 : in Float) return T_TRIANGULO is
      -- Datos: A1, A2 y A3 son los angulos (en grados) de un triangulo
      -- Pre: 0.0 < A1, A2, A3 <180.0

      -- Resultado: una variable de tipo T_TRIANGULO que puede ser equilatero, isosceles o escaleno
      -- Post: NO_TRIANGULO <--> no suman 180;
      --       EQUILATERO   <--> si son iguales
      --       ISOSCELES    <--> si dos iguales
      --       ESCALENOS    <--> si todos distintos
      triangulo_tipo: T_TRIANGULO;
   BEGIN

      if (a1 > 0.0 or a2 > 0.0 or a1 > 0.0 ) and (a1 + a2 + a3 = 180.0) then
         if (a1 = a2 and a2 = a3) then
            triangulo_tipo := EQUILATERO;
         elsif (a1 = a2) or (a1 = a3) or (a2 = a3) then
            triangulo_tipo := ISOSCELES;
         else
            triangulo_tipo := ESCALENO;
         end if;
      else
         triangulo_tipo := NO_TRIANGULO;
      end if;
      return triangulo_tipo;

   end tipo_triangulo;

   -----------------------------
   -- Multiplos_de_tres_entre --
   -----------------------------

   procedure Multiplos_de_tres_entre(N1, N2 : in Integer; suma : out Natural) IS
      -- Datos: 2 parametros, n1 y n2, Integers.
      -- Pre: N1 < N2

      -- Resultado: 1 parametro out, suma: Natural.
      -- post: Suma = suma de los multiplos de tres entre N1 y N2
   BEGIN
      suma := 0;

      if n1 >= 0 and n2 >= 0 then

      for i in n1..n2 loop
         if(i rem 3 = 0) then -- Sera multiplo de 3
            suma := suma + i;
         end if;
      end loop;

      else
         raise constraint_error with "Los numeros introducidos deben de ser naturales";
      end if;
   END Multiplos_de_tres_entre;

   -----------------
   -- sin_blancos --
   -----------------

   procedure sin_blancos is
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
   end sin_blancos;

   -------------------
   -- pares_impares --
   -------------------

   PROCEDURE pares_impares IS
      -- Entrada: una serie de enteros
      -- Pre: la serie termina en 0
      -- Salida: dos enteros pares impares
      -- Post: pares contiene cuantos pares hay en la serie (sin el 0)
      --       impares contiene la suma de los impares de la serie

      num: Integer;
      pares, impares: Integer := 0;
   BEGIN
      put("Introduce una secuencia de numeros, hasta introducir 0: ");
      get(num);

      while num /= 0 loop
         if num mod 2 = 0 then -- pares
            pares := pares + 1;
         else -- impares
            impares := impares + num;
         end if;
         get(num);
      end loop;

      put("Total de elementos pares (sin contar el 0): ");
      put(pares);

      new_line;
      new_line;

      put("Suma de todos los elementos impares: ");
      put(impares);

   END pares_impares;

   -----------------------
   -- secuencia_collatz --
   -----------------------

   procedure secuencia_collatz (N : in Integer; longitud, suma : out integer) is
      -- Datos: 1 parametro, n: Integer
      -- Pre: N > 0
      -- Salida: una serie de naturales
      -- Resultado: 2 parametros de salida
      --            longitud = cuantos elementos de la serie que empieza en N
      --            suma = suma de los elementos de la serie que empieza en N
      -- Post: la serie son los elementos de la serie de collatz en 1 linea

      num: Integer := n; -- Asignamos el parametro in n a num, dado que no se puede asignar un nuevo valor a un parametro in
   BEGIN

      longitud := 1;
      suma := num;

      put("Secuencia de collatz para el numero" & Integer'Image(num));
      new_line;

      WHILE num /= 1 LOOP
         put(num);

         if (num rem 2 = 0) then
            num := num / 2;
         else
            num := num * 3 + 1;

         end if;
         longitud := longitud + 1;
         suma := suma + num;
      END LOOP;

      put(num);
   end secuencia_collatz;

   ------------------
   -- control_ISBN --
   ------------------

   function control_ISBN (num : in Integer) return character is
      -- Datos: 1 parametro, num: Integer.
      -- Pre: num es un entero de 9 di�gitos
      -- Resultado: digito_control: Character, el digito de control asociado
      -- Post: resultado es el di�gito de control de un ISBN con ese valor

      sumador: Integer := 0;
      digito: Integer;
      numero_dividiendo: Integer := num;
      digito_control: Character;
   BEGIN

      FOR i IN REVERSE 1..9 LOOP
         digito:= numero_dividiendo rem 10;
         sumador := sumador + digito * i;
         numero_dividiendo := numero_dividiendo / 10;
      END LOOP;

      sumador := sumador mod 11;

      if (sumador = 10) then
         digito_control := 'X';
      else
      -- En la tabla ascii el caracter 0 corresponde a 48 en hexadecimal
      -- Solamente tenemos que sumar 48 al resultado para convertirlo a caracter
         digito_control := Character'Val(48 + sumador);
      end if;

      return digito_control;
      -- Podria omitir la variable digito control, pero tendria que usar 2 veces la palabra reservada return.
      -- Dado que es una buena practica utilizar un solo return (para saber realmente donde termina el programa)
      -- utilizare una variable para omitir un segundo return
      end control_ISBN;

   end Laboratorio03;
