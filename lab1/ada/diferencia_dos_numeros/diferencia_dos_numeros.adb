FUNCTION diferencia_dos_numeros(num1, num2: in Integer) return Integer IS

   -- Pre: num1 y num2 Integers
   -- Post: resta max(num1, num2) - min(num1, num2) (la diferencia entre ambos)

   diferencia: Integer;
BEGIN
   if (num1 > num2) then
      diferencia := num1 - num2;
   elsif (num1 < num2) then
      diferencia := num2 - num1;
   else
      diferencia := 0;
   end if;

   return diferencia;

END diferencia_dos_numeros;