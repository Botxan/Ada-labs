WITH Ada.Text_IO, Ada.Integer_Text_IO, multiplos_de_tres_entre;
USE Ada.Text_IO, Ada.Integer_Text_IO;

PROCEDURE main IS
   n1, n2, suma: Natural;
BEGIN
   put("Introduzca el primer numero: ");
   get(n1);

   new_line;

   put("Introduzca el segundo numero: ");
   get(n2);

   multiplos_de_tres_entre(n1, n2, suma);
   put("La suma es: " & Integer'Image(suma));
END main;