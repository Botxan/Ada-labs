WITH laboratorio09a;
USE laboratorio09a;
package Lab09a_Escenarios is

   ---------------------
   -- Esta y Posicion --
   ---------------------
   --Nota: ¡Cuidado! L0 es constante, pero el resto de valores de la lista
   --      dinamica se puede modificar y Ada no lo comprueba.
   L0 : constant T_Lista_Dinamica := null; --()
   L1 : constant T_Lista_Dinamica :=  --(1)
      new T_Nodo_Enteros'(1, null);
   L2 : constant T_Lista_Dinamica :=  --(2)
      new T_Nodo_Enteros'(2, null);
   L3 : constant T_Lista_Dinamica :=  --(3)
      new T_Nodo_Enteros'(3, null);
   L12 : constant T_Lista_Dinamica :=  --(1 2)
      new T_Nodo_Enteros'(1, new T_Nodo_Enteros'(2,null));
   L23 : constant T_Lista_Dinamica :=  --(2 3)
      new T_Nodo_Enteros'(2, new T_Nodo_Enteros'(3,null));
   L123 : constant T_Lista_Dinamica := --(1 2 3)
      new T_Nodo_Enteros'(1, new T_Nodo_Enteros'(2,new T_nodo_Enteros'(3,null)));
   L1234 : constant T_Lista_Dinamica := --(1 2 3 4)
      new T_Nodo_Enteros'(1,
      new T_Nodo_Enteros'(2,
      new T_Nodo_Enteros'(3,
      new T_Nodo_Enteros'(4, null))));


   -------------------
   -- Simplificar 3 --
   -------------------
   -- Tomado de lab07b_Escenarios.ads
   -- Caso 1: No todos los valores distan menos de 0.001
   -- S3_LP1-->S3_LP1_res
   -- Caso 2: Todos los puntos distan menos de 0.001
   -- S3_LP2-->S3_LP2_res
   -- Caso 3: Todos los puntos distan menos de 0.001 pero algunos negativo
   -- S3_LP2-->S3_LP2_res

   -- Caso 1: No todos los valores distan menos de 0.001
   type T_Vector_puntos is array(1..12) of T_Punto;
   LP1 : T_Vector_Puntos := (
            1=>(1.1, 1.1), 2=>(1.10001, 1.10001), 3=>(1.10002, 1.10002),
            4=>(4.4, 4.4), 5=>(5.5, 5.5), 6=>(5.50001, 5.50001),
            7=>(7.7, 7.7), 8=>(8.8, 8.8), others=>(-1.0,-1.0));
   LP1_Res : T_Lista_Puntos :=
      new T_Nodo_Punto'((1.1, 1.1),
      new T_Nodo_Punto'((4.4, 4.4),
      new T_Nodo_Punto'((5.5, 5.5),
      new T_Nodo_Punto'((7.7, 7.7),
      new T_Nodo_Punto'((8.8, 8.8), null)))));

   LP2 : T_Vector_Puntos := (
            (3.3000,3.3000),(3.3009,3.2991),(3.2982,3.3018),
            (3.2973,3.3027),(3.2964,3.3036),others=>(-1.0,-1.0));
   LP2_Res : T_Lista_Puntos :=
      new T_Nodo_Punto'((3.3000,3.3000),
      new T_Nodo_Punto'((3.2982,3.3018),
      new T_Nodo_Punto'((3.2964,3.3036), null)));

   LP3 : T_Vector_Puntos := (
            (99.99,99.99),(99.99,99.99),others=>(-1.0,-1.0));
   LP3_Res : T_Lista_Puntos :=
      new T_Nodo_Punto'((99.99,99.99),
      new T_Nodo_Punto'((99.99,99.99), null));

   -- Caso 2: Todos los puntos distan menos de 0.001
   LP4 : T_Vector_Puntos := (
            1..11=>(1.99,1.99),others=>(-1.0,-1.0));
   LP4_Res : T_Lista_Puntos :=
      new T_Nodo_Punto'((1.99,1.99),
      new T_Nodo_Punto'((1.99,1.99), null));

   -- Caso 3: Todos los puntos distan menos de 0.001 algunos negativo
   LP5 : T_Vector_Puntos := (
      1|4|7=>(1.1111,1.1111),
      2|5|8=>(1.1110,1.1110),
      3|6|9=>(1.1112,1.1112),others=>(-1.0,-1.0));
   LP5_Res : T_Lista_Puntos :=
      new T_Nodo_Punto'((1.1111,1.1111),
      new T_Nodo_Punto'((1.1112,1.1112), null));
   LP6 : T_Vector_Puntos := (
      (3.3333,3.3333),(3.3332,3.3332),(3.3331,3.3331),
      (3.3330,3.3330),(3.3329,3.3329),(3.3328,3.3328),
      (3.3327,3.3327),(3.3326,3.3326),(3.3325,3.3325),
      (3.3324,3.3324),(3.3323,3.3323),(3.3322,3.3322),
      others=>(-1.0,-1.0));
   LP6_Res : T_Lista_Puntos :=
      new T_Nodo_Punto'((3.3333,3.3333),
      new T_Nodo_Punto'((3.3323,3.3323),
         new T_Nodo_Punto'((3.3322,3.3322), null)));
-- Este caso falla. Se borra el elemento 3.3341
-- La diferencia con 3.3331 es 0.001 que no es menor que 0.001 pero...

--   LP7 : T_Vector_Puntos := (
--      (3.3331,3.3331),(3.3332,3.3332),(3.3333,3.3333),
--      (3.3334,3.3334),(3.3335,3.3335),(3.3336,3.3336),
--      (3.3337,3.3337),(3.3338,3.3338),(3.3339,3.3339),
--      (3.3340,3.3340),(3.3341,3.3341),(3.3342,3.3342),
--      others=>(-1.0,-1.0));
--   LP7_Res : T_Lista_Puntos :=
--      new T_Nodo_Punto'((3.3331,3.3331),
--      new T_Nodo_Punto'((3.3341,3.3341),
--      new T_Nodo_Punto'((3.3342,3.3342), null)));
   LP8 : T_Vector_Puntos := (
      (3.3331,3.3331),(3.3332,3.3330),(3.3333,3.3329),
      (3.3334,3.3328),(3.3335,3.3327),(3.3336,3.3326),
      (3.3337,3.3325),(3.3338,3.3324),(3.3339,3.3323),
      (3.3340,3.3322),(3.3341,3.3321),(3.3342,3.2220),
      others=>(-1.0,-1.0));
   LP8_Res : T_Lista_Puntos :=
      new T_Nodo_Punto'((3.3331,3.3331),
      new T_Nodo_Punto'((3.3341,3.3321),
      new T_Nodo_Punto'((3.3342,3.3320), null)));
end Lab09a_Escenarios;

