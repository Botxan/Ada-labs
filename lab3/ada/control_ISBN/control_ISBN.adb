WITH ADA.Text_IO, Ada.Integer_Text_IO;
USE ADA.Text_IO, Ada.Integer_Text_IO;
FUNCTION control_ISBN(num: Integer) return character IS
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

END control_ISBN;