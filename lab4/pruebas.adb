with ada.Text_IO, ada.Integer_Text_IO, pruebasss;
use ada.Text_IO, ada.Integer_Text_IO, pruebasss;

procedure pruebas is
   eslo: Boolean;

   omirp, posicion: Natural;
   num: Natural;
begin

   --pos_omirp(omirp, posicion);
   --put(omirp);
   --put(posicion);

   -- lleva_a_kaprekar;

   es_collatz(eslo);
   eslo := False;
   es_collatz(eslo);
   es_collatz(eslo);
   es_collatz(eslo);
   es_collatz(eslo);

end pruebas;