WITH Ada.Text_IO, Ada.Integer_Text_IO;
USe Ada.Text_IO, Ada.Integer_Text_IO;

PROCEDURE numero_misterioso IS
   num: Positive; -- abcdefghij
   -- Sabemos que el digito 10 es 0 porque tiene que ser divisible entre 10, y que el digito 5 es 5, porque los numeros divisibles entre 5 terminan en 5 o 0 (ya hemos tomado el 0)
BEGIN
   -- Sabemos que los digitos pares son los divisibles entre pares (b, d, f, h)
   -- Luego los impares son el resto (a, c, g, i)

   -- abcd es divisble entre 4, es decir, c y d son divisibles entre 4. c es un impar /= 0 y d es un par /= 0. Las unicas posibilidades para d son 2 y 6
   for i in 1..2 loop
      num := 50000;
      -- me voy a los digitos dbf. d = 2 o 6. e = 5. f es un par distinto de 0 (2, 4, 6, 8)
      -- si abc es divisible entre 3, def tiene que ser divisible entre 3. Asi la suma de los 6 digitos sera multiplo de 3 (regla de divisibilidad del 3). Luego def solo puede ser 258 o 654

      if i = 1 then
         num := num + 2 * (10**5);
         num := num + 8 * (10**3);

         -- fgh: divisible entre 8 (regla de divisibilidad de 8). Si f = 8, entonces gh = 16 o 96
         for j in 1..2 loop

         end loop;
      else
         num := num + 6 * (10**5);
         num := num + 4 * (10**3);

         -- fgh: '' '' ''. Si f = 4, entonces gh=
      end if;



   end loop;

END numero_misterioso;