FUNCTION par_o_impar(num: Positive) RETURN Boolean IS
   -- Pre: num > 0. Esto se da por hecho si utilizamos el tipo Positive en el parametro num.
   -- Post: num mod 2 = 0 es par (True). Sino impar(False)
   par_o_impar: Boolean := (if num mod 2 = 0 then True else False);
BEGIN
   return par_o_impar;
END par_o_impar;