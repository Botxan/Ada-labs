PROCEDURE ordenar_dos_numeros_1 (num1, num2: in out Positive) IS
   -- Pre: num1 y num2 > 0. Esto siempre sera asi puesto que los hemos tipado como Positive
   -- Post: num1 sera el menor y num2 el mayor. Si son iguales, se deja el orden por defecto.
BEGIN
   if (num1 > num2) then
      num2 := num2 + num1;
      num1 := num2 - num1;
      num2 := num2 - num1;
   end if;
END ordenar_dos_numeros_1;