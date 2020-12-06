WITH Ada.Numerics;
USE Ada.Numerics;

PROCEDURE radianes_a_grados_p(radianes: in Float; grados: out Float) IS
   -- Pre: radianes > 0
   -- Post: grados = (radianes * 180) / Pi
BEGIN
   grados := (radianes * 180.0) / Pi;
END radianes_a_grados_p;