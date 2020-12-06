WITH Ada.Text_IO, Ada.Integer_Text_IO, par_o_impar;
USE Ada.Text_IO, Ada.Integer_Text_IO;

PROCEDURE main is
   num: Positive;
   es_par: Boolean;
BEGIN
   put("Introduce un numero: ");
   get(num);

   new_line;

   es_par := par_o_impar(num);

   if (es_par) then
      put("El numero " & Integer'Image(num) & " es par.");
   else
      put("El numero " & Integer'Image(num) & " es impar.");
   end if;

END main;