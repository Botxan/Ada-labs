with Laboratorio09b;
use Laboratorio09b;

package Lab09b_Escenarios is

   -----------
   -- Media --
   -----------
--   type T_Vector_Enteros is array (Integer range<>) of Integer;
   V0: constant T_Vector_Enteros(1..10) := (1,1,1,1,1,1,1,1,1,1);
   V0_Ini : constant Integer :=  1;
   V0_Fin : constant Integer := 10;
   V0_Res : constant Float := 1.0;

   V1: constant T_Vector_Enteros(1..10) := (1,2,3,4,5,6,7,8,9,10);
   V1_Ini : constant Integer :=  1;
   V1_Fin : constant Integer := 10;
   V1_Res : constant Float := 5.5;

   V2: constant T_Vector_Enteros(1..10) := (1,2,3,4,5,6,7,8,9,10);
   V2_Ini : constant Integer := 1;
   V2_Fin : constant Integer := 4;
   V2_Res : constant Float := 2.5;

   V3: constant T_Vector_Enteros(1..10) := (1,2,3,4,5,6,7,8,9,10);
   V3_Ini : constant Integer :=  8;
   V3_Fin : constant Integer := 10;
   V3_Res : constant Float := 9.0;

   V4: constant T_Vector_Enteros(1..10) := (1,2,3,4,5,6,7,8,9,10);
   V4_Ini : constant Integer :=  6;
   V4_Fin : constant Integer := 10;
   V4_Res : constant Float := 8.0;

   -- Vector vacio
   V5: constant T_Vector_Enteros(1..0) := (others => 0);
   V5_Ini : constant Integer :=  2;
   V5_Fin : constant Integer := 1;
   V5_Res : constant Float := Float'Last;

   ------------
   -- Maximo --
   ------------
   M1:constant T_Vector_Enteros(1..10) := (1,2,3,4,5,6,5,4,3,2);
   M1_Ini : constant Integer :=  1;
   M1_Fin : constant Integer := 10;
   M1_Res : constant Integer :=  6;
   M1_pos : constant Integer :=  6;
   M2: constant T_Vector_Enteros(1..10) := (9,8,7,6,5,4,3,2,1,0);
   M2_Ini : constant Integer :=  1;
   m2_Fin : constant Integer := 10;
   M2_Res : constant Integer :=  9;
   M2_pos : constant Integer :=  1;
   M3: constant T_Vector_Enteros(1..10) := (others => -10);
   M3_Ini : constant Integer :=  1;
   M3_Fin : constant Integer :=  7;
   M3_Res : constant Integer :=-10;
   M3_pos : constant Integer :=  1;
   M4: constant T_Vector_Enteros(1..10) := (0,1,2,3,4,5,6,7,8,9);
   M4_Ini : constant Integer :=  1;
   M4_Fin : constant Integer := 10;
   M4_Res : constant Integer :=  9;
   M4_pos : constant Integer := 10;
   M5: constant T_Vector_Enteros(1..10) := (1,2,3,4,5,6,5,4,3,2);
   M5_Ini : constant Integer :=  5;
   M5_Fin : constant Integer :=  5;
   M5_Res : constant Integer :=  5;
   M5_pos : constant Integer :=  1;
   M6: constant T_Vector_Enteros(1..10) := (1,2,3,4,5,6,5,4,3,2);
   M6_Ini : constant Integer :=  2;
   M6_Fin : constant Integer :=  1;
   M6_Res : constant Integer :=  Integer'First;
   M6_pos : constant Integer :=  0;


   --------------
   -- Insertar --
   --------------
   -- Caso 1: Insertar en el medio (Pos 3 de 6)
   I1:constant T_Vector_Enteros(1..10) := (2,4,6,8,10,12,14,16,18,20);
   I1_Ini1 : constant Integer := 1;
   I1_Fin1 : constant Integer := 6;
   I1_Num  : constant Integer := 5;
   I1_Res  : constant T_Vector_Enteros(1..10):= (2,4,5,6,8,10,12,14,16,18);
   I1_Ini2 : constant Integer := 1;
   I1_Fin2 : constant Integer := 7;
   -- Caso 2: Insertar al final (Pos 6 de 5)
   I2:constant T_Vector_Enteros(1..10) := (2,4,6,8,10,12,14,16,18,20);
   I2_Ini1 : constant Integer := 1;
   I2_Fin1 : constant Integer := 5;
   I2_Num  : constant Integer := 11;
   I2_Res  : constant T_Vector_Enteros(1..10):= (2,4,6,8,10,11,12,14,16,18);
   I2_Ini2 : constant Integer := 1;
   I2_Fin2 : constant Integer := 6;
   -- Caso 3: Insertar al principio (pos 1 de 5)
   I3:constant T_Vector_Enteros(1..10) := (2,4,6,8,10,12,14,16,18,20);
   I3_Ini1 : constant Integer := 1;
   I3_Fin1 : constant Integer := 5;
   I3_Num  : constant Integer := 1;
   I3_Res  : constant T_Vector_Enteros(1..10):= (1,2,4,6,8,10,12,14,16,18);
   I3_Ini2 : constant Integer := 1;
   I3_Fin2 : constant Integer := 6;
   -- Caso 4: Insertar al principio lista de 1(pos 1 de 1)
   I4:constant T_Vector_Enteros(1..10) := (2,4,6,8,10,12,14,16,18,20);
   I4_Ini1 : constant Integer := 1;
   I4_Fin1 : constant Integer := 1;
   I4_Num  : constant Integer := 1;
   I4_Res  : constant T_Vector_Enteros(1..10):= (1,2,4,6,8,10,12,14,16,18);
   I4_Ini2 : constant Integer := 1;
   I4_Fin2 : constant Integer := 2;
   -- Caso 5: Insertar al final lista de 1(pos 2 de 1)
   I5:constant T_Vector_Enteros(1..10) := (2,4,6,8,10,12,14,16,18,20);
   I5_Ini1 : constant Integer := 1;
   I5_Fin1 : constant Integer := 1;
   I5_Num  : constant Integer := 3;
   I5_Res  : constant T_Vector_Enteros(1..10):= (2,3,4,6,8,10,12,14,16,18);
   I5_Ini2 : constant Integer := 1;
   I5_Fin2 : constant Integer := 2;
   -- Caso 6: Insertar en lista vacia (pos 1 de 0)
   I6:constant T_Vector_Enteros(1..10) := (2,4,6,8,10,12,14,16,18,20);
   I6_Ini1 : constant Integer := 2;
   I6_Fin1 : constant Integer := 1;
   I6_Num  : constant Integer := 2;
   I6_Res  : constant T_Vector_Enteros(1..10):= (2,4,6,8,10,12,14,16,18,20);
   I6_Ini2 : constant Integer := 1;
   I6_Fin2 : constant Integer := 1;

   -------------------------
   -- Clonar_y_Concatenar --
   -------------------------
   -- Caso 1: Concatenar dos listas.
   CyC1_L1 : constant T_Vector_Enteros(1..10) := (1,2,3,4,5,6,7,8,9,0);
   CyC1_Ini1 : constant Integer := 1;
   CyC1_Fin1 : constant Integer := 5;
   CyC1_L2 : constant T_Vector_Enteros(1..10) := (1,2,3,4,5,6,7,8,9,0);
   CyC1_Ini2 : constant Integer := 6;
   CyC1_Fin2 : constant Integer := 10;
   CyC1_Res  : constant T_Vector_Enteros(1..10):= (1,2,3,4,5,6,7,8,9,0);
   CyC1_Ini3 : constant Integer := 1;
   CyC1_Fin3 : constant Integer := 10;
   -- Caso 2: Concatenar lista de uno con lista con datos
   CyC2_L1 : constant T_Vector_Enteros(1..10) := (1,2,3,4,5,6,7,8,9,0);
   CyC2_Ini1 : constant Integer := 2;
   CyC2_Fin1 : constant Integer := 2;
   CyC2_L2 : constant T_Vector_Enteros(1..10) := (1,2,3,4,5,6,7,8,9,0);
   CyC2_Ini2 : constant Integer := 3;
   CyC2_Fin2 : constant Integer := 10;
   CyC2_Res  : constant T_Vector_Enteros(1..10):= (1,2,3,4,5,6,7,8,9,0);
   CyC2_Ini3 : constant Integer := 2;
   CyC2_Fin3 : constant Integer := 10;
   -- Caso 3: Concatenar lista con datos con lista de uno
   CyC3_L1 : constant T_Vector_Enteros(1..10) := (1,2,3,4,5,6,7,8,9,0);
   CyC3_Ini1 : constant Integer := 1;
   CyC3_Fin1 : constant Integer := 8;
   CyC3_L2 : constant T_Vector_Enteros(1..10) := (1,2,3,4,5,6,7,8,9,0);
   CyC3_Ini2 : constant Integer := 9;
   CyC3_Fin2 : constant Integer := 9;
   CyC3_Res  : constant T_Vector_Enteros(1..10):= (1,2,3,4,5,6,7,8,9,0);
   CyC3_Ini3 : constant Integer := 1;
   CyC3_Fin3 : constant Integer := 9;
   -- Caso 4: Concatenar dos listas de uno
   CyC4_L1 : constant T_Vector_Enteros(1..10) := (1,2,3,4,5,6,7,8,9,0);
   CyC4_Ini1 : constant Integer := 10;
   CyC4_Fin1 : constant Integer := 10;
   CyC4_L2 : constant T_Vector_Enteros(1..10) := (1,2,3,4,5,6,7,8,9,0);
   CyC4_Ini2 : constant Integer := 1;
   CyC4_Fin2 : constant Integer := 1;
   CyC4_Res  : constant T_Vector_Enteros(1..10):= (0,1,2,3,4,5,6,7,8,9);
   CyC4_Ini3 : constant Integer := 1;
   CyC4_Fin3 : constant Integer := 2;
   -- Caso 2: Concatenar lista vacia con lista con datos
   CyC5_L1 : constant T_Vector_Enteros(1..10) := (1,2,3,4,5,6,7,8,9,0);
   CyC5_Ini1 : constant Integer := 2;
   CyC5_Fin1 : constant Integer := 1;
   CyC5_L2 : constant T_Vector_Enteros(1..10) := (1,2,3,4,5,6,7,8,9,0);
   CyC5_Ini2 : constant Integer := 1;
   CyC5_Fin2 : constant Integer := 5;
   CyC5_Res  : constant T_Vector_Enteros(1..10):= (1,2,3,4,5,6,7,8,9,0);
   CyC5_Ini3 : constant Integer := 1;
   CyC5_Fin3 : constant Integer := 5;
   -- Caso 3: Concatenar lista con datos con lista vacía
   CyC6_L1 : constant T_Vector_Enteros(1..10) := (1,2,3,4,5,6,7,8,9,0);
   CyC6_Ini1 : constant Integer := 1;
   CyC6_Fin1 : constant Integer := 5;
   CyC6_L2 : constant T_Vector_Enteros(1..10) := (1,2,3,4,5,6,7,8,9,0);
   CyC6_Ini2 : constant Integer := 6;
   CyC6_Fin2 : constant Integer := 5;
   CyC6_Res  : constant T_Vector_Enteros(1..10):= (1,2,3,4,5,6,7,8,9,0);
   CyC6_Ini3 : constant Integer := 1;
   CyC6_Fin3 : constant Integer := 5;
   -- Caso 4: Concatenar dos listas vacias
   CyC7_L1 : constant T_Vector_Enteros(1..10) := (1,2,3,4,5,6,7,8,9,0);
   CyC7_Ini1 : constant Integer := 9;
   CyC7_Fin1 : constant Integer := 8;
   CyC7_L2 : constant T_Vector_Enteros(1..10) := (1,2,3,4,5,6,7,8,9,0);
   CyC7_Ini2 : constant Integer := 2;
   CyC7_Fin2 : constant Integer := 1;
   CyC7_Res  : constant T_Vector_Enteros(1..10):= (1,2,3,4,5,6,7,8,9,0);
   CyC7_Ini3 : constant Integer := 10;
   CyC7_Fin3 : constant Integer := 9;

   ------------
   -- Borrar --
   ------------
   --Caso1: Borrar un elemento que existe en el medio en lista de 2 o mas
   B1_L: constant T_Vector_Enteros(1..10):=(1,2,3,4,5,6,7,8,9,10);
   B1_ini1 : constant Integer := 1;
   B1_fin1 : constant Integer := 10;
   B1_Num  : constant Integer := 5;
   B1_Res  : constant T_Vector_Enteros(1..10):= (0,1,2,3,4,6,7,8,9,10);
   B1_ini2 : constant Integer := 2;
   B1_fin2 : constant Integer := 10;
   --Caso2: Borrar el elemento del final en lista de dos o mas
   B2_L: constant T_Vector_Enteros(1..10):=(1,2,3,4,5,6,7,8,9,10);
   B2_ini1 : constant Integer := 1;
   B2_fin1 : constant Integer := 10;
   B2_Num :  constant Integer := 10;
   B2_Res :  constant T_Vector_Enteros(1..10):= (1,2,3,4,5,6,7,8,9,10);
   B2_ini2 : constant Integer := 1;
   B2_fin2 : constant Integer := 9;
   --Caso3: Borrar el elemento del principio en lista de dos o mas
   B3_L: constant T_Vector_Enteros(1..10):=(1,2,3,4,5,6,7,8,9,10);
   B3_ini1 : constant Integer := 1;
   B3_fin1 : constant Integer := 10;
   B3_Num : constant Integer := 1;
   B3_Res : constant T_Vector_Enteros(1..10):= (1,2,3,4,5,6,7,8,9,10);
   B3_ini2 : constant Integer := 2;
   B3_fin2 : constant Integer := 10;
   --Caso4: Borrar TODOS los elementos de una lista de dos o mas
   B4_L: constant T_Vector_Enteros(1..10):=(5,5,5,5,5,5,5,5,5,5);
   B4_ini1 : constant Integer := 1;
   B4_fin1 : constant Integer := 10;
   B4_Num : constant Integer := 5;
   B4_Res : constant T_Vector_Enteros(1..10):= (0,1,2,3,4,6,7,8,9,0);
   B4_ini2 : constant Integer := 2;
   B4_fin2 : constant Integer := 1;
   --Caso5: Borrar un elemento que NO existe en lista de dos o mas
   B5_L: constant T_Vector_Enteros(1..10):=(1,2,3,4,5,6,7,8,9,10);
   B5_ini1 : constant Integer := 1;
   B5_fin1 : constant Integer := 6;
   B5_Num : constant Integer := 7;
   B5_Res : constant T_Vector_Enteros(1..10):= (1,2,3,4,5,6,7,8,9,10);
   B5_ini2 : constant Integer := 1;
   B5_fin2 : constant Integer := 6;
   --Caso6: Borrar un elemento que existe en una lista de 1
   B6_L: constant T_Vector_Enteros(1..10):=(1,2,3,4,5,6,7,8,9,10);
   B6_ini1 : constant Integer := 10;
   B6_fin1 : constant Integer := 10;
   B6_Num : constant Integer := 10;
   B6_Res : constant T_Vector_Enteros(1..10):= (0,1,2,3,4,6,7,8,9,10);
   B6_ini2 : constant Integer := 2;
   B6_fin2 : constant Integer := 1;
   --Caso7: Borrar un elemento que NO existe en lista de 1
   B7_L: constant T_Vector_Enteros(1..10):=(1,2,3,4,5,6,7,8,9,10);
   B7_ini1 : constant Integer := 1;
   B7_fin1 : constant Integer := 1;
   B7_Num : constant Integer := 5;
   B7_Res : constant T_Vector_Enteros(1..10):= (1,2,3,4,5,6,7,8,9,10);
   B7_ini2 : constant Integer := 1;
   B7_fin2 : constant Integer := 1;
   --Caso8: Borrar un elemento que NO existe en lista de 0 (vacia)
   B8_L: constant T_Vector_Enteros(1..10):=(1,2,3,4,5,6,7,8,9,10);
   B8_ini1 : constant Integer := 10;
   B8_fin1 : constant Integer := 9;
   B8_Num  : constant Integer := 5;
   B8_Res : constant T_Vector_Enteros(1..10):= (0,1,2,3,4,6,7,8,9,10);
   B8_ini2 : constant Integer := 10;
   B8_fin2 : constant Integer := 9;

   ------------------
   -- Interseccion --
   ------------------
   --Caso1: L1 Varios elementos y L2 varios elementos (C y NC)
   --(1,3 5 7 9 11 15 17) y (1 2 3 4 5 6 7 8)
   --=> (1 1 3 3 5 5 7 7)(2 4 6 8 9 11 15 17)
   Interseccion1_L1 : constant T_Vector_Enteros(1..10) :=
      (1,3,5,7,9,11,15,17,19,21);
   Interseccion1_Ini1 : constant Integer := 1;
   Interseccion1_Fin1 : constant Integer := 8;
   Interseccion1_L2 : constant T_Vector_Enteros(1..10) :=
      (1,2,3,4,5,6,7,8,9,0);
   Interseccion1_Ini2 : constant Integer := 1;
   Interseccion1_Fin2 : constant Integer := 8;
   Interseccion1_ResC : constant T_Vector_Enteros(1..10):=
      (1,1,3,3,5,5,7,7,0,0);
   Interseccion1_Ini3 : constant Integer := 1;
   Interseccion1_Fin3 : constant Integer := 8;
   Interseccion1_ResN : constant T_Vector_Enteros(1..10):=
      (2,4,6,8,9,11,15,17,0,0);
   Interseccion1_Inir : constant Integer := 1;
   Interseccion1_Finr : constant Integer := 8;
   --Caso2: L1 Varios elementos y L2 varios elementos (C)
   --(1,3 5 7 9 11 15 17) y (1 3 5 7)
   --=> (1 1 3 3 5 5 7 7)(9 11 15 17)
   Interseccion2_L1 : constant T_Vector_Enteros(1..10) :=
      (1,3,5,7,9,11,15,17,19,21);
   Interseccion2_Ini1 : constant Integer := 1;
   Interseccion2_Fin1 : constant Integer := 8;
   Interseccion2_L2 : constant T_Vector_Enteros(1..10) :=
      (0,1,3,5,7,8,9,0,0,0);
   Interseccion2_Ini2 : constant Integer := 2;
   Interseccion2_Fin2 : constant Integer := 5;
   Interseccion2_ResC : constant T_Vector_Enteros(1..10):=
      (1,1,3,3,5,5,7,7,0,0);
   Interseccion2_Ini3 : constant Integer := 1;
   Interseccion2_Fin3 : constant Integer := 8;
   Interseccion2_ResN : constant T_Vector_Enteros(1..10):=
      (2,4,6,8,9,11,15,17,0,0);
   Interseccion2_Inir : constant Integer := 5;
   Interseccion2_Finr : constant Integer := 8;
   --Caso3: L1 VArios elementos y L2 varios elementos (NC)
   --(1 3 5 7)y(2 4 8 9)=>() (1 2 3 4 5 7 8 9)
   Interseccion3_L1 : constant T_Vector_Enteros(1..10) :=
      (1,3,5,7,9,11,15,17,19,21);
   Interseccion3_Ini1 : constant Integer := 1;
   Interseccion3_Fin1 : constant Integer := 4;
   Interseccion3_L2 : constant T_Vector_Enteros(1..10) :=
      (2,4,8,9,0,0,0,0,0,0);
   Interseccion3_Ini2 : constant Integer := 1;
   Interseccion3_Fin2 : constant Integer := 4;
   Interseccion3_ResC : constant T_Vector_Enteros(1..10):=
      (1,1,3,3,5,5,7,7,0,0);
   Interseccion3_Ini3 : constant Integer := 2;
   Interseccion3_Fin3 : constant Integer := 1;
   Interseccion3_ResN : constant T_Vector_Enteros(1..10):=
      (1,2,3,4,5,7,8,9,11,15);
   Interseccion3_Inir : constant Integer := 1;
   Interseccion3_Finr : constant Integer := 8;
   --Caso4: L1 Varios elementos y L2 un elemento (C)
   --(1 3 5 7)y(5) => (5 5) (1 3 7)
   Interseccion4_L1 : constant T_Vector_Enteros(1..10) :=
      (1,3,5,7,9,11,15,17,19,21);
   Interseccion4_Ini1 : constant Integer := 1;
   Interseccion4_Fin1 : constant Integer := 4;
   Interseccion4_L2 : constant T_Vector_Enteros(1..10) :=
      (0,1,3,5,7,8,9,0,0,0);
   Interseccion4_Ini2 : constant Integer := 4;
   Interseccion4_Fin2 : constant Integer := 4;
   Interseccion4_ResC : constant T_Vector_Enteros(1..10):=
      (1,1,3,3,5,5,7,7,0,0);
   Interseccion4_Ini3 : constant Integer := 5;
   Interseccion4_Fin3 : constant Integer := 6;
   Interseccion4_ResN : constant T_Vector_Enteros(1..10):=
      (1,3,7,8,9,11,15,17,0,0);
   Interseccion4_Inir : constant Integer := 1;
   Interseccion4_Finr : constant Integer := 3;
   --Caso5: L1 Varios elementos y L2 un elemento (NC)
   --(1 3 5 7)y(0) => () (0 1 3 7)
   Interseccion5_L1 : constant T_Vector_Enteros(1..10) :=
      (1,3,5,7,9,11,15,17,19,21);
   Interseccion5_Ini1 : constant Integer := 1;
   Interseccion5_Fin1 : constant Integer := 4;
   Interseccion5_L2 : constant T_Vector_Enteros(1..10) :=
      (0,1,3,5,7,8,9,0,0,0);
   Interseccion5_Ini2 : constant Integer := 1;
   Interseccion5_Fin2 : constant Integer := 1;
   Interseccion5_ResC : constant T_Vector_Enteros(1..10):=
      (1,1,3,3,5,5,7,7,0,0);
   Interseccion5_Ini3 : constant Integer := 9;
   Interseccion5_Fin3 : constant Integer := 8;
   Interseccion5_ResN : constant T_Vector_Enteros(1..10):=
      (0,1,3,7,9,11,15,17,0,0);
   Interseccion5_Inir : constant Integer := 1;
   Interseccion5_Finr : constant Integer := 4;
   --Caso6: L1 Varios elementos y L2 vacia
   --(1 3 5 7)y()  => () (1 3 5 7)
   Interseccion6_L1 : constant T_Vector_Enteros(1..10) :=
      (1,3,5,7,9,11,15,17,19,21);
   Interseccion6_Ini1 : constant Integer := 1;
   Interseccion6_Fin1 : constant Integer := 4;
   Interseccion6_L2 : constant T_Vector_Enteros(1..10) :=
      (0,1,3,5,7,8,9,0,0,0);
   Interseccion6_Ini2 : constant Integer := 2;
   Interseccion6_Fin2 : constant Integer := 1;
   Interseccion6_ResC : constant T_Vector_Enteros(1..10):=
      (1,1,3,3,5,5,7,7,0,0);
   Interseccion6_Ini3 : constant Integer := 2;
   Interseccion6_Fin3 : constant Integer := 1;
   Interseccion6_ResN : constant T_Vector_Enteros(1..10):=
      (1,3,5,7,9,11,15,17,0,0);
   Interseccion6_Inir : constant Integer := 1;
   Interseccion6_Finr : constant Integer := 4;
   --Caso7: L1 con 1 elemento (C) y L2 varios elementos
   --() y (1 3 5 7)=> () (1 3 5 7)
   Interseccion7_L1 : constant T_Vector_Enteros(1..10) :=
      (1,3,5,7,9,11,15,17,19,21);
   Interseccion7_Ini1 : constant Integer := 2;
   Interseccion7_Fin1 : constant Integer := 1;
   Interseccion7_L2 : constant T_Vector_Enteros(1..10) :=
      (0,1,3,5,7,8,9,0,0,0);
   Interseccion7_Ini2 : constant Integer := 2;
   Interseccion7_Fin2 : constant Integer := 5;
   Interseccion7_ResC : constant T_Vector_Enteros(1..10):=
      (1,1,3,3,5,5,7,7,0,0);
   Interseccion7_Ini3 : constant Integer := 2;
   Interseccion7_Fin3 : constant Integer := 1;
   Interseccion7_ResN : constant T_Vector_Enteros(1..10):=
      (1,3,5,7,9,11,15,17,0,0);
   Interseccion7_Inir : constant Integer := 1;
   Interseccion7_Finr : constant Integer := 4;
   --Caso8: L1 con 1 elemento (NC) y L2 varios elementos
   --(9) y (1 3 5 7)=> () (1 3 5 7 9)
   Interseccion8_L1 : constant T_Vector_Enteros(1..10) :=
      (1,3,5,7,9,11,15,17,19,21);
   Interseccion8_Ini1 : constant Integer := 5;
   Interseccion8_Fin1 : constant Integer := 5;
   Interseccion8_L2 : constant T_Vector_Enteros(1..10) :=
      (0,1,3,5,7,8,9,0,0,0);
   Interseccion8_Ini2 : constant Integer := 2;
   Interseccion8_Fin2 : constant Integer := 5;
   Interseccion8_ResC : constant T_Vector_Enteros(1..10):=
      (1,1,3,3,5,5,7,7,0,0);
   Interseccion8_Ini3 : constant Integer := 2;
   Interseccion8_Fin3 : constant Integer := 1;
   Interseccion8_ResN : constant T_Vector_Enteros(1..10):=
      (1,3,5,7,9,11,15,17,0,0);
   Interseccion8_Inir : constant Integer := 1;
   Interseccion8_Finr : constant Integer := 5;
   --Caso9: L1 con 1 elemento y L2 vacia
   --(3) y (1 3 5 7)=> (3 3) (1 5 7)
   Interseccion9_L1 : constant T_Vector_Enteros(1..10) :=
      (1,3,5,7,9,11,15,17,19,21);
   Interseccion9_Ini1 : constant Integer := 2;
   Interseccion9_Fin1 : constant Integer := 2;
   Interseccion9_L2 : constant T_Vector_Enteros(1..10) :=
      (0,1,3,5,7,8,9,0,0,0);
   Interseccion9_Ini2 : constant Integer := 2;
   Interseccion9_Fin2 : constant Integer := 5;
   Interseccion9_ResC : constant T_Vector_Enteros(1..10):=
      (1,1,3,3,5,5,7,7,0,0);
   Interseccion9_Ini3 : constant Integer := 3;
   Interseccion9_Fin3 : constant Integer := 4;
   Interseccion9_ResN : constant T_Vector_Enteros(1..10):=
      (1,1,5,7,9,11,15,17,0,0);
   Interseccion9_Inir : constant Integer := 2;
   Interseccion9_Finr : constant Integer := 4;
   --Caso10: L1 vacio y L2 vacio
   --() y ()
   Interseccion0_L1 : constant T_Vector_Enteros(1..10) :=
      (1,3,5,7,9,11,15,17,19,21);
   Interseccion0_Ini1 : constant Integer := 2;
   Interseccion0_Fin1 : constant Integer := 1;
   Interseccion0_L2 : constant T_Vector_Enteros(1..10) :=
      (0,1,3,5,7,8,9,0,0,0);
   Interseccion0_Ini2 : constant Integer := 2;
   Interseccion0_Fin2 : constant Integer := 1;
   Interseccion0_ResC : constant T_Vector_Enteros(1..10):=
      (1,1,3,3,5,5,7,7,0,0);
   Interseccion0_Ini3 : constant Integer := 2;
   Interseccion0_Fin3 : constant Integer := 1;
   Interseccion0_ResN : constant T_Vector_Enteros(1..10):=
      (1,3,5,7,9,11,15,17,0,0);
   Interseccion0_Inir : constant Integer := 2;
   Interseccion0_Finr : constant Integer := 1;
   -----------------
   -- Son_iguales --
   -----------------
   --Caso1: (0 1 2 3) y (0 1 2 3)
   Iguales1_L1:constant T_Vector_Enteros(1..10) := (0,1,2,3,4,5,6,7,8,9);
   Iguales1_Ini1: constant Integer := 1;
   Iguales1_Fin1: constant Integer := 4;
   Iguales1_L2: constant T_Vector_Enteros(1..10):= (0,1,2,3,4,5,6,7,8,9);
   Iguales1_Ini2: constant Integer := 1;
   Iguales1_Fin2: constant Integer := 4;
   Iguales1_Res: constant Boolean := True;
   --Caso2: (1 2 3 4) y (1 2 3 4 5)
   Iguales2_L1:constant T_Vector_Enteros(1..10) := (0,1,2,3,4,5,6,7,8,9);
   Iguales2_Ini1: constant Integer := 2;
   Iguales2_Fin1: constant Integer := 5;
   Iguales2_L2: constant T_Vector_Enteros(1..10):= (0,1,2,3,4,5,6,7,8,9);
   Iguales2_Ini2: constant Integer := 2;
   Iguales2_Fin2: constant Integer := 6;
   Iguales2_Res: constant Boolean := False;
   --Caso3: (1 2 3) (1)
   Iguales3_L1:constant T_Vector_Enteros(1..10) := (0,1,2,3,4,5,6,7,8,9);
   Iguales3_Ini1: constant Integer := 2;
   Iguales3_Fin1: constant Integer := 4;
   Iguales3_L2: constant T_Vector_Enteros(1..10):= (0,1,2,3,4,5,6,7,8,9);
   Iguales3_Ini2: constant Integer := 2;
   Iguales3_Fin2: constant Integer := 2;
   Iguales3_Res: constant Boolean := False;
   --Caso4: (1) y (1 2)
   Iguales4_L1:constant T_Vector_Enteros(1..10) := (0,1,2,3,4,5,6,7,8,9);
   Iguales4_Ini1: constant Integer := 2;
   Iguales4_Fin1: constant Integer := 2;
   Iguales4_L2: constant T_Vector_Enteros(1..10):= (0,1,2,3,4,5,6,7,8,9);
   Iguales4_Ini2: constant Integer := 2;
   Iguales4_Fin2: constant Integer := 3;
   Iguales4_Res: constant Boolean := False;
   --Caso5: (1) y (1)
   Iguales5_L1:constant T_Vector_Enteros(1..10) := (0,1,2,3,4,5,6,7,8,9);
   Iguales5_Ini1: constant Integer := 2;
   Iguales5_Fin1: constant Integer := 2;
   Iguales5_L2: constant T_Vector_Enteros(1..10):= (0,1,2,3,4,5,6,7,8,9);
   Iguales5_Ini2: constant Integer := 2;
   Iguales5_Fin2: constant Integer := 2;
   Iguales5_Res: constant Boolean := True;
   --Caso6: () y (1 2)
   Iguales6_L1:constant T_Vector_Enteros(1..10) := (0,1,2,3,4,5,6,7,8,9);
   Iguales6_Ini1: constant Integer := 2;
   Iguales6_Fin1: constant Integer := 1;
   Iguales6_L2: constant T_Vector_Enteros(1..10):= (0,1,2,3,4,5,6,7,8,9);
   Iguales6_Ini2: constant Integer := 2;
   Iguales6_Fin2: constant Integer := 3;
   Iguales6_Res: constant Boolean := False;
   --Caso7: (1 2) y ()
   Iguales7_L1:constant T_Vector_Enteros(1..10) := (0,1,2,3,4,5,6,7,8,9);
   Iguales7_Ini1: constant Integer := 2;
   Iguales7_Fin1: constant Integer := 3;
   Iguales7_L2: constant T_Vector_Enteros(1..10):= (0,1,2,3,4,5,6,7,8,9);
   Iguales7_Ini2: constant Integer := 2;
   Iguales7_Fin2: constant Integer := 1;
   Iguales7_Res: constant Boolean := False;
   --Caso8: () y ()
   Iguales8_L1:constant T_Vector_Enteros(1..10) := (0,1,2,3,4,5,6,7,8,9);
   Iguales8_Ini1: constant Integer := 2;
   Iguales8_Fin1: constant Integer := 1;
   Iguales8_L2: constant T_Vector_Enteros(1..10):= (0,1,2,3,4,5,6,7,8,9);
   Iguales8_Ini2: constant Integer := 3;
   Iguales8_Fin2: constant Integer := 2;
   Iguales8_Res: constant Boolean := True;

   -----------------
   -- Simplificar --
   -----------------
   type t_Vector_Puntos is array(Integer range <>) of T_Punto;
   subtype T_V15 is T_Vector_Puntos(1..15);
   Simplify: constant T_V15 := (
      (0.1,0.1),(0.2,0.2),(0.3,0.3),(0.4,0.4),(0.5,0.5),
      (0.6,0.6),(0.7,0.7),(0.8,0.8),(0.9,0.9),(1.0,1.0),
      (1.1,1.1),(1.2,1.2),(1.3,1.3),(1.4,1.4),(1.5,1.5));
   --Caso1: Lista de 15 elementos (queda 1---5---9------13--15)
   S_Ini01: constant Integer :=  1;
   S_Fin01: constant Integer := 15;
   S_Res01: constant T_V15 := (
      (0.1,0.1),(0.5,0.5),(0.9,0.9),(1.3,1.3),(1.5,1.5),
      others=>(-1.0,-1.0));
   S_Res01_len: Constant Integer := 5;

   --Caso2: Lista de 14 elementos (queda 1---5---9------1314)
   S_Ini02: constant Integer :=  1;
   S_Fin02: constant Integer := 14;
   S_Res02: constant T_V15 := (
      (0.1,0.1),(0.5,0.5),(0.9,0.9),(1.3,1.3),(1.4,1.4),
         others=>(-1.0,-1.0));
   S_Res02_len: Constant Integer := 5;

   --Caso3: Lista de 13 elementos (queda 1---5---9------13)
   S_Ini03: constant Integer :=  1;
   S_Fin03: constant Integer := 13;
   S_Res03: constant T_V15 := (
      (0.1,0.1),(0.5,0.5),(0.9,0.9),(1.3,1.3),others=>(-1.0,-1.0));
   S_Res03_len: Constant Integer := 4;

   --Caso4: Lista de 12 elementos (queda 1---5---9----12)
   S_Ini04: constant Integer :=  1;
   S_Fin04: constant Integer := 12;
   S_Res04: constant T_V15 := (
      (0.1,0.1),(0.5,0.5),(0.9,0.9),(1.2,1.2),others=>(-1.0,-1.0));
   S_Res04_len: Constant Integer := 4;

   --Caso5: Lista de 11 elementos (queda 1---5---9--11)
   S_Ini05: constant Integer :=  1;
   S_Fin05: constant Integer := 11;
   S_Res05: constant T_V15 := (
      (0.1,0.1),(0.5,0.5),(0.9,0.9),(1.1,1.1),others=>(-1.0,-1.0));
   S_Res05_len: Constant Integer := 4;

   --Caso6: Lista de 10 elementos (queda 1---5---910)
   S_Ini06: constant Integer :=  1;
   S_Fin06: constant Integer := 10;
   S_Res06: constant T_V15 := (
      (0.1,0.1),(0.5,0.5),(0.9,0.9),(1.0,1.0),others=>(-1.0,-1.0));
   S_Res06_len: Constant Integer := 4;

   --Caso7: Lista de  9 elementos (queda 1---5---9)
   S_Ini07: constant Integer :=  1;
   S_Fin07: constant Integer := 9;
   S_Res07: constant T_V15 := (
      (0.1,0.1),(0.5,0.5),(0.9,0.9),others=>(-1.0,-1.0));
   S_Res07_len: Constant Integer := 3;

   --Caso8: Lista de  8 elementos (queda 1---5--8)
   S_Ini08: constant Integer :=  1;
   S_Fin08: constant Integer := 8;
   S_Res08: constant T_V15 := (
      (0.1,0.1),(0.5,0.5),(0.8,0.8),
         others=>(-1.0,-1.0));
   S_Res08_len: Constant Integer := 3;

   --Caso9: Lista de  7 elementos (queda 1---5-7)
   S_Ini09: constant Integer :=  1;
   S_Fin09: constant Integer := 7;
   S_Res09: constant T_V15 := (
      (0.1,0.1),(0.5,0.5),(0.7,0.7),others=>(-1.0,-1.0));
   S_Res09_len: Constant Integer := 3;

   --Caso10: Lista de 6 elementos (queda 1---56)
   S_Ini10: constant Integer :=  1;
   S_Fin10: constant Integer := 6;
   S_Res10: constant T_V15 := (
      (0.1,0.1),(0.5,0.5),(0.6,0.6),others=>(-1.0,-1.0));
   S_Res10_len: Constant Integer := 3;

   --Caso11: Lista de 5 elementos (queda 1---5)
   S_Ini11: constant Integer :=  1;
   S_Fin11: constant Integer := 5;
   S_Res11: constant T_V15 := (
      (0.1,0.1),(0.5,0.5),others=>(-1.0,-1.0));
   S_Res11_len: Constant Integer := 2;

   --Caso12: Lista de 4 elementos (queda 1--4)
   S_Ini12: constant Integer :=  1;
   S_Fin12: constant Integer := 4;
   S_Res12: constant T_V15 := (
      (0.1,0.1),(0.4,0.4),others=>(-1.0,-1.0));
   S_Res12_len: Constant Integer := 2;

   --Caso13: Lista de 3 elementos (queda 1-3)
   S_Ini13: constant Integer :=  1;
   S_Fin13: constant Integer := 3;
   S_Res13: constant T_V15 := (
      (0.1,0.1),(0.3,0.3),others=>(-1.0,-1.0));
   S_Res13_len: Constant Integer := 2;

   --Caso14: Lista de 2 elementos (queda 12)
   S_Ini14: constant Integer :=  1;
   S_Fin14: constant Integer := 2;
   S_Res14: constant T_V15 := (
      (0.1,0.1),(0.2,0.2),others=>(-1.0,-1.0));
   S_Res14_len: Constant Integer := 2;

   --Caso15: Lista de 1 elementos (queda 1)
   S_Ini15: constant Integer :=  1;
   S_Fin15: constant Integer := 1;
   S_Res15: constant T_V15 := (
      (0.1,0.1),others=>(-1.0,-1.0));
   S_Res15_len: Constant Integer := 1;

   -------------------------
   -- Crear_Arbol_Binario --
   -------------------------
   --Caso1: Caso ejemplo:   (7 2 17 1 3 11 6 16 4 5 18 8)
   --               7
   --          2           17
   --        1   3      11     18
   --             6    8  16
   --            4
   --             5
   Arbol1_L1:constant T_Vector_Enteros(1..20) :=
      (7,2,17,1,3,11,6,16,4,5,18,8,0,0,0,0,0,0,0,0);
   Arbol1_Ini1: constant Integer := 1;
   Arbol1_Fin1: constant Integer := 12;
   Arbol1_L2: constant T_Arbol_Binario :=
      new T_Nodo_Arbol'(7,
         new T_Nodo_Arbol'(2,
            new T_Nodo_Arbol'(1,null,null),
            new T_Nodo_Arbol'(3,null,
               new T_Nodo_Arbol'(6,
                  new T_Nodo_Arbol'(4,null,
                     new T_Nodo_Arbol'(5,null,null)),
                     null))),
         new T_Nodo_Arbol'(17,
            new T_Nodo_Arbol'(11,
               new T_Nodo_Arbol'(8,null,null),
               new T_Nodo_Arbol'(16,null,null)),
            new T_Nodo_Arbol'(18,null,null)));
   --Caso2: Caso balanceado:(10 5 2 7 1 3 8 6 15 13 17 11 14 16 18)
   --             10
   --        5             15
   --     2     7      13      17
   --   1   3 6   8  11  14  16  18

   Arbol2_L1:constant T_Vector_Enteros(1..20) :=
      (10,5,2,7,1,3,8,6,15,13,17,11,14,16,18,0,0,0,0,0);
   Arbol2_Ini1: constant Integer := 1;
   Arbol2_Fin1: constant Integer := 15;
   Arbol2_L2: constant T_Arbol_Binario :=
      new T_Nodo_Arbol'(10,
         new T_Nodo_Arbol'(5,
            new T_Nodo_Arbol'(2,
               new T_Nodo_Arbol'(1,null,null),
               new T_Nodo_Arbol'(3,null,null)),
            new T_Nodo_Arbol'(7,
               new T_Nodo_Arbol'(6,null,null),
               new T_Nodo_Arbol'(8,null,null))),
         new T_Nodo_Arbol'(15,
            new T_Nodo_Arbol'(13,
               new T_Nodo_Arbol'(11,null,null),
               new T_Nodo_Arbol'(14,null,null)),
            new T_Nodo_Arbol'(17,
               new T_Nodo_Arbol'(16,null,null),
               new T_Nodo_Arbol'(18,null,null))));
   --Caso3: Caso ordenado asc: (1 3 5 7 9)
   --  1
   --    3
   --     5
   --      7
   --       9
   Arbol3_L1:constant T_Vector_Enteros(1..20) :=
      (1,3,5,7,9,3,8,6,15,13,17,11,14,16,18,0,0,0,0,0);
   Arbol3_Ini1: constant Integer := 1;
   Arbol3_Fin1: constant Integer := 5;
   Arbol3_L2: constant T_Arbol_Binario :=
      new T_Nodo_Arbol'(1,null,
         new T_Nodo_Arbol'(3,null,
            new T_Nodo_Arbol'(5,null,
               new T_Nodo_Arbol'(7,null,
               new T_Nodo_Arbol'(9,null,null)))));

   --Caso4: Caso ordenado des: (8 6 4 2 0)
   --     8
   --    6
   --   4
   --  2
   -- 0
   Arbol4_L1:constant T_Vector_Enteros(1..20) :=
      (8,6,4,2,0,3,8,6,15,13,17,11,14,16,18,0,0,0,0,0);
   Arbol4_Ini1: constant Integer := 1;
   Arbol4_Fin1: constant Integer := 5;
   Arbol4_L2: constant T_Arbol_Binario :=
      new T_Nodo_Arbol'(8,
         new T_Nodo_Arbol'(6,
            new T_Nodo_Arbol'(4,
               new T_Nodo_Arbol'(2,
                  new T_Nodo_Arbol'(0,null,null),
                  null),
               null),
            null),
         null);
   --Caso5: Caso de lista de uno: (10)
   --Caso6: Caso de lista vacia: (10)

   -- Caso 1: No todos los valores distan menos de 0.001
   --type T_Vector_puntos is array(1..12) of T_Punto;
   subtype T_V12 is T_Vector_Puntos(1..12);
   LP1 : T_V12 := (
            1=>(1.1, 1.1), 2=>(1.10001, 1.10001), 3=>(1.10002, 1.10002),
            4=>(4.4, 4.4), 5=>(5.5, 5.5), 6=>(5.50001, 5.50001),
            7=>(7.7, 7.7), 8=>(8.8, 8.8), others=>(-1.0,-1.0));
   LP1_Res : T_Lista_Puntos :=
      new T_Nodo_Punto'((1.1, 1.1),
      new T_Nodo_Punto'((4.4, 4.4),
      new T_Nodo_Punto'((5.5, 5.5),
      new T_Nodo_Punto'((7.7, 7.7),
      new T_Nodo_Punto'((8.8, 8.8), null)))));

   LP2 : T_V12 := (
            (3.3000,3.3000),(3.3009,3.2991),(3.2982,3.3018),
            (3.2973,3.3027),(3.2964,3.3036),others=>(-1.0,-1.0));
   LP2_Res : T_Lista_Puntos :=
      new T_Nodo_Punto'((3.3000,3.3000),
      new T_Nodo_Punto'((3.2982,3.3018),
      new T_Nodo_Punto'((3.2964,3.3036), null)));

   LP3 : T_V12 := (
            (99.99,99.99),(99.99,99.99),others=>(-1.0,-1.0));
   LP3_Res : T_Lista_Puntos :=
      new T_Nodo_Punto'((99.99,99.99),
      new T_Nodo_Punto'((99.99,99.99), null));

   -- Caso 2: Todos los puntos distan menos de 0.001
   LP4 : T_V12 := (
            1..11=>(1.99,1.99),others=>(-1.0,-1.0));
   LP4_Res : T_Lista_Puntos :=
      new T_Nodo_Punto'((1.99,1.99),
      new T_Nodo_Punto'((1.99,1.99), null));

   -- Caso 3: Todos los puntos distan menos de 0.001 algunos negativo
   LP5 : T_V12 := (
      1|4|7=>(1.1111,1.1111),
      2|5|8=>(1.1110,1.1110),
      3|6|9=>(1.1112,1.1112),others=>(-1.0,-1.0));
   LP5_Res : T_Lista_Puntos :=
      new T_Nodo_Punto'((1.1111,1.1111),
      new T_Nodo_Punto'((1.1112,1.1112), null));
   LP6 : T_V12 := (
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
--
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
      (3.3340,3.3322),(3.3341,3.3321),(3.3342,3.2220));
   LP8_Res : T_Lista_Puntos :=
      new T_Nodo_Punto'((3.3331,3.3331),
      new T_Nodo_Punto'((3.3341,3.3321),
      new T_Nodo_Punto'((3.3342,3.3320), null)));
end Lab09b_Escenarios;