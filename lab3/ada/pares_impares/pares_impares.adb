WITH Ada.Text_IO, Ada.Integer_Text_IO;
USE Ada.Text_IO, Ada.Integer_Text_IO;

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