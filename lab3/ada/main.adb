WITH Ada.Text_IO, Ada.Integer_Text_IO, Laboratorio03_oihan_irastorza;
USE Ada.Text_IO, Ada.Integer_Text_IO;

PROCEDURE main IS

   num: Integer;

BEGIN

   put("Introduce un codigo ISBN: ");
   get(num);

   new_line;

   put("El digito de control es: " & Laboratorio03_oihan_irastorza.control_ISBN(num));

END;