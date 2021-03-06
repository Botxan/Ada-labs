with Laboratorio04, Ada.Text_IO, Ada.Integer_Text_IO;
use Laboratorio04, Ada.Text_IO, Ada.Integer_Text_IO;
procedure Lab04_Pruebas is
   digito : t_digito;
   numero,posicion : Natural;
   lo_es: Boolean;
begin
   digito := digito_I(846753211,1);     -- debe ser 1
   Put(digito);
   digito := digito_I(846753,3);        -- debe ser 6
   Put(digito);
   New_Line(3);
	--poner m�s casos para probar la funci�n digito_i y asegurar que funciona

   digito_I(846753211,1, digito);       -- debe ser 1
   Put(digito);
   digito_I(846753,3, digito);          -- debe ser 7
   Put(digito);
   New_Line(3);

   numero := contar_digitos(846753211); --debe ser 9
   put(numero);
   numero := contar_digitos(846753);    --debe ser 6
   put(numero);
   New_Line(3);

   contar_digitos(846753211, numero);   --debe ser 9
   put(numero);
   contar_digitos(846753, numero);      --debe ser 6
   put(numero);
   New_Line(3);

   Iteracion_kaprekar(4532,numero);     --debe ser 3087
   put(numero);
   Iteracion_kaprekar(numero, numero);  --debe ser 8352
   put(numero);
   New_Line(3);

   lo_es := es_Omirp(1597);--si
   lo_es := es_Omirp(17); --No
   New_Line(3);

   lo_es := es_odioso(13); --si
   lo_es := es_Odioso(3);  --no
   New_Line(3);

   Lleva_A_Kaprekar;
   --probar con: 0016->6084->8172->7443->3996->6264->4176->6174 => TRUE (7)
   --probar con: 1111->0000->0000->0000->....->0000->0000->0000 => FALSE(100)
   New_Line(3);

   es_collatz(lo_es);
   --probar con 18 9 28 14 7 22 11 34 17 52 26 13 40 20 10 5 16 8 4 2 1
   New_Line(3);

   pos_omirp(numero, Posicion);
   --probar con: 4 6 8 12 13 15 19 13 (13 en la posici�n 5)
   put(numero);
   put(posicion);
   New_Line(3);

   Secuencia_Odiosos(Lo_Es);
   --probar con: 12 21 25 31 356 7  2 5 13 0           (TRUE)
   --probar con: 13  7  0                              (FALSE)
   --probar con: 12 21  4 31 356 7 13 2 15 4 11 25 7 0 (FALSE)
   put(Boolean'Image(lo_es));
   New_Line(3);

end Lab04_Pruebas;

