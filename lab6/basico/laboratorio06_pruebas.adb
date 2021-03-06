WITH Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Laboratorio06a;
USE Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Laboratorio06a;

PROCEDURE laboratorio06_pruebas IS
   V: T_vector_enteros(1..10);
   L1, L2: t_vector_enteros(1..10);
   f1, f2: T_fecha;
   grados: T_Grados_Sex;
   pos: Positive;
   num: Integer;
BEGIN

   --------------------
   -- esta_en_vector --
   --------------------

   V := (1,2,3,4,5,6,7,8,9,0);
   Put_line("Esta 4 en el vector (1,2,3,4,5,6,7,8,9,0)? TRUE");
   Put_line(esta_en_vector(V, 4)'img);

   new_line;

   V := (0,0,0,0,0,0,0,0,0,0);
   Put_line("Esta 8 en el vector (0,0,0,0,0,0,0,0,0,0)? FALSE");
   Put_line(esta_en_vector(V, 8)'img);

   new_line;

   V := (3,0,0,0,0,0,0,0,0,0);
   Put_line("Esta 3 en el vector (3,0,0,0,0,0,0,0,0,0)? TRUE");
   Put_line(esta_en_vector(V, 3)'img);

   new_line;

   V := (0,0,0,0,0,0,0,0,0,-8);
   Put_line("Esta -8 en el vector (0,0,0,0,0,0,0,0,0,-8)? TRUE");
   Put_line(esta_en_vector(V, -8)'img);

   new_line;

   V := (1,3,5,7,9,13,15,17,19,21);
   Put_line("Esta 0 en el vector (1,3,5,7,9,13,15,17,19,21)? FALSE");
   Put_line(esta_en_vector(V, 0)'img);


   --------------
   -- posicion --
   --------------
   new_line(3);

   V:= (0,9,8,7,6,5,4,3,2,1);
   Put_line("El numero 3 esta en la posicion 8");
   Put_line(posicion(V, 3)'img);

   new_line;

   V:= (5,5,5,5,5,5,5,5,5,5);
   Put_line("El numero 5 esta en la posicion 1");
   Put_line(posicion(V, 5)'img);

   new_line;

   V:= (1,3,5,7,9,11,13,15,17,19);
   Put_line("El numero 6 no esta. Se devuelve Integer'Last");
   Put_line(posicion(V, 6)'img);

   new_line;

   V:= (0,0,0,0,0,0,0,0,0,1);
   Put_line("El numero 1 esta en la posicion 10");
   Put_line(posicion(V, 1)'img);

   -----------------
   -- Son_Iguales --
   -----------------
   new_line(3);

   f1 := (12, Abril, 2019);
   f2 := (12, Abril, 2019);
   Put_Line("Son la misma fecha (12, Abril, 2019) y (12, Abril, 2019)? True");
   Put_Line(Son_Iguales(f1, f2)'img);

   new_line;

   f1 := (1, Enero, 2022);
   f2 := (31, Enero, 2022);
   Put_Line("Son la misma fecha (1, Enero, 2022) y (31, Enero, 2022)? False");
   Put_Line(Son_Iguales(f1, f2)'img);

   new_line;

   f1 := (31, Diciembre, 2020);
   f2 := (31, Octubre, 2020);
   Put_Line("Son la misma fecha (31, Octubre, 2020) y (31, Octubre, 2020)? False");
   Put_Line(Son_Iguales(f1, f2)'img);

   ------------------
   -- Centesimales --
   ------------------
   new_line(3);

   grados:= (90, 0, 0);
   Put_Line("(90, 0, 0) en centesimal son 100");
   put(centesimales(grados), 1, 2, 0);

   new_line(2);
   grados:= (0, 0, 0);
   Put_Line("(0, 0, 0) en centesimal son 0");
   put(centesimales(grados), 1, 2, 0);

   new_line(2);
   grados:= (354, 34, 2);
   Put_Line("(354, 34, 2) en centesimal son 356,56");
   put(centesimales(grados), 1, 2, 0);

   new_line(2);
   grados:= (359, 59, 59);
   Put_Line("(259, 59, 59) en centesimal son 399.89");
   put(centesimales(grados), 1, 2, 0);
   new_line;

   -----------------
   -- Son_Iguales --
   -----------------
   new_line(3);

   L1:= (2,5,1,5,VACIO,3,1,4,8,5);
   L2:= (2,5,1,5,3,1,4,8,VACIO,7);
   Put_Line("Son Iguales (2,5,1,5,-1,3,1,4,8,5) y (2,5,1,5,3,1,4,8,-1,7) FALSE");
   put(son_iguales(L1, L2)'img);

   new_line(2);
   L1:= (0,0,0,0,0,VACIO,0,0,0,0);
   L2:= (0,0,0,0,0,VACIO,0,0,0,0);
   Put_Line("Son Iguales (0,0,0,0,0,-1,0,0,0,0) y (0,0,0,0,0,-1,0,0,0,0) TRUE");
   put(son_iguales(L1, L2)'img);

   new_line(2);
   L1:= (7,0,0,0,0,0,0,0,0,VACIO);
   L2:= (9,0,0,0,0,0,0,0,0,VACIO);
   Put_Line("Son Iguales (7,0,0,0,0,0,0,0,0,-1) y (9,0,0,0,0,0,0,0,0,-1) FALSE");
   put(son_iguales(L1, L2)'img);

   new_line(2);
   L1:= (VACIO,0,0,0,0,0,0,0,0,0);
   L2:= (VACIO,0,0,0,0,0,0,0,0,0);
   Put_Line("Son Iguales (-1,0,0,0,0,0,0,0,0,0) y (-1,0,0,0,0,0,0,0,0,0) TRUE");
   put(son_iguales(L1, L2)'img);

   -----------------------
   -- eliminar_elemento --
   -----------------------
   new_line(3);

   V:= (VACIO,2,5,6,7,2,3,4,2,6);
   pos:= 1;
   Put_Line("Despues de borrar el elemento 1 de (VACIO,2,5,6,7,2,3,4,2,6)");
   eliminar_elemento(pos, V);
   for i in V'range loop
      put(V(i));
   end loop;

   new_line;
   V:= (9,2,5,6,7,2,3,4,2,6);
   pos:= 8;
   Put_Line("Despues de borrar el elemento 8 de (9,2,5,6,7,2,3,4,2,6)");
   eliminar_elemento(pos, V);
   for i in V'range loop
      put(V(i));
   end loop;

   new_line;
   V:= (0,0,0,0,0,0,0,0,0,0);
   pos:= 10;
   Put_Line("Despues de borrar el elemento 10 de (0,0,0,0,0,0,0,0,0,0)");
   eliminar_elemento(pos, V);
   for i in V'range loop
      put(V(i));
   end loop;

   ------------------------------
   -- insertar_elemento_en_pos --
   ------------------------------
   new_line(3);

   V:=(1,2,3,4,5,6,7,8,9,VACIO);
   pos:=5;
   num:=45;
   Put_Line("Vector(1,2,3,4,5,6,7,8,9,VACIO). Posicion 5, numero 45. Resultado: (1,2,3,4,45,5,6,7,8,9)");
   insertar_elemento_en_pos(num, pos, V);
   for i in V'range loop
      put(V(i));
   end loop;

   new_line(2);
   V:=(0,0,0,0,7,0,0,0,1,VACIO);
   pos:=1;
   num:=1;
   Put_Line("Vector(0,0,0,0,7,0,0,0,1,VACIO). Posicion 1, numero 1. Resultado: (1,0,0,0,0,7,0,0,0,1)");
   insertar_elemento_en_pos(num, pos, V);
   for i in V'range loop
      put(V(i));
   end loop;

   new_line(2);
   V:=(1,3,4,5,6,7,8,9,10,VACIO);
   pos:=2;
   num:=2;
   Put_Line("Vector(1,3,4,5,6,7,8,9,10,VACIO). Posicion 2, numero 2. Resultado: (1,2,3,4,5,6,7,8,9,10)");
   insertar_elemento_en_pos(num, pos, V);
   for i in V'range loop
      put(V(i));
   end loop;

   ----------------
   -- Pos_Maximo --
   ----------------
   new_line(3);

   V:=(1,2,3,4,5,6,7,8,9,10);
   Put_Line("La posicion del numero mas grande de (1,2,3,4,5,6,7,8,9,10) es 10");
   put(pos_maximo(V));

   new_line;

   V:=(2,5,2,5,2,9,2,5,2,5);
   Put_Line("La posicion del numero mas grande de (2,5,2,5,2,9,2,5,2,5) es 6");
   put(pos_maximo(V));

   new_line;

   V:=(1,0,0,0,0,0,0,0,0,0);
   Put_Line("La posicion del numero mas grande de (1,0,0,0,0,0,0,0,0,0) es 1");
   put(pos_maximo(V));

   new_line;

   V:=(-5,-5,-5,-5,-5,-5,-5,-5,-5,0);
   Put_Line("La posicion del numero mas grande de (-5,-5,-5,-5,-5,-5,-5,-5,-5,0) es 10");
   put(pos_maximo(V));

   -----------------------
   -- Ordenar_Seleccion --
   -----------------------
   new_line(3);

   V:=(2,5,3,1,7,9,4,6,8,2);
   Put_Line("El vector (2,5,3,1,7,9,4,6,8,2) ordenado es (9,8,7,6,5,4,3,2,2,1)");
   Ordenar_Seleccion(V);
   for i in V'range loop
      put(V(i));
   end loop;

   V:=(1,0,1,0,1,0,1,0,1,0);
   Put_Line("El vector (1,0,1,0,1,0,1,0,1,0) ordenado es (1,1,1,1,1,0,0,0,0,0)");
   Ordenar_Seleccion(V);
   for i in V'range loop
      put(V(i));
   end loop;

   V:=(1,2,3,4,5,6,7,8,9,10);
   Put_Line("El vector (1,2,3,4,5,6,7,8,9,10) ordenado es (10,9,8,7,6,5,4,3,2,1)");
   Ordenar_Seleccion(V);
   for i in V'range loop
      put(V(i));
   end loop;

END laboratorio06_pruebas;