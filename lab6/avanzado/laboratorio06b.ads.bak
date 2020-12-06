
package Laboratorio06b is
   subtype T_Dia is Integer range 1..31;
   type T_mes is (Enero, febrero, marzo, abril, mayo, junio, julio, agosto, septiembre, octubre, noviembre, diciembre);
   type T_Fecha is record
      Dia: T_Dia;
      Mes: T_Mes;
      anno: Positive;
   end record;
   type T_Grados_Sex is record
      Grados, Minutos, Segundos: Natural;
   end record;

   VACIO: constant integer := Integer'First;
   type T_Vector_Enteros is array (Integer range <>) of Integer;
   type T_Matriz is array (Integer range <>, Integer range<>) of Integer;


   --------------------
   -- Nivel Avanzado --
   --------------------
   Max_palabras: constant integer :=100;
   subtype T_Letra is character range 'A'..'Z';
   type T_contadores_letras is array (T_Letra) of Natural;
   type T_Info_palabra is record
      Long: integer;
      Letras: string(1..30);
   end record;
   type t_palabras is array (Integer range <>) of T_Info_Palabra;
   type T_Info_texto is record
      Cuantas: integer;
      Palabras: t_palabras(1..Max_Palabras);
   end record;

   procedure Cent_A_Sex(Centesimales: in Float; Sexagesimales:out T_Grados_Sex);
   --pre: centesimales>=0
   --post: sexagesimales contiene los grados, minutos y segundos equivalentes a centesimales
   procedure Rotar_Derecha(V:in out T_Vector_Enteros);
   -- pre: V está lleno
   -- post: V con el último elemento en la primera posición y los demas desplazados la derecha
   function esta_en_vector_ordenado(V: in T_vector_enteros; N: in Integer) return Boolean;
   -- pre: V contiene al menos un elemento (V'Last >= 1)
   --      V esta ordenado ascendentemente:
   --              V(i) <= V(i+1),      1 <= i < V'last
   -- post: resultado = True <--> N esta en V
   --       El algoritmo es eficiente y se aprovecha de que V esta ordenado
   procedure eliminar_elemento_ordenado (pos: in Integer; V: in out T_vector_enteros);
   -- pre:  pos es una posición dentro del rango del índice de V
   --       V no necesariamente completo (los elementos en las primeras posiciones, centinela Integer'first)
   --       V ordenado ascendentemente (en los elementos validos)
   -- post: V igual si la posicion no apunta a un dato valido
   --       V sin el elemento de la posicion pos si hay un dato valido
   --       V continua ordenado en los elementos validos
   procedure insertar_elemento_ordenado (num:  in Integer; V: in out T_Vector_Enteros);
   -- pre: V contiene N enteros  (termina en Integer'First)
   --      V ordenado ascendentemente
   --      V tiene al menos un hueco libre
   -- post: V incluye num en la posision que le corresponde segun el orden
   --       y todos los elementos mayores se desplazan una posicion a la derecha
   --       Si pos no es valida, no se inserta nada y V se queda igual
   procedure Eliminar_Repetidos(V: in out T_Vector_Enteros);
   -- pre:  V es un vector con enteros completo
   -- post: V contiene los mismos elementos de V, sin los repetidos en
   --       las posiciones con indice más alto).
   function Letra_Mas_Repetida (Texto: in T_Info_Texto) return T_LETRA;
   -- pre: Texto con letras mayúsculas, minúsculas y signos de puntuacion
   --post: Letra más frecuente del texto (en Mayúsculas).
   --      Si varias, la que aparezca antes en orden alfabético
   procedure Ordenar_Insercion (V: in out T_Vector_Enteros);
   -- pre: V es un Vector de enteros completo, probablemente desordenado
   --post: V contiene los elementos de V en orden de menor a mayor
   function Es_Toeplitz (M: T_Matriz) return Boolean;
   --pre: M es una matriz de enteros (cuadrada o no)
   --post: resultado=true <--> M es una matriz de toeplitz
end Laboratorio06b;

