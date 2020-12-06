package Laboratorio07a is
   Max_Valores: constant integer := 20;
   type T_Vector_Enteros is array (Integer range <>) of Integer;
   type T_Lista_Estatica is record
      Dato: T_Vector_Enteros(1..Max_Valores);
      cont: Natural;
   end record;
   type T_Complejo_Tri is record
      A,B:Float;
   end record;
   type T_Complejo_Polar is record
      modulo, argumento: Float;
   end record;
   type T_Matriz is array (Integer range <>, Integer range<>) of Integer;

   ------------------
   -- Nivel basico --
   ------------------
   function esta(L: in T_Lista_Estatica; N: in Integer) return Boolean;
   -- pre: L contiene al menos un elemento (L.cont >= 1)
   -- los elementos pueden no seguir un orden
   -- post: resultado = True <--> el valor N esta en L
   function posicion (L: in T_Lista_Estatica; Num: in Integer) return Integer;
   -- pre: V contiene al menos un elemento (L.cont >= 1)
   -- los elementos no siguen ningun orden. el elemento que se busca no tiene por que estar en V
   -- post: posicion en la que se encuentra N y, si no esta, Integer'Last
   function Polar (C: in T_Complejo_tri) return T_complejo_polar;
   -- C es un complejo en forma trigonométrica
   -- post: resultado = el numero complejo en forma polar.
   function Son_Iguales(L1, L2: in T_Lista_Estatica) return Boolean;
   -- L1 y L2 son dos listas estaticas de enteros
   -- post: resultado = true <--> F1=F2 (mismo numero de elementos, en el mismo orden)
   procedure eliminar_elemento (num: in Integer; L: in out T_Lista_Estatica);
   -- pre:  num es un posible elemento de L
   --       L no necesariamente completo
   -- post: L igual si num no estaba en L
   --       L sin las copias de num
   procedure insertar_elemento_en_pos (num, pos: in Integer; L: in out T_Lista_Estatica);
   -- pre:  la posicion de insercion estará en el rango
   --      que el numero de elementos que contenga la lista +1
   --      L tiene al menos un hueco libre
   -- post: si pos es una posición valida de datos, L incluye num en dicha posicion
   --       y todos los elementos se desplazan una posicion a la derecha
   --       Si pos no es valida, no se inserta nada y L se queda igual
   function Pos_Maximo (L: in T_Lista_Estatica) return Integer;
   -- post: Resultado = numero máximo de los incluidos en L
   procedure Ordenar_Burbuja(L: in out T_Lista_Estatica);
   -- post: Los elementos de L están ordenados
   procedure Posicion(M: in T_Matriz; Num: in Integer; Fil,Col: out Integer);
   --post: Fil = fila en la que está Num (0 si no está)
   --      Col = Columna en la que esta Num (0 si no esta)
   procedure Maximo (M: in T_Matriz; Maximo,Fila,Columna: out Integer);
   --post: Maximo = el mayor valor de la matriz
   --      Fila = la menor Fila en la que está maximo
   --      Columna = la menor columna en la que está maximo en esa fila
end Laboratorio07a;

