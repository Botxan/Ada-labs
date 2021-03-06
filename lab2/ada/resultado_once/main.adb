WITH Ada.Text_IO, Ada.Integer_Text_IO, resultado_once;
USE Ada.Text_IO, Ada.Integer_Text_IO;

PROCEDURE main IS
   premio: Natural := 4540;
   cupon: Natural range 0000..9999;
BEGIN

    put("Introduzca su cupon: ");
    get(cupon);
    put("El premio de su cupon es de:" & Integer'Image(resultado_once(cupon, premio)));

END main;