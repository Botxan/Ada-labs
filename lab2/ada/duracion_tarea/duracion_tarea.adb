PROCEDURE duracion_tarea(h, m, s: in out Natural; duracion: in Positive; dia_siguiente: out Boolean) IS
   -- Datos: 3 parametros, h(horas), m(minutos) y s(segundos), que son Natural. Y duracion(de la tarea) que es Positive
   -- Pre: h, m, s son numeros Naturales(>=0) y duracion es un numero positivo (>0)

   -- Resultado: 4 parametros out. Hora de finalizacion de la tarea. 3 resultados, h(hora), m(minuto) y s(segundo), las 3 de tipo Natural. Y dia_siguiente
   -- (parametro booleano que muestra si la tarea se finaliza el dia siguiente) de tipo Boolean.
   -- Post: si la jornada excede las 4 horas, el programa finaliza con error. Sino, si la duracion de la tarea excede el fin de la jornada
   -- (teniendo en cuenta la hora inicial y que la jornada acaba a las 16:00) se acaba el dia siguiente y dia_siguiente es true. La tarea ha de finalizar entre las 8:00:01 y las 16:00:00
   hora_en_segundos: Natural:= (h*3600) + (m * 60) + s;
   duracion_restante: Natural := duracion; -- La pasamos a una variable del programa, porque los parametros IN no se pueden sobreescribir

BEGIN
   if duracion < 14401 then -- Si la jornada dura mas de 4 horas (14401s)

      if (hora_en_segundos + duracion > 57600) then -- Si duracion + hora inicial excede las 16 horas (57600s)
         dia_siguiente := true;

         duracion_restante := ((duracion + hora_en_segundos) - 57600);
         hora_en_segundos := 28800; -- Le sumamos a la duracion restante, las 8 de la mañana(28800)
      end if;

      h := (hora_en_segundos + duracion_restante) / 3600;
      m := ((hora_en_segundos + duracion_restante) / 60) rem 60;
      s := (hora_en_segundos + duracion_restante) rem 60;

   else
      raise constraint_error with "La duracion de la tarea no puede exceder la media jornada.";
   end if;
END duracion_tarea;