-- Funcion que comprueba si el cupon introducido es premiado
FUNCTION resultado_once(cupon_premiado, cupon: Natural) return Natural IS
   -- Datos: cupon_premiado y cupon, ambos numeros naturales
   -- Pre: 2 numeros naturales de 4 digitos
   -- Resultado: premio, un numero natural. El premio correspondiente al cupon pasado por parametro
   -- Post: si los 4 digitos coinciden, el premio sera de 100000. Si los 3 ultimos digitos coinciden, 50000. Los 2 ultimos 3. Para el resto de los casos, premio ha de ser 0.
   premio: Natural;
BEGIN

   if cupon_premiado < 10000 AND cupon < 10000 then

      if (cupon = cupon_premiado) then -- Si todos los numeros coinciden
         premio := 100000;
      elsif(cupon rem 1000 = cupon_premiado rem 1000) then -- Si los 3 ultimos numeros coinciden
         premio := 50000;
      elsif(cupon rem 100 = cupon_premiado rem 100) then -- Si los 2 ultimos numeros coinciden
         premio := 3;
      else
         premio := 0;
      end if;

   else
      raise constraint_error with "Introduce un numero de cupon correcto";
   end if;

   return premio;

END resultado_once;