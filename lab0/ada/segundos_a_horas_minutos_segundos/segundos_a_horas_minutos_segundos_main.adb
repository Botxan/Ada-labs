WITH Ada.Text_IO, Ada.Integer_Text_IO, segundos_a_horas_minutos_segundos_p;
USE Ada.Text_IO, Ada.Integer_Text_IO;

PROCEDURE segundos_a_horas_minutos_segundos_main IS
   seg_in, h, min, seg: Integer;
BEGIN
   put("Introduzca los segundos: ");
   get(seg_in);

   segundos_a_horas_minutos_segundos_p(seg_in, h, min, seg);

   new_line;
   new_line;

   put("Resultado: ");
   put(Integer'Image(h) & "h " & Integer'Image(min) & "min " & Integer'Image(seg) & "seg");
END segundos_a_horas_minutos_segundos_main;