WITH Laboratorio03;
USE Laboratorio03;

FUNCTION tipo_triangulo(a1, a2, a3: Float) return T_TRIANGULO IS
   -- Datos: A1, A2 y A3 son los angulos (en grados) de un triangulo
   -- Pre: 0.0 < A1, A2, A3 <180.0

   -- Resultado: una variable de tipo T_TRIANGULO que puede ser equilatero, isosceles o escaleno
   -- Post: NO_TRIANGULO <--> no suman 180;
   --       EQUILATERO   <--> si son iguales
   --       ISOSCELES    <--> si dos iguales
   --       ESCALENOS    <--> si todos distintos
   triangulo_tipo: T_TRIANGULO;
BEGIN

   if (a1 > 0.0 or a2 > 0.0 or a1 > 0.0 ) and (a1 + a2 + a3 = 180.0) then
      if (a1 = a2 and a2 = a3) then
         triangulo_tipo := EQUILATERO;
      elsif (a1 = a2) or (a1 = a3) or (a2 = a3) then
         triangulo_tipo := ISOSCELES;
      else
         triangulo_tipo := ESCALENO;
      end if;
   else
      triangulo_tipo := NO_TRIANGULO;
   end if;
   return triangulo_tipo;

END tipo_triangulo;