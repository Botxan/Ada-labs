WITH Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Laboratorio07a;
USE Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Laboratorio07a;

PROCEDURE laboratorio07a_pruebas IS
   N: Integer;
   L1, L2: T_Lista_Estatica;
   C: T_Complejo_Tri;
   P: T_Complejo_Polar;
   M: T_Matriz(-3..1, -3..2);
   M2: T_Matriz(-1..1, -1..1);
   max,fil,col: Integer;
BEGIN
   Put_Line("*****Casos de pruebas para laboratorio07a (basico)*****");


   ----------
   -- esta --
   ----------
   new_line(3);
   Put("**esta**");
   new_line(2);

   L1.Dato:= (2,-3,5,0,5,9, others => Integer'First);
   L1.cont := 6;
   N:= 9;
   Put_Line("1.- Lista: (2,-3,5,0,5,9, ...). Cont: 6. N: 9. Resultado: TRUE");
   Put_Line(esta(L1, N)'img);

   new_line;

   L1.cont := 4;
   Put_Line("2.- Lista: (2,-3,5,0,5,9, ...). Cont: 4. N: 9. Resultado: FALSE");
   Put_Line(esta(L1, N)'img);

   new_line;

   L1.Dato := (1,2,3,4,5,6,7,8,9, others => Integer'First);
   L1.cont := 9;
   N:= 1;
   Put_Line("3.- Lista: (1,2,3,4,5,6,7,8,9...). Cont: 9. N: 1. Resultado: TRUE");
   Put_Line(esta(L1, N)'img);

   new_line;

   L1.cont := 1;
   Put_Line("4.- Lista (1,2,3,4,5,6,7,8,9...). Cont: 1. N: 1. Resultado: TRUE");
   Put_Line(esta(L1, N)'img);


   --------------
   -- posicion --
   --------------
   new_line(3);
   Put("**posicion**");
   new_line(2);

   L1.Dato:= (2,-3,5,0,5,9, others => Integer'First);
   L1.cont := 6;
   N:= 9;
   Put_Line("1.- Lista: (2,-3,5,0,5,9, ...). Cont: 6. Num 9. Resultado: posicion 6");
   put(posicion(L1, N));
   new_line;

   new_line;

   L1.cont := 4;
   Put_Line("2.- Lista: (2,-3,5,0,5,9, ...). Cont: 4. Num: 9. Resultado: posicion Integer'Last");
   Put(posicion(L1, N));
   new_line;

   new_line;

   L1.Dato := (1,2,3,4,5,6,7,8,9, others => Integer'First);
   L1.cont := 9;
   N:= 4;
   Put_Line("3.- Lista: (1,2,3,4,5,6,7,8,9...). Cont: 9. Num: 4. Resultado: posicion 4");
   Put(posicion(L1, N));
   new_line;

   new_line;

   L1.cont := 1;
   Put_Line("4.- Lista (1,2,3,4,5,6,7,8,9...). Cont: 1. Num: 4. Resultado: posicion Integer'Last");
   Put(posicion(L1, N));
   new_line;


   -----------
   -- Polar --
   -----------
   new_line(3);
   Put("**polar**");
   new_line(2);

   C:= (3.14, 2.99);
   Put_Line("1.- Numero en forma trigonometrica: (3.14, 2.99) -- Modulo: 4.34. Argumento: 0.76.");
   P:= Polar(C);
   Put("Modulo: "); Put(P.modulo, 1, 2, 0);
   new_line;
   Put("Argumento: "); Put(P.argumento, 1, 2, 0);

   new_line(2);

   C:= (36.72, 79.21);
   Put_Line("2.- Numero en forma trigonometrica: (36.72, 79.21) -- Modulo: 87.31. Argumento: 1.14.");
   P:= Polar(C);
   Put("Modulo: "); Put(P.modulo, 1, 2, 0);
   new_line;
   Put("Argumento: "); Put(P.argumento, 1, 2, 0);

   new_line(2);

   C:= (0.1, 0.1);
   Put_Line("3.- Numero en forma trigonometrica: (0.1,0.1) -- Modulo: 0.14. Argumento: 0.79.");
   P:= Polar(C);
   Put("Modulo: "); Put(P.modulo, 1, 2, 0);
   new_line;
   Put("Argumento: "); Put(P.argumento, 1, 2, 0);


   -----------------
   -- Son_Iguales --
   -----------------
   new_line(3);
   Put("**Son_Iguales**");
   new_line(2);

   L1.Dato := (1,3,5,7,9, others => Integer'First);
   L1.Cont := 5;
   L2.Dato := (1,3,5,7,9, others => Integer'First);
   L2.Cont := 5;
   Put_Line("Son iguales (1,3,5,7,9,...) y (1,3,5,7,9,...)? TRUE");
   Put(son_iguales(L1, L2)'img);

   new_line(2);

   L1.Dato := (1,2,3,4,5,6,7,8,9, others => Integer'First);
   L1.Cont := 9;
   L2.Dato := (1,2,3,4,5,6,7,8,0, others => Integer'First);
   L2.Cont := 9;
   Put_Line("Son iguales (1,2,3,4,5,6,7,8,9,...) y (1,2,3,4,5,6,7,8,0,...)? FALSE");
   Put(son_iguales(L1, L2)'img);

   new_line(2);

   L1.Dato := (0,2,3,4,5,6, others => Integer'First);
   L1.Cont := 5;
   L2.Dato := (1,2,3,4,5,6, others => Integer'First);
   L2.Cont := 5;
   Put_Line("Son iguales (0,2,3,4,5,6,...) y (1,2,3,4,5,6,...)? FALSE");
   Put(son_iguales(L1, L2)'img);


   -----------------------
   -- eliminar_elemento --
   -----------------------
   new_line(3);
   Put("**eliminar_elemento**");
   new_line(2);

   L1.Dato := (1,2,3,2,4,2,5,2,6,2, others => Integer'First);
   L1.Cont := 10;
   N:= 2;
   Put_Line("Borrar los valores = 2 de (1,2,3,2,4,2,5,2,6,2,...). Resultado: (1,Integer'First,3,Integer'First,4,Integer'First,5,Integer'First,6,Integer'First,...)");
   eliminar_elemento(N, L1);
   for i in 1..L1.Cont loop
      put(L1.Dato(L1.Dato'First+i-1));
   end loop;

   new_line(2);

   L1.Dato := (2,2,2,2,2, others => Integer'First);
   L1.Cont := 5;
   N:= 1;
   Put_Line("Borrar los valores = 1 de (2,2,2,2,2,...). Resultado: (2,2,2,2,2,...)");
   eliminar_elemento(N, L1);
   for i in 1..L1.Cont loop
      put(L1.Dato(L1.Dato'First+i-1));
   end loop;

   new_line(2);

   L1.Dato := (0,0,0,0,0,0, others => Integer'First);
   L1.Cont := 6;
   N:= 0;
   Put_Line("Borrar los valores = 0 de (0,0,0,0,0,0,...). Resultado: (Integer'First,Integer'First,Integer'First,Integer'First,Integer'First,Integer'First,...)");
   eliminar_elemento(N, L1);
   for i in 1..L1.Cont loop
      put(L1.Dato(L1.Dato'First+i-1));
   end loop;


   ------------------------------
   -- insertar_elemento_en_pos --
   ------------------------------
   new_line(3);
   Put("**insertar_elemento_en_pos**");
   new_line(2);

   L1.Dato := (1,3,4,5,6, others => Integer'First);
   L1.Cont := 5;
   Put_Line("Insertar el valor 2 en la posicion 2 de (1,3,4,5,6,Integer'First,...). Resultado correcto: (1,2,3,4,5,6,...)");
   insertar_elemento_en_pos(num=>2, pos=>2, L=>L1);
   for i in 1..L1.cont+1 loop
      put(L1.Dato(L1.Dato'First+i-1));
   end loop;

   new_line(2);

   L1.Dato := (0,0,0,0,0,0,0, others => Integer'First);
   L1.Cont := 7;
   Put_Line("Insertar el valor 5 en la posicion 32 de (0,0,0,0,0,0,0,Integer'First,...). Resultado correcto: (0,0,0,0,0,0,0,Integer'First,...)");
   insertar_elemento_en_pos(num=>5, pos=>32, L=>L1);
   for i in 1..L1.cont+1 loop
      put(L1.Dato(L1.Dato'First+i-1));
   end loop;

   new_line(2);

   L1.Dato := (6,7,8,9,10,11, others => Integer'First);
   L1.Cont := 6;
   Put_Line("Insertar el valor 5 en la posicion 1 de (6,7,8,9,10,11,Integer'First,...). Resultado correcto: (5,6,7,8,9,10,11,...)");
   insertar_elemento_en_pos(num=>5, pos=>1, L=>L1);
   for i in 1..L1.cont+1 loop
      put(L1.Dato(L1.Dato'First+i-1));
   end loop;


   ----------------
   -- Pos_Maximo --
   ----------------
   new_line(3);
   Put("**pos_maximo**");
   new_line(2);

   L1.Dato := (1,9,2,8,3,7,4,5,0, others => Integer'First);
   L1.Cont := 9;
   Put_Line("El indice del maximo valor del vector (1,9,2,8,3,7,4,5,0,...) es 2");
   Put(Pos_Maximo(L1));

   new_line(2);

   L1.Dato := (5,5,5,5, others => Integer'First);
   L1.Cont := 4;
   Put_Line("El indice del maximo valor del vector (5,5,5,5,...) es 1");
   Put(Pos_Maximo(L1));

   new_line(2);

   L1.Dato := (0,1,2,3,4,5,6,7,8,9,10, others => Integer'First);
   L1.Cont := 11;
   Put_Line("El indice del maximo valor del vector (0,1,2,3,4,5,6,7,8,9,10,...) es 11");
   Put(Pos_Maximo(L1));


   ---------------------
   -- Ordenar_Burbuja --
   ---------------------
   new_line(3);
   Put("**pos_maximo**");
   new_line(2);

   L1.Dato := (1,6,2,5,3,4, others => Integer'First);
   L1.Cont := 6;
   Put_Line("Vector (1,6,2,5,3,4,...) ordenado descendentemente: (6,5,4,3,2,1...)");
   ordenar_burbuja(L1);
   for i in L1.Dato'First..L1.Dato'First+L1.cont-1 loop
      put(L1.dato(i));
   end loop;

   new_line(2);

   L1.Dato := (0,0,0,0,0,0,0,1, others => Integer'First);
   L1.Cont := 8;
   Put_Line("Vector (0,0,0,0,0,0,0,1,...) ordenado descendentemente: (1,0,0,0,0,0,0,0...)");
   ordenar_burbuja(L1);
   for i in L1.Dato'First..L1.Dato'First+L1.cont-1 loop
      put(L1.dato(i));
   end loop;

   L1.Dato := (10,-10,20,-20,30,-30,40,-40, others => Integer'First);
   L1.Cont := 8;
   Put_Line("Vector (10,-10,20,-20,30,-30,40,-40,...) ordenado descendentemente: (40,30,20,10,-10,-20,-30,-40...)");
   ordenar_burbuja(L1);
   for i in L1.Dato'First..L1.Dato'First+L1.cont-1 loop
      put(L1.dato(i));
   end loop;


   --------------
   -- Posicion --
   --------------
   new_line(3);
   Put("**posicion**");
   new_line(2);

   M := ((1,2,3,4,5,6), (2,3,4,5,6,7), (3,4,5,6,7,8), (4,5,6,7,8,9), (5,6,7,8,9,10));
   N:= 8;
   Put_Line("Numero 8 en la matriz: ");
   new_line;
   Put_Line("1,2,3,4,5,6");
   Put_Line("2,3,4,5,6,7");
   Put_Line("3,4,5,6,7,8");
   Put_Line("4,5,6,7,8,9");
   Put_Line("5,6,7,8,9,10");
   new_line;
   Put_Line("Fila: 3, Columna: 6");
   posicion(M, N, Fil, Col);
   Put_Line(Fil'img & " " & Col'img);

   new_line(2);

   M := ((0,0,0,0,0,0), (0,0,0,0,0,0), (0,0,0,0,0,0), (0,0,0,0,0,0), (0,0,0,0,0,0));
   N:= 2;
   Put_Line("Numero 2 en la matriz: ");
   new_line;
   Put_Line("0,0,0,0,0,0");
   Put_Line("0,0,0,0,0,0");
   Put_Line("0,0,0,0,0,0");
   Put_Line("0,0,0,0,0,0");
   Put_Line("0,0,0,0,0,0");
   new_line;
   Put_Line("Fila: 0, Columna: 0");
   posicion(M, N, Fil, Col);
   Put_Line(Fil'img & " " & Col'img);

   new_line(2);

   M := ((1,1,1,1,1,1), (2,2,2,2,2,2), (3,3,3,3,3,3), (4,4,4,4,4,4), (5,5,5,5,5,9));
   N:= 9;
   Put_Line("Numero 9 en la matriz: ");
   new_line;
   Put_Line("1,1,1,1,1,1");
   Put_Line("2,2,2,2,2,2");
   Put_Line("3,3,3,3,3,3");
   Put_Line("4,4,4,4,4,4");
   Put_Line("5,5,5,5,5,9");
   new_line;
   Put_Line("Fila: 5, Columna: 6");
   posicion(M, N, Fil, Col);
   Put_Line(Fil'img & ", " & Col'img);

   ------------
   -- Maximo --
   ------------

   M2 := ((Integer'First, Integer'First, Integer'First), (Integer'First, Integer'First, Integer'First), (Integer'First, Integer'First, Integer'First));
   Put_Line("Maximo en la matriz:");
   Put_Line("Integer'First, Integer'First, Integer'First");
   Put_Line("Integer'First, Integer'First, Integer'First");
   Put_Line("Integer'First, Integer'First, Integer'First");
   Put_Line("Maximo: Integer'First. Fila: 1. Columna: 1");
   maximo(M2, Max, Fil, Col);
   Put_Line(Max'img & ", " & Fil'img & ", " & Col'img);

   new_line(2);

   M2 := ((1,2,3), (4,5,6), (7,8,9));
   Put_Line("Maximo en la matriz:");
   Put_Line("1,2,3");
   Put_Line("4,5,6");
   Put_Line("7,8,9");
   Put_Line("Maximo: 9. Fila: 3. Columna: 3");
   maximo(M2, Max, Fil, Col);
   Put_Line(Max'img & ", " & Fil'img & ", " & Col'img);

   new_line(2);

   M2 := ((9,8,7), (6,5,4), (3,2,9));
   Put_Line("Maximo en la matriz:");
   Put_Line("9,8,7");
   Put_Line("6,5,4");
   Put_Line("3,2,9");
   Put_Line("Maximo: 9. Fila: 1. Columna: 1");
   maximo(M2, Max, Fil, Col);
   Put_Line(Max'img & ", " & Fil'img & ", " & Col'img);



END laboratorio07a_pruebas;