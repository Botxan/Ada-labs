WITH Ada.Numerics;
USE Ada.Numerics;

PROCEDURE area_esfera_p(radio: in Positive; area_esfera:out Float) IS
   -- Pre: no hace falta poner condicion porque ya hemos tipado el parametro de entrada como Positive
   -- Post: area_esfera = 4 * area_circulo
   area_circulo: Float := Pi * Float((radio**2));
BEGIN
   area_esfera := area_circulo * Float(4);
END area_esfera_p;