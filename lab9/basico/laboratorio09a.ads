package Laboratorio09a is

   Type T_Nodo_enteros;
   Type T_Lista_Dinamica is access T_Nodo_Enteros;
   type T_Nodo_Enteros is record
      Info: Integer;
      Sig: T_Lista_Dinamica;
   end record;

   function Esta(L: in T_Lista_Dinamica; N: in Integer) return Boolean;
   -- Post: Resultado = True <--> N está en L
   function Posicion(L: in T_Lista_Dinamica; N: in Integer) return Natural;
   -- Post: Resultado es la posicion de N (comenzando en 1) en L. Si no está, REsultado = Integer'Last

   procedure Insertar_Delante(L: in out T_Lista_Dinamica; Num: Integer);
   -- Post: L incluye a Num como primer elemento de la lista
   procedure Insertar_Detras(L: in out T_Lista_Dinamica; Num: Integer);
   -- Post: L incluye a Num como ultimo elemento de la lista
   procedure Insertar_Elemento_En_Pos(L: in out T_Lista_Dinamica; Num: in Integer; Pos: in Integer);
   -- Post: L incluye Num en la Posicion indicada.
   --      Si Pos<1, en la primera posicion.
   --      Si pos>Longitud de L en la última posición
   procedure Borrar(L: in out T_Lista_Dinamica; Num: in Integer);
   --Post: De L ha desaparecido la primera aparición de num (si había)
   procedure Concatenar(L1, L2: in out T_Lista_Dinamica);
   --Post: L1 incluye a L2 al final
   Procedure Invertir (L: in out T_Lista_Dinamica);
   --Post L es la lista inicial con los elementos en orden inverso

   type T_Punto is record
      X, Y: Float;
   end record;
   type T_Nodo_Punto;
   type T_Lista_Puntos is access T_Nodo_punto;
   type T_Nodo_Punto is record
      Info: T_Punto;
      Sig: T_Lista_Puntos;
   end record;

   procedure Simplificar(L: in out T_Lista_Puntos; Cuantos: out Natural);

end Laboratorio09a;

