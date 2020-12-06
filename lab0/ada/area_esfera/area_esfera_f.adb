WITH Ada.Numerics;
USE Ada.Numerics;

FUNCTION area_esfera_f(radio: in Positive) return Float IS
   -- Pre: no hace falta poner condicion porque ya hemos tipado el parametro de entrada como Positive
   -- Post: return 4 * area_circulo (area de la esfera)
   area_circulo: Float := Pi * Float((radio**2));
BEGIN
   return area_circulo * Float(4);
END area_esfera_f;