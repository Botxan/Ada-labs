WITH Ada.Text_IO, Ada.Integer_Text_IO, ordenar_dos_numeros_1;
USE Ada.Text_IO, Ada.Integer_Text_IO;

PROCEDURE main IS
num1, num2: Integer;
BEGIN
   put("Introduce el primer numero: ");
   get(num1);

   new_line;

   put("Introduce el segundo numero: ");
   get(num2);

   ordenar_dos_numeros_1(num1, num2);

   put("El numero menor es " & Integer'Image(num1) & " y el numero mayor es " & Integer'Image(num2) & ".");

END main;