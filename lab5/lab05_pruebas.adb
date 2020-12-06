with Laboratorio05, Ada.Text_IO, Ada.Integer_Text_IO;
use Laboratorio05, Ada.Text_IO, Ada.Integer_Text_IO;
procedure Lab05_Pruebas is
   V: T_VEctor10;
   par,posicion : Natural;
   num: Positive;
   impares: Natural;
   Sin_Cifrar, Cifrado: String(1..10);
begin
   -- Aportación anónima de un alumno generoso

   ----------------
   -- Ultimo_Par --
   ----------------

   Put_Line("Ultimo par de (1 3 5 7 9 11 13 15 17 19) es 0 pos 0");
   V:=(1,3,5,7,9,11,13,15,17,19);
   Ultimo_Par(V, Par, Posicion);
   Put(Par); Put(posicion); New_Line;

   Put_Line("Ultimo par de (8 4 6 7 5 3 2 1 1 9) es 2 pos 7");
   V:=(8,4,6,7,5,3,2,1,1,9);
   Ultimo_Par(V, Par, Posicion);
   Put(Par); Put(posicion); New_Line;

   Put_Line("Ultimo par de (0 2 4 6 8 8 6 2 0) es 0 pos 10");
   V:=(0,2,4,6,8,8,6,4,2,0);
   Ultimo_Par(V, Par, Posicion);
   Put(Par); Put(posicion); New_Line;

   Put_Line("Ultimo par de (23 534 29 0 329 3267 3985 982 238 999) es 238 pos 9");
   V:=(23,534,29,0,329,3267,3985,982,238,999);
   Ultimo_Par(V, Par, Posicion);
   Put(Par); Put(posicion); New_Line;


   --------------------------
   -- multiplos_del_ultimo --
   --------------------------

   new_line(3);

   V:=(2,5,25,9,35,60,29,-55,0,5);
   Put_Line("(2, 5, 25, 9, 35, 60, 29, -55, 0, 5) contiene 7 multiplos de 5");
   Put(multiplos_del_ultimo(V));

   new_line;
   V:=(0,0,0,0,0,0,0,0,0,7);
   Put_Line("(0, 0, 0, 0, 0, 0, 0, 0, 0, 7) contiene 10 multiplos de 7");
   Put(multiplos_del_ultimo(V));

   new_line;
   V:=(0,0,0,0,0,0,0,0,0,0);
   Put_Line("(0, 0, 0, 0, 0, 0, 0, 0, 0, 0) contiene 10 multiplos de 0");
   Put(multiplos_del_ultimo(V));

   new_line;
   V:=(8,7,0,0,0,6,0,0,0,0);
   Put_Line("(8, 7, 0, 0, 6, 0, 0, 0, 0, 0) contiene 7 multiplos de 0");
   Put(multiplos_del_ultimo(V));


   -------------------
   -- esta_ordenado --
   -------------------

   new_line(3);

   V:=(1,2,3,4,5,6,7,8,9,0);
   Put_Line("Es ordenado el vector (1,2,3,4,5,6,7,8,9,0)?");
   Put_Line(esta_ordenado(V)'img);

   new_line;
   V:=(1,2,2,2,3,3,3,4,5,3);
   Put_Line("Es ordenado el vector (1,2,2,2,3,3,3,4,5,3)?");
   Put_Line(esta_ordenado(V)'img);

   new_line;
   V:=(1,2,3,2,3,2,3,2,3,2);
   Put_Line("Es ordenado el vector (1,2,3,2,3,2,3,2,3,2)?");
   Put_Line(esta_ordenado(V)'img);

   new_line;
   V:=(0,9,8,7,6,5,4,3,2,1);
   Put_Line("Es ordenado el vector (0,9,8,7,6,5,4,3,2,1)?");
   Put_Line(esta_ordenado(V)'img);

   new_line;
   V:=(-1,3,5,7,9,15,25,35,35,35);
   Put_Line("Es ordenado el vector (-1,3,5,7,9,15,25,35,35,35)?");
   Put_Line(esta_ordenado(V)'img);

   new_line;
   V:=(9,8,8,8,8,8,8,8,8,8);
   Put_Line("Es ordenado el vector (9,8,8,8,8,8,8,8,8,8)?");
   Put_Line(esta_ordenado(V)'img);

   new_line;
   V:=(1,1,2,2,3,3,4,4,4,4);
   Put_Line("Es ordenado el vector (1,1,2,2,3,3,4,4,4,4)?");
   Put_Line(esta_ordenado(V)'img);

   new_line;
   V:=(0,0,0,0,0,0,0,0,0,0);
   Put_Line("Es ordenado el vector (0,0,0,0,0,0,0,0,0,0)?");
   Put_Line(esta_ordenado(V)'img);

   ---------------------
   -- Separar_digitos --
   ---------------------

   new_line(3);

   num:= 908345;
   separar_digitos(num, V, impares);
   Put_Line("Vector del numero 908345");
   for i in 1..10 loop
      put(V(i), 2);
   end loop;
   new_line;
   Put_Line("Total de numeros impares: " & impares'img);

   new_line;
   num:= 1;
   separar_digitos(num, V, impares);
   Put_Line("Vector del numero 1");
   for i in 1..10 loop
      put(V(i), 2);
   end loop;
   new_line;
   Put_Line("Total de numeros impares: " & impares'img);

   new_line;
   num:= 0000000001;
   separar_digitos(num, V, impares);
   Put_Line("Vector del numero 0000000001");
   for i in 1..10 loop
      put(V(i), 2);
   end loop;
   new_line;
   Put_Line("Total de numeros impares: " & impares'img);

   num:= 1357913579;
   separar_digitos(num, V, impares);
   Put_Line("Vector del numero 1357913579");
   for i in 1..10 loop
      put(V(i), 2);
   end loop;
   new_line;
   Put_Line("Total de numeros impares: " & impares'img);

   num:= 1000000000;
   separar_digitos(num, V, impares);
   Put_Line("Vector del numero 1000000000");
   for i in 1..10 loop
      put(V(i), 2);
   end loop;
   new_line;
   Put_Line("Total de numeros impares: " & impares'img);


   -----------------------
   -- binario_a_decimal --
   -----------------------

   new_line(3);

   V:= (0, 0, 0, 0, 0, 0, 0, 1, 0, 1);
   Put_Line("El numero 0000000101 a en decimal es 5");
   Put_Line(Binario_A_Decimal(V)'img);

   V:= (1, 0, 0, 0, 1, 0, 0, 1, 1, 1);
   Put_Line("El numero 1000100111 en decimal es 551");
   Put_Line(Binario_A_Decimal(V)'img);

   V:= (1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
   Put_Line("El numero 1111111111 en decimal es 1023");
   Put_Line(Binario_A_Decimal(V)'img);

   V:= (0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
   Put_Line("El numero 0000000000 en decimal es 0");
   Put_Line(Binario_A_Decimal(V)'img);


   -----------
   -- Rot13 --
   -----------

   new_line(3);

   Sin_Cifrar := "HOLAMUNDO!";
   Put_Line("""HOLAMUNDO!"" en Rot13 es UBYNZHAQB!");
   Rot13(Sin_Cifrar, Cifrado);
   Put_Line(Cifrado);

   new_line;
   Sin_Cifrar := "holamundo!";
   Put_Line("""holamundo!"" en Rot13 es ubynzhaqb!");
   Rot13(Sin_Cifrar, Cifrado);
   Put_Line(Cifrado);

   new_line;
   Sin_Cifrar := "ubynzhaqb!";
   Put_Line("""ubynzhaqb!"" en Rot13 es holamundo!");
   Rot13(Sin_Cifrar, Cifrado);
   Put_Line(Cifrado);


   --------------------
   -- Digito_Control --
   --------------------

   new_line(3);

   V := (1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
   Put_Line("El digito de control para 1111111111 es 0");
   Put_Line(digito_control(v)'img);

   new_line;
   V := (1, 2, 3, 4, 5, 6, 7, 8, 9, 8);
   Put_Line("El digito de control para 1234567898 es 4");
   Put_Line(digito_control(v)'img);

   new_line;
   V := (0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
   Put_Line("El digito de control para 0000000000 es 0");
   Put_Line(digito_control(v)'img);

   new_line;
   V := (9, 9, 9, 9, 9, 9, 9, 9, 9, 9);
   Put_Line("El digito de control para 9999999999 es 0");
   Put_Line(digito_control(v)'img);

   new_line;
   V := (1, 2, 3, 4, 5, 6, 7, 8, 9, 0);
   Put_Line("El digito de control para 1234567890 es 1");
   Put_Line(digito_control(v)'img);

   new_line;
   V := (0,0,0,0,1,9,0,0,2,0);
   Put_Line("El digito de control para 0000190020 es 1");
   Put_Line(digito_control(v)'img);

end Lab05_Pruebas;

