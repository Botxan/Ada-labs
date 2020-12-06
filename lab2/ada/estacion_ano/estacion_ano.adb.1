FUNCTION estacion_ano(dd, mm: Positive) return String IS
   dias_en_mes: Integer := 31 - (if mm = 2 then 2 else (mm - 1) rem 7 rem 2);
   mes_estacion: Integer := mm; -- Hay que crear una nueva variable puesto que no se puede editar un parametro in
   estacion: string(1..9);
   -- Datos: 2 parametros, dd(dia) y mm(mes), ambos Positive.
   -- Pre: 2 numeros positivos (>0). Esto sera asi siempre puesto que estan tipados como Positive.

   -- Resultado: se retorna la estacion, un String de 9 caracteres de largo.
   -- Post: se le resta 1 al mes si el dia esta entre 1 y 20. El programa retornara una estacion u otra comprobando que mes empieza y que mes acaba. El resultado del programa tiene que ser
   -- un string de 9 caracteres de largo, que es el espacio minimo para escribir cualquiera de las 4 estaciones (primavera es la mas larga, 9 caracteres).

BEGIN

   if dd in 1..20 then
      if mes_estacion = 1 then
         mes_estacion := 12;
      else
         mes_estacion := mes_estacion - 1;
      end if;
   end if;

   if (dd > 0 and dd <= dias_en_mes) and (mm > 0 and mm <= 12) then
      if mes_estacion = 12 or mes_estacion in 1..2 then
         estacion := "invierno ";
      elsif mes_estacion in 3..5 then
         estacion := "primavera";
      elsif mes_estacion in 6..8 then
         estacion := " verano  ";
      elsif mes_estacion in 9..11 then
         estacion := "  otono  ";
      end if;

   else
       raise constraint_error with "Introduzca un dia y mes correctos";
   end if;

   return estacion;

END estacion_ano;
