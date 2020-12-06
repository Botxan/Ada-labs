PROCEDURE main IS
   mm, dd: Integer;
BEGIN
   put("Introduzca el dia");
   get(dd);

   put("Introduza el mes");
   get(mm);

   estacion_ano(dd, mm);
   put("La estacion correspondiente al dia introducido es: " & estacion_ano(dd, mm, estacion));

END main;