package laboratorio10.extra is

   procedure Mostrar(Img: in T_Imagen; Le: T_Lista_E_Pistas; Ld: T_Lista_D_Pistas := null);
   -- Post: representa por pantalla la imagen y las pistas en sus correspondientes posiciones

   function Existe(L: in T_Lista_E_Pistas; Fil, Col: in Integer) return Boolean;
   -- Post: true <-> si existe una pista con las coordenadas (x y) en la lista Dinamica

   function Existe(L: in T_Lista_D_Pistas; Fil, Col: in Integer) return Boolean;
   -- Post: true <-> si existe una pista esta en la lista dinamica

   function Pista_Resuelta(Img: T_Imagen; P: T_Pista) return Boolean;
   -- Post: si encuentra una pista resuelta

end laboratorio10.extra;