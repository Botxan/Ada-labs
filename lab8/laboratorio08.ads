
package Laboratorio08 is
   type T_Vector_Enteros is array (Integer range <>) of Integer;
   Max_Valores: constant Integer := 30;
   type T_Lista_Estatica is record
      Dato: T_Vector_Enteros(1..Max_Valores);
      cont: Natural;
   end record;

   ------------------
   -- Nivel basico --
   ------------------
   function Comunes(V1,V2: in T_vector_enteros) return Natural;
   -- pre: V1 y V2 ordenados ascendentemente
   -- post: resultado = numero de elementos comunes de V1 y V2

   procedure Encriptar(N,Clave: in T_Vector_Enteros; Num: out T_Vector_Enteros);
   -- pre: N es un vector de dígitos (entre 0..9)
   --      Clave es un vector con numeros de 1 a tamaño de N
   -- post: Num contiene el numero con los digitos de N usando Clave

   procedure Insertar_En_Medio(L: in out T_Lista_Estatica; Num: in Integer);
   -- post: Num se inserta en el medio de L.

   procedure Borrar_Intermedio(L: in out T_Lista_Estatica);
   -- post: L es la de partida sin el elemento intermedio

   Max: constant Natural := 3546;
   type T_Vecino is record
      nombre: String(1..25);
      piso: integer range 1..100;
      mano: character range 'A'..'J';
   end record;
   type T_Comunidad is array (1..Max) of T_Vecino;
   type T_Rascacielos is array (Integer range 1..100, Character range 'A'..'J') of Natural;

   procedure Obtener_Num_Vecinos_por_Vivienda (C: in T_Comunidad;R:out T_Rascacielos);
   --pre: C contiene los datos de los vecinos de la comunidad
   --post: R contiene los datos de cuántos vecinos hay por cada vivienda según lo que aparece en C

   type T_Vivienda is record
      Consumo_Electrico, Consumo_Gas: Float;
      Habitantes: Integer;
   end record;

   type T_Edificio is array (Character range 'A'..'J', Integer range 1..100) of T_Vivienda;
   type T_Consumo_Medio_Manos is array (Character range 'A'..'J') of Float;

   procedure Obtener_Consumos (E: in T_Edificio;
      Consumo_electrico: out Float;
      Consumo_gas: out T_Consumo_Medio_Manos);

end Laboratorio08;

