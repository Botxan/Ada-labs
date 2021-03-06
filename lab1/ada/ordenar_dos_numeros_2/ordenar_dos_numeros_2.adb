WITH Ada.Text_IO, Ada.Integer_Text_IO;
USE Ada.Text_IO, Ada.Integer_Text_IO;

PROCEDURE ordenar_dos_numeros_2 IS
   -- Pre: num1 y num2 > 0. Esto siempre sera asi puesto que los hemos tipado como Positive
   -- Post: num1 sera el menor y num2 el mayor. Si son iguales, se deja los valores por defecto.
   num1, num2: Positive;
BEGIN

   put("Introduce el primer numero: ");
   get(num1);

   new_line;

   put("Introduce el segundo numero: ");
   get(num2);

   new_line;

   if (num1 > num2) then
      num1 := num1 + num2;
      num2 := num1 - num2;
      num1 := num1 - num2;
   end if;

   put("El numero menor es " & Integer'Image(num1) & " y el numero mayor es " & Integer'Image(num2));


END ordenar_dos_numeros_2;