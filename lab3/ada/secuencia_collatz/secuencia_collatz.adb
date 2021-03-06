WITH Ada.Text_IO, Ada.Integer_Text_IO;
USE Ada.Text_IO, Ada.Integer_Text_IO;

PROCEDURE secuencia_collatz(n: in Integer; longitud, suma: out Integer := 3) IS
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


END secuencia_collatz;