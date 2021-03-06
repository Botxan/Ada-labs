WITH Ada.Numerics;
USE Ada.Numerics;

FUNCTION radianes_a_grados_f(radianes: in Float) return Float IS
   -- Pre: radianes > 0
   -- Post: return (radianes * 180) / Pi
BEGIN
   return (radianes * 180.0) / Pi;
END radianes_a_grados_f;