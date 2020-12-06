WITH Ada.Text_IO, Ada.Integer_Text_IO, km_hm_dam_m_p;
USE Ada.Text_IO, Ada.Integer_Text_IO;

PROCEDURE km_hm_dam_m_main IS
   m_in: Integer; -- metros de entrada
   km, hm, dam, m: Integer;
BEGIN
   put("Introduzca los metros: ");
   get(m_in);

   new_line;
   new_line;

   -- Demostracion de procedimiento
   km_hm_dam_m_p(m_in, km, hm, dam, m);
   -- Uso de Integer'Image para concatenar varios elementos.
   put("El resultado es: " & Integer'Image(km) & "km, " & Integer'Image(hm) & "hm, " & Integer'Image(dam) & "dam, " & Integer'Image(m) & "m");
   -- Demostracion de funcion
END km_hm_dam_m_main;