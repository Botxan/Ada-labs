WITH Ada.Text_IO, Ada.Integer_Text_IO, control_ISBN;
USE Ada.Text_IO, Ada.Integer_Text_IO;

PROCEDURE main IS
   num: Integer;
BEGIN
   put("Introduce un numero de 9 digitos: ");
   get(num);
   put("El resultado es: " & control_ISBN(num));
END main;