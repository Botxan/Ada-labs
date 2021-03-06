WITH Ada.Text_IO, Ada.Float_Text_IO, radianes_a_grados_p, radianes_a_grados_f;
USE Ada.Text_IO, Ada.Float_Text_IO;

PROCEDURE radianes_a_grados_main IS
   radianes: Float;
   grados: Float;
BEGIN
   put("Introduce radianes para convertirlos en grados: ");
   get(radianes);

   new_line;
   new_line;

   -- Procedimiento
   put("Resultado del procedimiento: ");
   radianes_a_grados_p(radianes, grados);
   put(grados);

   new_line;
   new_line;

   -- Funcion
   put("Resultado de la funcion: ");
   put(radianes_a_grados_f(radianes));
END radianes_a_grados_main;