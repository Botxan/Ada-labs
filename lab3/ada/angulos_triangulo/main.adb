WITH Ada.Text_IO, Ada.Float_Text_IO, tipo_triangulo;
USE Ada.Text_IO, Ada.Float_Text_IO;

PROCEDURE main IS

   a1, a2, a3: Float range 0.0..177.0;

BEGIN

   put("Introduzca el primer angulo: ");
   get(a1);

   new_line;

   put("Introduzca el segundo angulo: ");
   get(a2);

   new_line;

   put("Introduzca el tercer angulo: ");
   get(a3);

   put("El resultado es: " & tipo_triangulo(a1, a2, a3));

END main;