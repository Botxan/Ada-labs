-- Procedimiento para conseguir el area de una esfera dado su radio por el usuario

With Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, area_esfera_p, area_esfera_f;
Use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;

PROCEDURE area_esfera_main IS
   radio: Integer;
   area_esfera: Float;
BEGIN

   put("Introduce la longitud del radio de la circunferencia para calcular el area de la esfera: ");
   get(radio);
   new_line;
   new_line;

   -- Procedimiento
   put("Resultado del procedimiento: ");
   area_esfera_p(radio, area_esfera);
   put(area_esfera);

   new_line;
   new_line;
   -- Function
   put("Resultado de la funcion: ");
   put(area_esfera_f(radio));

END area_esfera_main;