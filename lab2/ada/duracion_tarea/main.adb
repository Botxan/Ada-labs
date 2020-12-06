WITH Ada.Text_IO, Ada.Integer_Text_IO, duracion_tarea;
USE ADa.Text_IO, Ada.Integer_Text_IO;

PROCEDURE main IS
   h, m, s: Natural;
   duracion: Positive;
   dia_siguiente: Boolean;
BEGIN
   get(h);
   get(m);
   get(s);
   get(duracion);
   duracion_tarea(h, m, s, duracion, dia_siguiente);
   put(Integer'Image(h) & ":" &Integer'Image(m) & ":" & Integer'Image(s) & ". Hemos pasado al dia siguiente?" & Boolean'Image(dia_siguiente));

END main;