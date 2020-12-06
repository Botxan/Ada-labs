
package Laboratorio06a is
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

   ------------------
   -- Nivel basico --
   ------------------
   function esta_en_vector(V: in T_vector_enteros; N: in Integer) return Boolean;
   -- pre: V contiene al menos un elemento (V'Last >= 1)
   -- los elementos pueden no seguir un orden
   -- post: resultado = True <--> el valor N esta en V
   function posicion (V: in T_Vector_enteros; Num: in Integer) return Integer;
   -- pre: V contiene al menos un elemento (V'Length >= 1)
   -- los elementos no siguen ningun orden. el elemento que se busca no tiene por que estar en V
   -- post: posicion en la que se encuentra N y, si no esta, Integer'Last
   function Son_Iguales(F1, F2: in T_Fecha) return Boolean;
   -- F1 y F2 son dos fechas válidas
   -- post: resultado = true <--> F1=F2
   function Centesimales(Grados: in T_Grados_Sex) return Float;
   --pre: grados, minutos y segundos Naturales
   --post: resultado = grados centesimales equivalentes a los grados, minutos y segundos especificados
   function Son_Iguales(L1, L2: in T_vector_enteros) return Boolean;
   -- L1 y L2 son dos listas de enteros terminadas en VACIO
   -- post: resultado = true <--> F1=F2 (mismo numero de elementos, en el mismo orden)
   procedure eliminar_elemento (pos: in Integer; V: in out T_vector_enteros);
   -- pre:  pos es una posición dentro del rango del índice de V
   --       V no necesariamente completo (los elementos en las primeras posiciones, centinela Integer'first)
   -- post: V igual si la posicion no apunta a un dato valido
   --       V sin el elemento de la posicion pos si hay un dato valido
   --NOTA:  Busca eficiencia: El vector no tiene que mantener ningun orden particular
   procedure insertar_elemento_en_pos (num: in Integer; pos: in Integer; V: in out T_Vector_Enteros);
   -- pre: V contiene N enteros  (termina en Integer'First)
   --      la posicion de insercion estará en el rango
   --      que el numero de elementos que contenga la lista +1
   --      V tiene al menos un hueco libre
   -- post: si pos es una posición valida de datos, V incluye num en dicha posicion
   --       y todos los elementos se desplazan una posicion a la derecha
   --       Si pos no es valida, no se inserta nada y V se queda igual
   function Pos_Maximo (V: in T_Vector_Enteros) return Integer;
   -- pre:  El Vector tiene todos los elementos ocupados
   -- post: Resultado = numero máximo de los incluidos en V
   procedure Ordenar_Seleccion (V: in out T_Vector_Enteros);
   -- pre:  El Vector tiene todos los elementos ocupados
   -- post: Los elementos del vector están ordenados
end Laboratorio06a;

