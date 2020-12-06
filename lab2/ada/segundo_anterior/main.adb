WITH Ada.Text_IO, Ada.Integer_Text_IO, segundo_anterior;
USE Ada.Text_IO, Ada.Integer_Text_IO;

PROCEDURE main is
   h: Natural range 0..23;
   m, s: Natural range 00..59;
BEGIN
   put("Introduzca una cantidad de horas: ");
   get(h);

   put("Introduzca una cantidad de minutos: ");
   get(m);

   put("Introduzca una cantidad de segundos: ");
   get(s);

   new_line;
   new_line;

   segundo_anterior(h, m, s);

   put("Un segundo antes de esa hora eran las " & Integer'Image(h) & ":" & Integer'Image(m) & ":" & Integer'Image(s));
END main;0