WITH Ada.Numerics; Use Ada.Numerics;
PROCEDURE longitud_circunferencia_p(r: in Positive; L: out Float) IS
   -- Pre: no hace falta indicar precondición dado que el parametro r es de tipo Positive
   -- Post: L = 2 * Pi * r
BEGIN
   L := 2.0 * Pi * Float(r);
END longitud_circunferencia_p;
