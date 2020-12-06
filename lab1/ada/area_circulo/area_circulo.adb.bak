WITH Ada.Numerics;
USE Ada.Numerics;
FUNCTION area_circulo (radio: in Float) return Float IS
   -- Pre: radio > 0
   -- Post: Pi * (radio ** 2) si radio > 0.0. Sino, muestra al usuario el error
BEGIN
   if radio > 0.0 then
      return Pi * (radio ** 2);
   else
      raise CONSTRAINT_ERROR;
   end if;
END area_circulo;