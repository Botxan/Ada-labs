WITH Ada.Text_IO, Ada.Integer_Text_IO;
USE Ada.Text_IO, Ada.Integer_Text_IO;

PROCEDURE ordenar_tres_numeros IS
   -- Pre: num1, num2, y num3 > 0 (introducidos por teclado). Estos siempre seran > 0 puesto que estan tipados como Positive
   -- Post: num1 <= num2 <= num3
   num1, num2, num3: Positive;
BEGIN
   put("Introduzca el primer numero: ");
   get(num1);

   new_line;

   put("Introduzca el segundo numero: ");
   get(num2);

   new_line;

   put("Introduzca el tercer numero: ");
   get(num3);

   new_line;

   -- Pasar el valor menor a num1 y pasar el valor mayor a num3

   if (num1 > num2) then
      num2 := num2 + num1;
      num1 := num2 - num1;
      num2 := num2 - num1;
   end if;

   if (num1 > num3) then
      num3 := num3 + num1;
      num1 := num3 - num1;
      num3 := num3 - num1;
   end if;

   -- Ahora el valor menor esta en num1

   if (num2 > num3) then
      num3 := num3 + num2;
      num2 := num3 - num2;
      num3 := num3 - num2;
   end if;

   -- Ahora el valor mayor esta en num3

   put(Integer'Image(num1) & " <= " & Integer'Image(num2) & " <= " & Integer'Image(num3) & ".");

END ordenar_tres_numeros;