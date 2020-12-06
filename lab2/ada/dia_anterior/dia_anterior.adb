PROCEDURE dia_anterior(yy: in out Natural; mm, dd: in out Positive) IS
   -- Datos: 3 parametros, yy(año), mm(mes) y dd(dia). yy es Natural, y mm y dd son Positive
   -- Pre: yy >= 0 (implicito al tiparlo como Natural), mm y dd > 0 (implicito al tiparlos como Positive)

   -- Resultado: 3 parametros de salida que muestra el dia anterior: yy(año), mm(mes) y dd(dia). yy Natural, y mm y dd Positive.
   -- Post: si dd es 1, entonces restamos 1 a mm y dia pasa a ser el ultimo dia de ese mes (el dia sera 28, 29, 30 o 31 segun el mes y si el año es bisiesto)
   -- Sino restamos 1 a dd. Si el mes es igual a 0, restamos 1 al año y mes sera 12. Sino restamos 1 a mm. Y si año es 0 se muestra un error para indicar que ese es el primer dia admitido por el programa.
   -- Sino, se resta 1 al año
   es_bisiesto: Integer range 0..1;
BEGIN

   if (dd = 1) then
      if (mm = 1) then
         mm := 12;
         if (yy = 0) then
            raise constraint_error with "Ha llegado al ultimo dia a.C.";
         else
            yy := yy - 1;
         end if;
      else
         mm := mm - 1;
      end if;

      -- Comprobar si el año es bisiesto
      es_bisiesto := (if (yy rem 4 = 0) and ((yy rem 100 /= 0) or (yy rem 400 = 0)) then 1 else 0);

      -- Formula para calcular dias de cada mes, idea tomada de:
      -- http://www.dispersiondesign.com/articles/time/number_of_days_in_a_month
      dd := 31 - (if mm = 2 then (3 - es_bisiesto) else (mm - 1) rem 7 rem 2);
   else
      dd := dd - 1;
   end if;

END dia_anterior;