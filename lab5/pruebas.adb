WITH Ada.Text_IO, Ada.Integer_Text_IO, lab05_extra, laboratorio05;
USE Ada.Text_IO, Ada.Integer_Text_IO, lab05_extra, laboratorio05;

PROCEDURE pruebas IS
   num: String(1..10);
   i: Integer := 2;
   vector: String(1..i);
   --pais: String(1..2) := "ES";
   --banco: Natural := 0019;
   --sucursal: Natural := 0020;
   --numero_cuenta: T_vector10 := (1,2,3,4,5,6,7,8,9,0);
   --iban: String(1..29);

   numero_cuenta_16 : t_vector16 := (5,1,4,9,1,0,7,6,6,9,5,5,2,2,3,8);
BEGIN
   --incluir_digitos_iban(pais, banco, sucursal, numero_cuenta, iban);
   num_misterioso(num);
   put(num);
END pruebas;