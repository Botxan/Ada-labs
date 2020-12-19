WITH Ada.Text_IO, Ada.Integer_Text_IO, Laboratorio06b;
USE Ada.Text_IO, Ada.Integer_Text_IO, Laboratorio06b;

procedure laboratorio06b_pruebas IS
   Sexagesimales: T_Grados_Sex;
   Centesimales: Float;
   V: T_Vector_Enteros(1..10);
   Texto: T_Info_Texto;
   palabras: t_palabras(1..Max_Palabras);
   Matriz: T_Matriz(1..4, 1..4);
   Matriz2: T_Matriz(1..5, 1..4);

   -- Tomas stuff
   array_tomas: T_Vector_Enteros(11..20) := (VACIO,0,0,0,0,0,0,0,0,0);
   ordenar_tomas: T_Vector_Enteros(-5..4);
   tomatriz: T_Matriz(-2..2, -2..1);
BEGIN

   ----------------
   -- Cent_A_Sex --
   ----------------
   Centesimales:= 100.0;
   Put_Line("100 grados centesimales son 100 grados, 0 minutos y 0 segundos sexagesimales");
   Cent_A_Sex(Centesimales, Sexagesimales);
   Put_Line(Sexagesimales.Grados'img & " grados, " & Sexagesimales.Minutos'img & " minutos y " & Sexagesimales.segundos'img & " segundos.");

   new_line;

   Centesimales:= 30.94;
   Put_Line("30.94 grados centesimales son 30 grados, 56 minutos y 24 grados");
   Cent_A_Sex(Centesimales, Sexagesimales);
   Put_Line(Sexagesimales.Grados'img & " grados, " & Sexagesimales.Minutos'img & " minutos y " & Sexagesimales.segundos'img & " segundos.");

   new_line;

   Centesimales:= 372.99;
   Put_Line("372.99 grados centesimales son 372 grados, 59 minutos y 24 grados");
   Cent_A_Sex(Centesimales, Sexagesimales);
   Put_Line(Sexagesimales.Grados'img & " grados, " & Sexagesimales.Minutos'img & " minutos y " & Sexagesimales.segundos'img & " segundos.");

   -------------------
   -- Rotar_Derecha --
   -------------------
   new_line(3);

   V:= (1,2,3,4,5,6,7,8,9,10);
   Put_Line("El vector (1,2,3,4,5,6,7,8,9,10) rotado 1 posicion a la derecha es (10,1,2,3,4,5,6,7,8,9)");
   Rotar_Derecha(V);
   for i in V'range loop
      put(V(i));
   end loop;

   new_line(2);

   V:= (2,2,3,3,3,4,4,4,5,2);
   Put_Line("El vector (2,2,3,3,3,4,4,4,5,2) rotado 1 posicion a la derecha es (2,2,2,3,3,3,4,4,4,5)");
   Rotar_Derecha(V);
   for i in V'range loop
      put(V(i));
   end loop;

   new_line(2);

   V:= (0,0,0,0,0,0,0,0,0,1);
   Put_Line("El vector (0,0,0,0,0,0,0,0,0,1) rotado 1 posicion a la derecha es (1,0,0,0,0,0,0,0,0,0)");
   Rotar_Derecha(V);
   for i in V'range loop
      put(V(i));
   end loop;

   -----------------------------
   -- esta_en_vector_ordenado --
   -----------------------------
   new_line(3);

   V:= (1,2,3,4,5,6,7,8,9,10);
   Put_Line("Esta el numero 5 en el vector ordenado(1,2,3,4,5,6,7,8,9,10)? TRUE");
   Put_Line(esta_en_vector_ordenado(V, 5)'img);

   new_line;

   V:= (1,1,2,2,3,3,4,4,5,5);
   Put_Line("Esta el numero 9 en el vector ordenado(1,1,2,2,3,3,4,4,5,5)? FALSE");
   Put_Line(esta_en_vector_ordenado(V, 9)'img);

   new_line;

   V:= (0,0,0,0,0,0,0,0,0,6);
   Put_Line("Esta el numero 6 en el vector ordenado(0,0,0,0,0,0,0,0,0,6)? TRUE");
   Put_Line(esta_en_vector_ordenado(V, 6)'img);

   --------------------------------
   -- eliminar_elemento_ordenado --
   --------------------------------
   new_line(3);

   V:= (1,2,3,4,5,6,7,8,9,VACIO);
   Put_Line("El vector (1,2,3,4,5,6,7,8,9,VACIO) despues de borrar el elemento en la posicion 3: (1,2,4,5,6,7,8,9,VACIO,VACIO)");
   eliminar_elemento_ordenado(3, V);
   for i in V'range loop
      put(V(i));
   end loop;

   new_line(2);

   V:= (0,0,0,0,0,0,0,0,1,VACIO);
   Put_Line("El vector (0,0,0,0,0,0,0,0,1,VACIO) despues de borrar el elemento en la posicion 9: (0,0,0,0,0,0,0,0,VACIO,VACIO)");
   eliminar_elemento_ordenado(9, V);
   for i in V'range loop
      put(V(i));
   end loop;

   new_line(2);

   V:= (1,1,2,2,3,3,4,4,5,VACIO);
   Put_Line("El vector (1,1,2,2,3,3,4,4,5,VACIO) despues de borrar el elemento en la posicion 9: (1,1,2,2,3,3,4,4,VACIO,VACIO)");
   eliminar_elemento_ordenado(9, V);
   for i in V'range loop
      put(V(i));
   end loop;

   new_line(2);

   V:= (1,3,5,7,9,11,13,15,17,VACIO);
   Put_Line("El vector (1,3,5,7,9,11,13,15,17,VACIO) despues de borrar el elemento en la posicion 32: (1,3,5,7,9,11,13,15,17,VACIO)");
   eliminar_elemento_ordenado(32, V);
   for i in V'range loop
      put(V(i));
   end loop;

   --------------------------------
   -- insertar_elemento_ordenado --
   --------------------------------
   new_line(3);

   V:=(1,3,4,5,6,7,8,9,VACIO,0);
   new_line(3);
   Put_Line("El vector (1,3,4,5,6,7,8,9,VACIO,0) despues de insertar el numero 2: (1,2,3,4,5,6,7,8,9,VACIO)");
   insertar_elemento_ordenado(2,V);
   for i in V'range loop
      put(V(i));
   end loop;

   new_line;

   V:=(1,1,2,2,3,3,4,4,VACIO,5);
   new_line(3);
   Put_Line("El vector (1,1,2,2,3,3,4,4,VACIO,0) despues de insertar el numero 5: (1,1,2,2,3,3,4,4,5,VACIO)");
   insertar_elemento_ordenado(5,V);
   for i in V'range loop
      put(V(i));
   end loop;

   new_line;

   V:=(2,4,6,8,12,14,16,18,VACIO,0);
   new_line(3);
   Put_Line("El vector (2,4,6,8,12,14,16,18,VACIO,0) despues de insertar el numero 10: (2,4,6,8,10,12,14,16,18,VACIO)");
   insertar_elemento_ordenado(10,V);
   for i in V'range loop
      put(V(i));
   end loop;

   new_line;

   V:=(1,2,3,4,5,6,7,8,VACIO,0);
   new_line(3);
   Put_Line("El vector (1,2,3,4,5,6,7,8,VACIO,0) despues de insertar el numero 9: (1,2,3,4,5,6,7,8,9,VACIO)");
   insertar_elemento_ordenado(9,V);
   for i in V'range loop
      put(V(i));
   end loop;

   new_line;

   V:=(1,2,3,4,5,6,7,8,VACIO,0);
   new_line(3);
   Put_Line("El vector (1,2,3,4,5,6,7,8,VACIO,0) despues de insertar el numero 0: (0,1,2,3,4,5,6,7,8,VACIO)");
   insertar_elemento_ordenado(0,V);
   for i in V'range loop
      put(V(i));
   end loop;

   new_line;

   new_line(3);
   Put_Line("array_tomas(11..20) (VACIO,0,0,0,0,0,0,0,0,0) insertar 1: (1,VACIO,0,0,0,0,0,0,0,0,1)");
   insertar_elemento_ordenado(1,array_tomas);
   for i in array_tomas'range loop
      put(array_tomas(i));
   end loop;


   ------------------------
   -- Eliminar_Repetidos --
   ------------------------
   new_line(3);

   V:= (1,1,2,2,3,3,4,4,5,5);
   Put_Line("(1,1,2,2,3,3,4,4,5,5) despues de eliminar los valores repetidos mas lejanos al principio: (1,2,3,4,5,VACIO,VACIO,VACIO,VACIO,VACIO)");
   Eliminar_Repetidos(V);
   for i in V'range loop
      put(V(i));
   end loop;

   new_line(2);

   V:= (1,2,3,4,5,5,4,3,2,1);
   Put_Line("(1,2,3,4,5,5,4,3,2,1) despues de eliminar los valores repetidos mas lejanos al principio: (1,2,3,4,5,VACIO,VACIO,VACIO,VACIO,VACIO)");
   Eliminar_Repetidos(V);
   for i in V'range loop
      put(V(i));
   end loop;

   new_line(2);

   V:= (0,0,0,0,0,0,0,0,0,0);
   Put_Line("(0,0,0,0,0,0,0,0,0,0) despues de eliminar los valores repetidos mas lejanos al principio: (0,VACIO,VACIO,VACIO,VACIO,VACIO,VACIO,VACIO,VACIO,VACIO)");
   Eliminar_Repetidos(V);
   for i in V'range loop
      put(V(i));
   end loop;

   new_line(2);

   V:= (1,2,3,4,5,6,7,8,9,10);
   Put_Line("(1,2,3,4,5,6,7,8,9,10) despues de eliminar los valores repetidos mas lejanos al principio: (1,2,3,4,5,6,7,8,9,10)");
   Eliminar_Repetidos(V);
   for i in V'range loop
      put(V(i));
   end loop;

   ------------------------
   -- Letra_Mas_Repetida --
   ------------------------
   new_line(3);

   palabras:= (
      (4, "Hola                          "),
      (2, "Me                            "),
      (5, "llamo                         "),
      (8, "Sandalio                      "),
      others => (0, "                              ")
   );
   Texto:= (
            Cuantas => 4,
            Palabras => t_palabras(palabras)
   );
   Put_Line("La letra mas repetida en ""Hola me llamo Sandalio"" es A");
   put(Letra_Mas_Repetida(Texto));

   new_line(2);

   palabras:= (
      (4, "¿Cuantos                      "),
      (2, "Cuentos                       "),
      (5, "Cuentas                       "),
      (8, "Tu?                           "),
      others => (0, "                              ")
   );
   Texto:= (
            Cuantas => 4,
            Palabras => t_palabras(palabras)
   );
   Put_line("La letra mas repetida en ""¿Cuantos cuentos cuentas tu?"" es T");
   put(Letra_Mas_Repetida(Texto));

   -----------------------
   -- Ordenar_Insercion --
   -----------------------
   new_line(3);

   ordenar_tomas:= (0,0,0,0,0,0,0,0,0,0);
   Put_Line("El vector (0,0,0,0,0,0,0,0,0,0) ordenado: (0,0,0,0,0,0,0,0,0,0)");
   Ordenar_Insercion(ordenar_tomas);
   for i in ordenar_tomas'range loop
      put(ordenar_tomas(i));
   end loop;

   new_line(2);

   V:=(5,1,7,2,9,8,3,5,9,6);
   Put_Line("El vector (5,1,7,2,9,8,3,5,9,6) ordenado: (1,2,3,5,5,6,7,8,9,9)");
   Ordenar_Insercion(V);
   for i in V'range loop
      put(V(i));
   end loop;

   new_line(2);

   V:=(18,16,14,12,10,8,6,4,2,0);
   Put_Line("El vector (18,16,14,12,10,8,6,4,2,0) ordenado: (0,2,4,6,8,10,12,14,16,18)");
   Ordenar_Insercion(V);
   for i in V'range loop
      put(V(i));
   end loop;

   new_line(2);

   V:=(0,1,0,1,0,1,0,1,0,1);
   Put_Line("El vector (0,1,0,1,0,1,0,1,0,1) ordenado: (0,0,0,0,0,1,1,1,1,1)");
   Ordenar_Insercion(V);
   for i in V'range loop
      put(V(i));
   end loop;

   new_line(2);

   V:=(11,12,13,14,15,16,17,18,19,20);
   Put_Line("El vector (11,12,13,14,15,16,17,18,19,20) ordenado: (11,12,13,14,15,16,17,18,19,20)");
   Ordenar_Insercion(V);
   for i in V'range loop
      put(V(i));
   end loop;

   -----------------
   -- Es_Toeplitz --
   -----------------
   new_line(3);

   Tomatriz := ((0,0,0,0),
                (0,0,0,0),
                (0,0,0,0),
                (0,0,0,0),
                (0,0,0,0));
   Put_Line("Es la tomatriz");
   Put_Line("0 0 0 0");
   Put_Line("0 0 0 0");
   Put_Line("0 0 0 0");
   Put_Line("0 0 0 0");
   Put_Line("0 0 0 0");
   Put_Line("una matriz Toepliz? FALSE");
   put(Es_Toeplitz(Tomatriz)'img);

   new_line(2);

   Matriz := ((1,4,2,3),
              (5,1,4,2),
              (9,5,1,4),
              (3,9,5,1));
   Put_Line("Es la matriz (1,4,2,3), (5,1,4,2), (9,5,1,4), (3,9,5,1) Toeplitz? TRUE");
   put(Es_Toeplitz(Matriz)'img);

   new_line(2);

   Matriz := ((0,1,2,3),
              (1,0,1,2),
              (2,1,0,1),
              (3,2,1,0));
   Put_Line("Es la matriz (0,1,2,3), (5,0,1,2), (3,5,0,1) Toeplitz? TRUE");
   put(Es_Toeplitz(Matriz)'img);

   new_line(2);

   Matriz := ((1,2,3,4),
              (5,6,7,8),
              (9,10,11,12),
              (13,14,16,16));
   Put_Line("Es la matriz (0,1,2,3), (5,0,1,2), (3,5,8,1) Toeplitz? FALSE");
   put(Es_Toeplitz(Matriz)'img);

   new_line(2);

   Matriz := ((1,0,1,0),
              (0,1,0,1),
              (1,0,1,0),
              (0,1,1,1));
   Put_Line("Es la matriz (1,0,1,0), (0,1,0,1), (1,1,1,0) Toeplitz? FALSE");
   put(Es_Toeplitz(Matriz)'img);

   new_line(2);

   Matriz2 := ((0,0,0,0),
              (0,0,0,0),
              (0,0,0,0),
              (0,0,0,0),
              (0,0,0,0));
   Put_Line("Es la matriz");
   Put_Line("0,0,0,0");
   Put_Line("0,0,0,0");
   Put_Line("0,0,0,0");
   Put_Line("0,0,0,0");
   Put_Line("0,0,0,0");
   Put_Line("una matriz Toepliz? FALSE");
   put(Es_Toeplitz(Matriz2)'img);

END laboratorio06b_pruebas;