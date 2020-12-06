PROCEDURE segundo_anterior(h, m, s: in out Natural) IS
   -- Datos: 3 parametros de entrada: h(horas), m(minutos), s(segundos). Indican una hora determinada.
   -- Pre: 3 numeros naturales(h, m, s), una hora valida: h > 0 y < 24. m >= 0 y < 60. s >= 0 y < 60.

   -- Resultado: 3 parametros de salida: h(horas), m(minutos), s(segundos). Indican la hora introducida pero 1 segundo antes.
   -- Post: Si s es 0, se convierte en 59. Sino, se le resta 1. En caso de s = 0, se realiza la misma comprobacion con los minutos. En caso de m = 0, se hace lo mismo con h(horas). El resultado final tiene
            --que constar de 3 numeros naturales.

BEGIN

   if s=0 then
      s:=59;
      if m=0 then
         m:=59;
         if h=0 then
            h:=23;
         else
            h:=h-1;
         end if;
      else
         m:=m-1;
      end if;
   else
      s:=s-1;
   end if;

END segundo_anterior;