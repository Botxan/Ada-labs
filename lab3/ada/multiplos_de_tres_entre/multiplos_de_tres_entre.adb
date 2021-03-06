PROCEDURE multiplos_de_tres_entre (n1, n2: in Integer; suma: out Natural) IS
   -- Datos: 2 parametros, n1 y n2, Integers.
   -- Pre: N1 < N2

   -- Resultado: 1 parametro out, suma: Natural.
   -- post: Suma = suma de los multiplos de tres entre N1 y N2
BEGIN

   if n1 >= 0 and n2 >= 0 then

      suma := 0;

      for i in n1..n2 loop
         if(i rem 3 = 0) then -- Sera multiplo de 3
            suma := suma + i;
         end if;
      end loop;

   else
      raise constraint_error with "Los numeros introducidos deben de ser naturales";
   end if;

END multiplos_de_tres_entre;