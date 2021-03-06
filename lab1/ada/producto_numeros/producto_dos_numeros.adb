WITH Ada.Text_IO, Ada.Integer_Text_IO;
USE Ada.Text_IO, Ada.Integer_Text_IO;

PROCEDURE producto_dos_numeros IS
   -- Pre: entrada, el usuario introduce 2 Integers por teclado, num1 y num2
   -- Post: salida, se le muestra al usuario el producto de num1 y num2

   num1: Integer;
   num2: Integer;
   producto: Integer;
BEGIN
   put("Introduzca el primer numero: ");
   get(num1);

   new_line;

   put("Introduzca el segundo numero: ");
   get(num2);

   new_line;
   new_line;

   producto := num1 * num2;
   put("El producto es: " & Integer'Image(producto));

END producto_dos_numeros;