WITH Ada.Text_IO, Ada.Integer_Text_IO, secuencia_collatz;
USE Ada.Text_IO, Ada.Integer_Text_IO;

PROCEDURE main IS
   n, longitud, suma: Integer;
BEGIN

   put("Introduzca un numero: ");
   get(n);

   secuencia_collatz(n, longitud, suma);

   new_line;
   new_line;

   put("La cantidad de numeros en la secuencia es: " & Integer'Image(longitud));

   new_line;

   put("La suma de todos los numeros es: " & Integer'Image(suma));

END main;