WITH Ada.Text_IO, Ada.Integer_Text_IO, estacion_ano;
USE Ada.Text_IO, Ada.Integer_Text_IO;

PROCEDURE main IS
   mm, dd: Natural;
BEGIN
   put("Introduzca el dia: ");
   get(dd);

   put("Introduzca el mes: ");
   get(mm);

   new_line;
   new_line;

   put("La estacion correspondiente al dia introducido es: ");
   put(estacion_ano(dd, mm));
END main;