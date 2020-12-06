WITH Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, longitud_circunferencia_p, longitud_circunferencia_f;
USE Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;

PROCEDURE longitud_circunferencia_main IS
   r: Integer; -- radio de la circunferencia
   L: Float; -- resultado de la funcion / el procedimiento
BEGIN
   Put("Introduce el radio de la circunferencia: ");
   get(r);
   new_line;

   -- Procedimiento
   longitud_circunferencia_p(r, L); -- enviamos la r como argumento de entrada y esperamos L como argumento de salida

   Put("Resultado del procedimiento: ");
   new_line;
   Put("La longitud de la circunferencia es: ");
   put(L);
   new_line;
   new_line;

   -- Funcion
   Put("Resultado de la funcion");
   new_line;
   Put("La longitud de la circunferencia es: ");
   put(longitud_circunferencia_f(r)); -- enviamos la r como argumento de entrada y la funcion retornara en su nombre la longitud (L)


END longitud_circunferencia_main;