-- CLONAR Y CONCATENAR: COMPROBAR QUE L1 Y L2 NO HAN SIDO ALTERADOOOOOOOS!!!!!

WITH Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Ada.Strings.Unbounded, laboratorio09b, lab09b_escenarios;
USE Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Ada.Strings.Unbounded, laboratorio09b, lab09b_escenarios;

PROCEDURE laboratorio09b_pruebas IS

   -- Generic variables
   enunciado: unbounded_String := null_unbounded_string;

   -- Estructuras de datos para automatizacion de casos de prueba
   -- ** Media **
   type T_media is record
      caso: Natural;
      desc: Unbounded_string;
      L: T_Lista_Dinamica;
   end record;
   type T_vector_medias is array(1..5) of T_media;

   -- ** Maximo **
   type T_maximo is record
      caso: Natural;
      desc: Unbounded_string;
      L: T_Lista_Dinamica;
   end record;
   type T_vector_maximos is array(1..6) of T_maximo;

   -- ** Insertar **4
   type T_insertar is record
      caso: Natural;
      desc: Unbounded_string;
   end record;
   type T_vector_insertar is array(1..6) of T_insertar;

   -- ** Clonar_y_Concatenar **
   type T_clonar_y_concatenar is record
      caso: Natural;
      desc: Unbounded_string;
   end record;
   type T_vector_clonar_y_concatenar is array(1..7) of T_clonar_y_concatenar;

   -- ** Borrar **
   type T_borrar is record
      caso: Natural;
      desc: Unbounded_string;
   end record;
   type T_vector_borrar is array(1..8) of T_borrar;

   -- ** Interseccion **
   type T_interseccion is record
      caso: Natural;
      desc: Unbounded_string;
   end record;
   type T_vector_interseccion is array (1..10) of T_interseccion;

   -- ** Son_iguales **
   type T_son_iguales is record
      caso: Natural;
      desc: Unbounded_string;
   end record;
   type T_vector_son_iguales is array (1..8) of T_son_iguales;

   -- ** Simplificar **
   type T_simplificar is record
      caso: Natural;
      desc: Unbounded_string;
   end record;
   type T_vector_simplificar is array (1..15) of T_simplificar;

   -- ** Crear_Arbol_Binario **
   type T_Crear_Arbol_Binario is record
      caso: Natural;
      desc: Unbounded_string;
   end record;
   type T_vector_crear_arbol_binario is array(1..6) of T_Crear_Arbol_Binario;
   L: T_Lista_Dinamica;

   -- Maximo
   max, pos: Integer;

   -- Clonar y concatenar
   L1, L2: T_Lista_Dinamica;

   -- Interseccion
   Comunes, NoComunes: T_Lista_Dinamica;

   -- Simplificar
   LP: T_Lista_Puntos;
   cuantos: Integer;

   -- Crear_Arbol_Binario
   Arbol: T_Arbol_Binario;
   Arbol_un_valor: T_Arbol_Binario := new T_Nodo_Arbol'(5, null, null);
   Arbol_vacio: T_Arbol_Binario := null;
   -- Vectores para arboles acotados
      -- Caso 1: ejemplo
      Arbol1_copia: T_Vector_Enteros(Arbol1_Ini1..Arbol1_Fin1) := Arbol1_L1(Arbol1_Ini1..Arbol1_Fin1);
      -- Caso 2: balanceado
      Arbol2_copia: T_Vector_Enteros(Arbol2_Ini1..Arbol2_Fin1) := Arbol2_L1(Arbol2_Ini1..Arbol2_Fin1);
      -- Caso 3: asc
      Arbol3_copia: T_Vector_Enteros(Arbol3_Ini1..Arbol3_Fin1) := Arbol3_L1(Arbol3_Ini1..Arbol3_Fin1);
      -- Caso 4: desc
      Arbol4_copia: T_Vector_Enteros(Arbol4_Ini1..Arbol4_Fin1) := Arbol4_L1(Arbol4_Ini1..Arbol4_Fin1);
      -- Caso 5: un unico valor
      Arbol5_copia: T_Vector_Enteros(1..1) := (others => 5);
      -- Caso 6: arbol vacio
      Vv: T_Vector_Enteros(1..0) := (others => 0);

   -- Programa auxiliar para crear una lista dinamica dado un T_Vector_Enteros
   -- @Params
   --    V: el vector de entrada
   --    Ini: indice desde el cual el vector es valido
   --    Fin: indice hasta el cual el vector es valido
   FUNCTION vector_a_lista(V: T_Vector_Enteros; Ini: Integer := 1; Fin: Integer := 10) return T_Lista_Dinamica IS
      L, L_aux: T_Lista_Dinamica;
      i: Integer := ini;
   BEGIN
      if ini <= fin then
         L := new T_Nodo_Enteros;
         L_aux := L;
         loop
            L_aux.info := V(i);
            exit when i = fin;
            L_aux.sig := new T_Nodo_Enteros;
            L_aux := L_aux.sig;
            i := i + 1;
         end loop;
      end if;
      return L;
   END vector_a_lista;

   -- Programa auxiliar para mostrar un objeto T_Lista_Dinamica por consola
   -- @Params
   --    L: la lista dinamica (T_Lista_Dinamica)
   --    Width: espacio ocupado en consola por cada elemento
   PROCEDURE mostrar(L: T_Lista_Dinamica; Width: Integer := 3) IS
   BEGIN
      if L /= null then
         put(L.info, width);
         mostrar(L.sig, width);
      end if;
   END mostrar;

   -- Programa auxiliar para mostrar un objeto T_Lista_Puntos por consola
   -- @Params
   --    VP: la lista de puntos dinamica (T_Lista_Puntos)
   --    Ini: indice desde el cual el vector es valido
   --    Fin: indice hasta el cual el vector es valido
   FUNCTION vector_puntos_a_lista(VP: T_Vector_Puntos; Ini: Integer := 1; Fin: Integer := 15) return T_Lista_Puntos IS
      L, L_Aux: T_Lista_Puntos;
      i: Integer := ini;
   BEGIN
      if Ini <= Fin then
         L := new T_Nodo_Punto;
         L_aux := L;
         loop
            L_aux.info := VP(i);
            exit when i = fin;
            L_aux.sig := new T_Nodo_Punto;
            L_aux := L_aux.sig;
            i := i + 1;
         end loop;
      end if;
      return L;
   END vector_puntos_a_lista;

   -- Programa auxiliar para mostrar un objeto T_Lista_Puntos por consola
   -- @Params
   --    L: la lista de puntos (T_Lista_Puntos)
   --    Decimal: cantidad de decimales a mostrar
   PROCEDURE mostrar_puntos(L: T_Lista_Puntos; Decimal: Integer := 1) IS
   BEGIN
      if L /= null then
         Put("("); Put(L.info.x, 1, decimal, 0); Put(", "); Put(L.info.y, 1, decimal, 0); Put(")");
         mostrar_puntos(L.sig, decimal);
      end if;
   END mostrar_puntos;

   -- Programa auxiliar para mostrar un objeto T_Vector_Enteros por consola
   -- @Params
   --    V: el vector de entrada (T_Vector_Enteros)
   --    Ini: indice desde el cual el vector es valido
   --    Fin: indice hasta el cual el vector es valido
   --    Width: espacio ocupado en consola por cada elemento
   PROCEDURE mostrar_vector_enteros(V: T_Vector_Enteros; Ini: Integer := 1; Fin: Integer := 20; width: Integer := 3) IS
   BEGIN
      for i in Ini..Fin loop
         put(V(i), width);
      end loop;
   END mostrar_vector_enteros;

   -- Programa auxiliar que comprueba si la ejecucion de un programa crear_arbol_binario devuelve la solucion correcta
   FUNCTION eval_crear_arbol_binario(nodo, nodo_correcto: T_Arbol_Binario) RETURN Boolean IS
   BEGIN
      -- 1. Ambos son null
      if nodo = null and nodo_correcto = null then
         return True;
      end if;

      -- 2. Ninguno de los dos es null
      if nodo /= null and nodo_correcto /= null then
         -- Comprobar que es valor de ambos nodos es el mismo y repetir el proceso recursivamente
         return nodo.info = nodo_correcto.info
                and eval_crear_arbol_binario(nodo.menores, nodo_correcto.menores)
                and eval_crear_arbol_binario(nodo.mayores, nodo_correcto.mayores);
      end if;

      -- 3. Solo uno es null
      return False;
   END eval_crear_arbol_binario;
BEGIN
   enunciado := enunciado & "eyou";
   put(to_string(enunciado));
   -----------
   -- Media --
   -----------
   Put_Line("*** Media ***");
   new_line;

   Put_Line("Caso 1: lista con mas de un elemento");
   L := vector_a_lista(V0, V0_Ini, V0_Fin);
   Put("Media de la lista ("); mostrar(L, 2); Put("): "); Put(V0_Res, 1, 2, 0);
   new_line;
   Put(Media(L), 1, 2, 0);

   new_line(2);

   Put_Line("Caso 2: lista con mas de un elemento (2)");
   L := vector_a_lista(V1, V1_Ini, V1_Fin);
   Put("Media de la lista ("); mostrar(L); Put("): "); Put(V1_Res, 1, 2, 0);
   new_line;
   Put(Media(L), 1, 2, 0);

   new_line(2);

   Put_Line("Caso 3: lista con mas de un elemento (3)");
   L := vector_a_lista(V2, V2_Ini, V2_Fin);
   Put("Media de la lista ("); mostrar(L, 2); Put("): "); Put(V2_Res, 1, 2, 0);
   new_line;
   Put(Media(L), 1, 2, 0);

   new_line(2);

   Put_Line("Caso 4: lista con mas de un elemento (4)");
   L := vector_a_lista(V3, V3_Ini, V3_Fin);
   Put("Media de la lista ("); mostrar(L); Put("): "); Put(V3_Res, 1, 2, 0);
   new_line;
   Put(Media(L), 1, 2, 0);

   new_line(2);

   Put_Line("Caso 5: lista con mas de un elemento (5)");
   L := vector_a_lista(V4, V4_Ini, V4_Fin);
   Put("Media de la lista ("); mostrar(L); Put("): "); Put(V4_Res, 1, 2, 0);
   new_line;
   Put(Media(L), 1, 2, 0);

   new_line(2);

   Put_Line("Caso 5: lista vacia");
   L := vector_a_lista(V5, V5_Ini, V5_Fin);
   Put("Media de la lista ("); mostrar(L); Put("): "); Put(V5_Res, 1, 2, 0);
   new_line;
   Put(Media(L), 1, 2, 0);


   ------------
   -- Maximo --
   ------------
   new_line(3);
   Put_Line("*** Maximo ***");
   new_line;

   Put_Line("Caso 1: maximo por el medio de la lista");
   L:= vector_a_lista(M1, M1_Ini, M1_Fin);
   Put("Maximo de la lista ("); mostrar(L, 2); Put("):" & M1_Res'img & ". Posicion:" & M1_pos'img);
   Maximo(L, max, pos);
   new_line;
   Put_Line(max'img & "," & pos'img);

   new_line;

   Put_Line("Caso 2: maximo al final de la lista");
   L:= vector_a_lista(M2, M2_Ini, M2_Fin);
   Put("Maximo de la lista ("); mostrar(L, 2); Put("):" & M2_Res'img & ". Posicion:" & M2_pos'img);
   Maximo(L, max, pos);
   new_line;
   Put_Line(max'img & "," & pos'img);

   new_line;

   Put_Line("Caso 3: maximo al principio de la lista");
   L:= vector_a_lista(M3, M3_Ini, M3_Fin);
   Put("Maximo de la lista ("); mostrar(L, 4); Put("):" & M3_Res'img & ". Posicion:" & M3_pos'img);
   Maximo(L, max, pos);
   new_line;
   Put_Line(max'img & "," & pos'img);

   new_line;

   Put_Line("Caso 4: maximo al final de la lista (2)");
   L:= vector_a_lista(M4, M4_Ini, M4_Fin);
   Put("Maximo de la lista ("); mostrar(L, 2); Put("):" & M4_Res'img & ". Posicion:" & M4_pos'img);
   Maximo(L, max, pos);
   new_line;
   Put_Line(max'img & "," & pos'img);

   new_line;

   Put_Line("Caso 5: lista de un solo valor");
   L:= vector_a_lista(M5, M5_Ini, M5_Fin);
   Put("Maximo de la lista ("); mostrar(L, 1); Put("):" & M5_Res'img & ". Posicion:" & M5_pos'img);
   Maximo(L, max, pos);
   new_line;
   Put_Line(max'img & "," & pos'img);

   new_line;

   Put_Line("Caso 6: lista vacia");
   L:= vector_a_lista(M6, M6_Ini, M6_Fin);
   Put("Maximo de la lista ("); mostrar(L); Put("):" & M6_Res'img & ". Posicion:" & M6_pos'img);
   Maximo(L, max, pos);
   new_line;
   Put_Line(max'img & "," & pos'img);


   --------------
   -- Insertar --
   --------------
   new_line(2);
   Put_Line("*** Insertar ***");
   new_line;

   Put_Line("Caso 1: insertar por el medio");
   L:= vector_a_lista(I1, I1_Ini1, I1_Fin1);
   Put("Insertar el numero" & I1_Num'img & " en la lista ("); mostrar(L); Put("). Resultado correcto: ("); mostrar(vector_a_lista(I1_Res, I1_Ini2, I1_Fin2)); Put(")");
   Insertar(L, I1_Num);
   new_line;
   mostrar(L);

   new_line(2);

   Put_Line("Caso 2: insertar al final");
   L:= vector_a_lista(I2, I2_Ini1, I2_Fin1);
   Put("Insertar el numero" & I2_Num'img & " en la lista ("); mostrar(L); Put("). Resultado correcto: ("); mostrar(vector_a_lista(I2_Res, I2_Ini2, I2_Fin2)); Put(")");
   Insertar(L, I2_Num);
   new_line;
   mostrar(L);

   new_line(2);

   Put_Line("Caso 3: insertar al principio");
   L:= vector_a_lista(I3, I3_Ini1, I3_Fin1);
   Put("Insertar el numero" & I3_Num'img & " en la lista ("); mostrar(L); Put("). Resultado correcto: ("); mostrar(vector_a_lista(I3_Res, I3_Ini2, I3_Fin2)); Put(")");
   Insertar(L, I3_Num);
   new_line;
   mostrar(L);

   new_line(2);

   Put_Line("Caso 4: insertar al principio en una lista de un unico valor");
   L:= vector_a_lista(I4, I4_Ini1, I4_Fin1);
   Put("Insertar el numero" & I4_Num'img & " en la lista ("); mostrar(L, 1); Put("). Resultado correcto: ("); mostrar(vector_a_lista(I4_Res, I4_Ini2, I4_Fin2), 2); Put(")");
   Insertar(L, I4_Num);
   new_line;
   mostrar(L, 2);

   new_line(2);

   Put_Line("Caso 5: insertar al final en una lista de un unico valor");
   L:= vector_a_lista(I5, I5_Ini1, I5_Fin1);
   Put("Insertar el numero" & I5_Num'img & " en la lista ("); mostrar(L, 1); Put("). Resultado correcto: ("); mostrar(vector_a_lista(I5_Res, I5_Ini2, I5_Fin2), 2); Put(")");
   Insertar(L, I5_Num);
   new_line;
   mostrar(L, 2);

   new_line(2);

   Put_Line("Caso 6: insertar en una lista vacia");
   L:= vector_a_lista(I6, I6_Ini1, I6_Fin1);
   Put("Insertar el numero" & I6_Num'img & " en la lista ("); mostrar(L); Put("). Resultado correcto: ("); mostrar(vector_a_lista(I6_Res, I6_Ini2, I6_Fin2), 1); Put(")");
   Insertar(L, I6_Num);
   new_line;
   mostrar(L);


   -------------------------
   -- Clonar_y_Concatenar --
   -------------------------
   new_line(3);
   Put_Line("*** Clonar_y_Concatenar ***");
   new_line;

   Put_Line("Caso 1: clonar y concatenar dos listas con mas de un valor");
   L := null;
   L1 := vector_a_lista(CyC1_L1, CyC1_Ini1, CyC1_Fin1);
   L2 := vector_a_lista(CyC1_L2, CyC1_Ini2, CyC1_Fin2);
   Put("Clonar y concatenar ("); mostrar(L1, 2); Put(") y ("); mostrar(L2, 2); Put("). Resultado: ("); mostrar(vector_a_lista(CyC1_Res, CyC1_Ini3, CyC1_Fin3), 2); Put(")");
   Clonar_y_Concatenar(L1, L2, L);
   new_line;
   mostrar(L, 2);

   new_line(2);

   Put_Line("Caso 2: clonar y concatenar primera lista de un unico valor con segunda de mas de un valor");
   L := null;
   L1 := vector_a_lista(CyC2_L1, CyC2_Ini1, CyC2_Fin1);
   L2 := vector_a_lista(CyC2_L2, CyC2_Ini2, CyC2_Fin2);
   Put("Clonar y concatenar ("); mostrar(L1, 1); Put(") y ("); mostrar(L2, 2); Put("). Resultado: ("); mostrar(vector_a_lista(CyC2_Res, CyC2_Ini3, CyC2_Fin3), 2); Put(")");
   Clonar_y_Concatenar(L1, L2, L);
   new_line;
   mostrar(L, 2);

   new_line(2);

   Put_Line("Caso 3: clonar y concatenar primera lista de mas de un valor con segundo de un unico valor");
   L := null;
   L1 := vector_a_lista(CyC3_L1, CyC3_Ini1, CyC3_Fin1);
   L2 := vector_a_lista(CyC3_L2, CyC3_Ini2, CyC3_Fin2);
   Put("Clonar y concatenar ("); mostrar(L1, 2); Put(") y ("); mostrar(L2, 1); Put("). Resultado: ("); mostrar(vector_a_lista(CyC3_Res, CyC3_Ini3, CyC3_Fin3), 2); Put(")");
   Clonar_y_Concatenar(L1, L2, L);
   new_line;
   mostrar(L, 2);

   new_line(2);

   Put_Line("Caso 4: clonar y concatenar dos listas de un unico valor");
   L := null;
   L1 := vector_a_lista(CyC4_L1, CyC4_Ini1, CyC4_Fin1);
   L2 := vector_a_lista(CyC4_L2, CyC4_Ini2, CyC4_Fin2);
   Put("Clonar y concatenar ("); mostrar(L1, 1); Put(") y ("); mostrar(L2, 1); Put("). Resultado: ("); mostrar(vector_a_lista(CyC4_Res, CyC4_Ini3, CyC4_Fin3), 2); Put(")");
   Clonar_y_Concatenar(L1, L2, L);
   new_line;
   mostrar(L, 2);

   new_line(2);

   Put_Line("Caso 5: clonar y concatenar primera lista vacia con segunda de al menos un valor");
   L := null;
   L1 := vector_a_lista(CyC5_L1, CyC5_Ini1, CyC5_Fin1);
   L2 := vector_a_lista(CyC5_L2, CyC5_Ini2, CyC5_Fin2);
   Put("Clonar y concatenar ("); mostrar(L1); Put(") y ("); mostrar(L2, 2); Put("). Resultado: ("); mostrar(vector_a_lista(CyC5_Res, CyC5_Ini3, CyC5_Fin3), 2); Put(")");
   Clonar_y_Concatenar(L1, L2, L);
   new_line;
   mostrar(L, 2);

   new_line(2);

   Put_Line("Caso 6: clonar y concatenar primera lista de al menor un valor con segunda lista vacia");
   L := null;
   L1 := vector_a_lista(CyC6_L1, CyC6_Ini1, CyC6_Fin1);
   L2 := vector_a_lista(CyC6_L2, CyC6_Ini2, CyC6_Fin2);
   Put("Clonar y concatenar ("); mostrar(L1, 2); Put(") y ("); mostrar(L2); Put("). Resultado: ("); mostrar(vector_a_lista(CyC6_Res, CyC6_Ini3, CyC6_Fin3), 2); Put(")");
   Clonar_y_Concatenar(L1, L2, L);
   new_line;
   mostrar(L, 2);

   new_line(2);

   Put_Line("Caso 7: clonar y concatenar dos listas vacias");
   L := null;
   L1 := vector_a_lista(CyC7_L1, CyC7_Ini1, CyC7_Fin1);
   L2 := vector_a_lista(CyC7_L2, CyC7_Ini2, CyC7_Fin2);
   Put("Clonar y concatenar ("); mostrar(L1); Put(") y ("); mostrar(L2); Put("). Resultado: ("); mostrar(vector_a_lista(CyC7_Res, CyC7_Ini3, CyC7_Fin3)); Put(")");
   Clonar_y_Concatenar(L1, L2, L);
   new_line;
   mostrar(L);


   ------------
   -- Borrar --
   ------------
   new_line(3);
   Put_Line("*** Borrar ***");
   new_line;

   Put_Line("Caso 1: borrar un elemento por el medio en una lista de mas de 1 valor");
   L := vector_a_lista(B1_L, B1_ini1, B1_fin1);
   Put("Borrar el numero" & B1_Num'img & " de la lista ("); mostrar(L); Put("). Resultado: ("); mostrar(vector_a_lista(B1_Res, B1_ini2, B1_fin2)); Put(")");
   new_line;
   Borrar(L, B1_Num);
   new_line;
   mostrar(L);

   new_line(2);

   Put_Line("Caso 2: borrar el elemento del final en una lista de mas de 1 valor");
   L := vector_a_lista(B2_L, B2_ini1, B2_fin1);
   Put("Borrar el numero" & B2_Num'img & " de la lista ("); mostrar(L); Put("). Resultado: ("); mostrar(vector_a_lista(B2_Res, B2_ini2, B2_fin2)); Put(")");
   new_line;
   Borrar(L, B2_Num);
   new_line;
   mostrar(L);

   new_line(2);

   Put_Line("Caso 3: borrar el elemento del principio en una lista de mas de 1 valor");
   L := vector_a_lista(B3_L, B3_ini1, B3_fin1);
   Put("Borrar el numero" & B3_Num'img & " de la lista ("); mostrar(L); Put("). Resultado: ("); mostrar(vector_a_lista(B3_Res, B3_ini2, B3_fin2)); Put(")");
   new_line;
   Borrar(L, B3_Num);
   new_line;
   mostrar(L);

   new_line(2);

   Put_Line("Caso 4: borrar todos los elementos de una lista de al menos un valor");
   L := vector_a_lista(B4_L, B4_ini1, B4_fin1);
   Put("Borrar el numero" & B4_Num'img & " de la lista ("); mostrar(L, 2); Put("). Resultado: ("); mostrar(vector_a_lista(B4_Res, B4_ini2, B4_fin2), 2); Put(")");
   new_line;
   Borrar(L, B4_Num);
   new_line;
   mostrar(L);

   new_line(2);

   Put_Line("Caso 5: borrar un elemento que no existe en una lista de mas de un valor");
   L := vector_a_lista(B5_L, B5_ini1, B5_fin1);
   Put("Borrar el numero" & B5_Num'img & " de la lista ("); mostrar(L, 2); Put("). Resultado: ("); mostrar(vector_a_lista(B5_Res, B5_ini2, B5_fin2), 2); Put(")");
   new_line;
   Borrar(L, B5_Num);
   new_line;
   mostrar(L, 2);

   new_line(2);

   Put_Line("Caso 6: borrar un elemento en una lista de un unico valor");
   L := vector_a_lista(B6_L, B6_ini1, B6_fin1);
   Put("Borrar el numero" & B6_Num'img & " de la lista ("); mostrar(L, 2); Put("). Resultado: ("); mostrar(vector_a_lista(B6_Res, B6_ini2, B6_fin2)); Put(")");
   new_line;
   Borrar(L, B6_Num);
   new_line;
   mostrar(L);

   new_line(2);

   Put_Line("Caso 7: borrar un elemento que no existe en una lista de un unico valor");
   L := vector_a_lista(B7_L, B7_ini1, B7_fin1);
   Put("Borrar el numero" & B7_Num'img & " de la lista ("); mostrar(L, 1); Put("). Resultado: ("); mostrar(vector_a_lista(B7_Res, B7_ini2, B7_fin2), 1); Put(")");
   new_line;
   Borrar(L, B7_Num);
   new_line;
   mostrar(L, 1);

   new_line(2);

   Put_Line("Caso 8: lista vacia");
   L := vector_a_lista(B8_L, B8_ini1, B8_fin1);
   Put("Borrar el numero" & B8_Num'img & " de la lista ("); mostrar(L); Put("). Resultado: ("); mostrar(vector_a_lista(B8_Res, B8_ini2, B8_fin2)); Put(")");
   new_line;
   Borrar(L, B8_Num);
   new_line;
   mostrar(L);


   ------------------
   -- Interseccion --
   ------------------
   new_line(3);
   Put_Line("*** Interseccion ***");
   new_line;

   Put_Line("Caso 1: L1 varios elementos y L2 varios elementos (comunes y no comunes)");
   L1 := vector_a_lista(Interseccion1_L1, Interseccion1_Ini1, Interseccion1_Fin1);
   L2 := vector_a_lista(Interseccion1_L2, Interseccion1_Ini2, Interseccion1_Fin2);
   Put("En las listas ("); mostrar(L1); Put(") y ("); mostrar(L2); Put("):");
   new_line;
   Put("   Comunes: ("); mostrar(vector_a_lista(Interseccion1_ResC, Interseccion1_Ini3, Interseccion1_Fin3)); Put(")");
   new_line;
   Put("   No comunes: ("); mostrar(vector_a_lista(Interseccion1_ResN, Interseccion1_Inir, Interseccion1_Finr)); Put(")");
   new_line;
   Put_Line("Resultado:");
   Interseccion(L1, L2, Comunes, NoComunes);
   Put("   Comunes: ("); mostrar(Comunes); Put(")");
   new_line;
   Put("   No comunes: ("); mostrar(NoComunes); Put(")");

   new_line(2);

   Put_Line("Caso 2: L1 varios elementos y L2 varios elementos (solo comunes)");
   L1 := vector_a_lista(Interseccion2_L1, Interseccion2_Ini1, Interseccion2_Fin1);
   L2 := vector_a_lista(Interseccion2_L2, Interseccion2_Ini2, Interseccion2_Fin2);
   Put("En las listas ("); mostrar(L1); Put(") y ("); mostrar(L2); Put("):");
   new_line;
   Put("   Comunes: ("); mostrar(vector_a_lista(Interseccion2_ResC, Interseccion2_Ini3, Interseccion2_Fin3)); Put(")");
   new_line;
   Put("   No comunes: ("); mostrar(vector_a_lista(Interseccion2_ResN, Interseccion2_Inir, Interseccion2_Finr)); Put(")");
   new_line;
   Put_Line("Resultado:");
   Interseccion(L1, L2, Comunes, NoComunes);
   Put("   Comunes: ("); mostrar(Comunes); Put(")");
   new_line;
   Put("   No comunes: ("); mostrar(NoComunes); Put(")");

   new_line(2);

   Put_Line("Caso 3: L1 varios elementos y L2 varios elementos (solo no comunes)");
   L1 := vector_a_lista(Interseccion3_L1, Interseccion3_Ini1, Interseccion3_Fin1);
   L2 := vector_a_lista(Interseccion3_L2, Interseccion3_Ini2, Interseccion3_Fin2);
   Put("En las listas ("); mostrar(L1); Put(") y ("); mostrar(L2); Put("):");
   new_line;
   Put("   Comunes: ("); mostrar(vector_a_lista(Interseccion3_ResC, Interseccion3_Ini3, Interseccion3_Fin3)); Put(")");
   new_line;
   Put("   No comunes: ("); mostrar(vector_a_lista(Interseccion3_ResN, Interseccion3_Inir, Interseccion3_Finr)); Put(")");
   new_line;
   Put_Line("Resultado:");
   Interseccion(L1, L2, Comunes, NoComunes);
   Put("   Comunes: ("); mostrar(Comunes); Put(")");
   new_line;
   Put("   No comunes: ("); mostrar(NoComunes); Put(")");

   new_line(2);

   Put_Line("Caso 4: L1 varios elementos y L2 un elemento (es comun)");
   L1 := vector_a_lista(Interseccion4_L1, Interseccion4_Ini1, Interseccion4_Fin1);
   L2 := vector_a_lista(Interseccion4_L2, Interseccion4_Ini2, Interseccion4_Fin2);
   Put("En las listas ("); mostrar(L1); Put(") y ("); mostrar(L2); Put("):");
   new_line;
   Put("   Comunes: ("); mostrar(vector_a_lista(Interseccion4_ResC, Interseccion4_Ini3, Interseccion4_Fin3)); Put(")");
   new_line;
   Put("   No comunes: ("); mostrar(vector_a_lista(Interseccion4_ResN, Interseccion4_Inir, Interseccion4_Finr)); Put(")");
   new_line;
   Put_Line("Resultado:");
   Interseccion(L1, L2, Comunes, NoComunes);
   Put("   Comunes: ("); mostrar(Comunes); Put(")");
   new_line;
   Put("   No comunes: ("); mostrar(NoComunes); Put(")");

   new_line(2);

   Put_Line("Caso 5: L1 Varios elementos y L2 un elemento (no es comun)");
   L1 := vector_a_lista(Interseccion5_L1, Interseccion5_Ini1, Interseccion5_Fin1);
   L2 := vector_a_lista(Interseccion5_L2, Interseccion5_Ini2, Interseccion5_Fin2);
   Put("En las listas ("); mostrar(L1); Put(") y ("); mostrar(L2); Put("):");
   new_line;
   Put("   Comunes: ("); mostrar(vector_a_lista(Interseccion5_ResC, Interseccion5_Ini3, Interseccion5_Fin3)); Put(")");
   new_line;
   Put("   No comunes: ("); mostrar(vector_a_lista(Interseccion5_ResN, Interseccion5_Inir, Interseccion5_Finr)); Put(")");
   new_line;
   Put_Line("Resultado:");
   Interseccion(L1, L2, Comunes, NoComunes);
   Put("   Comunes: ("); mostrar(Comunes); Put(")");
   new_line;
   Put("   No comunes: ("); mostrar(NoComunes); Put(")");

   new_line(2);

   Put_Line("Caso 6: L1 varios elementos y L2 vacia");
   L1 := vector_a_lista(Interseccion6_L1, Interseccion6_Ini1, Interseccion6_Fin1);
   L2 := vector_a_lista(Interseccion6_L2, Interseccion6_Ini2, Interseccion6_Fin2);
   Put("En las listas ("); mostrar(L1); Put(") y ("); mostrar(L2); Put("):");
   new_line;
   Put("   Comunes: ("); mostrar(vector_a_lista(Interseccion6_ResC, Interseccion6_Ini3, Interseccion6_Fin3)); Put(")");
   new_line;
   Put("   No comunes: ("); mostrar(vector_a_lista(Interseccion6_ResN, Interseccion6_Inir, Interseccion6_Finr)); Put(")");
   new_line;
   Put_Line("Resultado:");
   Interseccion(L1, L2, Comunes, NoComunes);
   Put("   Comunes: ("); mostrar(Comunes); Put(")");
   new_line;
   Put("   No comunes: ("); mostrar(NoComunes); Put(")");

   new_line(2);

   Put_Line("Caso 7: L1 un elemento (es comun) y L2 varios elementos");
   L1 := vector_a_lista(Interseccion7_L1, Interseccion7_Ini1, Interseccion7_Fin1);
   L2 := vector_a_lista(Interseccion7_L2, Interseccion7_Ini2, Interseccion7_Fin2);
   Put("En las listas ("); mostrar(L1); Put(") y ("); mostrar(L2); Put("):");
   new_line;
   Put("   Comunes: ("); mostrar(vector_a_lista(Interseccion7_ResC, Interseccion7_Ini3, Interseccion7_Fin3)); Put(")");
   new_line;
   Put("   No comunes: ("); mostrar(vector_a_lista(Interseccion7_ResN, Interseccion7_Inir, Interseccion7_Finr)); Put(")");
   new_line;
   Put_Line("Resultado:");
   Interseccion(L1, L2, Comunes, NoComunes);
   Put("   Comunes: ("); mostrar(Comunes); Put(")");
   new_line;
   Put("   No comunes: ("); mostrar(NoComunes); Put(")");

   new_line(2);

   Put_Line("Caso 8: L1 un elemento (no es comun) y L2 varios elementos");
   L1 := vector_a_lista(Interseccion8_L1, Interseccion8_Ini1, Interseccion8_Fin1);
   L2 := vector_a_lista(Interseccion8_L2, Interseccion8_Ini2, Interseccion8_Fin2);
   Put("En las listas ("); mostrar(L1); Put(") y ("); mostrar(L2); Put("):");
   new_line;
   Put("   Comunes: ("); mostrar(vector_a_lista(Interseccion8_ResC, Interseccion8_Ini3, Interseccion8_Fin3)); Put(")");
   new_line;
   Put("   No comunes: ("); mostrar(vector_a_lista(Interseccion8_ResN, Interseccion8_Inir, Interseccion8_Finr)); Put(")");
   new_line;
   Put_Line("Resultado:");
   Interseccion(L1, L2, Comunes, NoComunes);
   Put("   Comunes: ("); mostrar(Comunes); Put(")");
   new_line;
   Put("   No comunes: ("); mostrar(NoComunes); Put(")");

   new_line(2);

   Put_Line("Caso 9: L1 un elemento y L2 vacia");
   L1 := vector_a_lista(Interseccion9_L1, Interseccion9_Ini1, Interseccion9_Fin1);
   L2 := vector_a_lista(Interseccion9_L2, Interseccion9_Ini2, Interseccion9_Fin2);
   Put("En las listas ("); mostrar(L1); Put(") y ("); mostrar(L2); Put("):");
   new_line;
   Put("   Comunes: ("); mostrar(vector_a_lista(Interseccion9_ResC, Interseccion9_Ini3, Interseccion9_Fin3)); Put(")");
   new_line;
   Put("   No comunes: ("); mostrar(vector_a_lista(Interseccion9_ResN, Interseccion9_Inir, Interseccion9_Finr)); Put(")");
   new_line;
   Put_Line("Resultado:");
   Interseccion(L1, L2, Comunes, NoComunes);
   Put("   Comunes: ("); mostrar(Comunes); Put(")");
   new_line;
   Put("   No comunes: ("); mostrar(NoComunes); Put(")");

   new_line(2);

   Put_Line("Caso 10: ambas listas vacias");
   L1 := vector_a_lista(Interseccion0_L1, Interseccion0_Ini1, Interseccion0_Fin1);
   L2 := vector_a_lista(Interseccion0_L2, Interseccion0_Ini2, Interseccion0_Fin2);
   Put("En las listas ("); mostrar(L1); Put(") y ("); mostrar(L2); Put("):");
   new_line;
   Put("   Comunes: ("); mostrar(vector_a_lista(Interseccion0_ResC, Interseccion0_Ini3, Interseccion0_Fin3)); Put(")");
   new_line;
   Put("   No comunes: ("); mostrar(vector_a_lista(Interseccion0_ResN, Interseccion0_Inir, Interseccion0_Finr)); Put(")");
   new_line;
   Put_Line("Resultado:");
   Interseccion(L1, L2, Comunes, NoComunes);
   Put("   Comunes: ("); mostrar(Comunes); Put(")");
   new_line;
   Put("   No comunes: ("); mostrar(NoComunes); Put(")");


   -----------------
   -- Son_iguales --
   -----------------
   new_line(3);
   Put_Line("*** Son_iguales ***");
   new_line;

   Put_Line("Caso 1: L1 y L2 varios elementos (iguales)");
   L1:= vector_a_lista(iguales1_L1, Iguales1_Ini1, Iguales1_Fin1);
   L2:= vector_a_lista(iguales1_L2, Iguales1_Ini2, Iguales1_Fin2);
   Put("Son iguales las listas ("); mostrar(L1); Put(") y ("); mostrar(L2); Put(") ? TRUE");
   new_line;
   Put_Line(son_iguales(L1, L2)'img);

   new_line;

   Put_Line("Caso 2: L1 y L2 varios elementos (no iguales)");
   L1:= vector_a_lista(iguales2_L1, Iguales2_Ini1, Iguales2_Fin1);
   L2:= vector_a_lista(iguales2_L2, Iguales2_Ini2, Iguales2_Fin2);
   Put("Son iguales las listas ("); mostrar(L1); Put(") y ("); mostrar(L2); Put(") ? FALSE");
   new_line;
   Put_Line(son_iguales(L1, L2)'img);

   new_line;

   Put_Line("Caso 3: L1 varios elementos y L2 un unico elemento");
   L1:= vector_a_lista(iguales3_L1, Iguales3_Ini1, Iguales3_Fin1);
   L2:= vector_a_lista(iguales3_L2, Iguales3_Ini2, Iguales3_Fin2);
   Put("Son iguales las listas ("); mostrar(L1); Put(") y ("); mostrar(L2); Put(") ? FALSE");
   new_line;
   Put_Line(son_iguales(L1, L2)'img);

   new_line;

   Put_Line("Caso 4: L1 un unico elemento y L2 varios elementos");
   L1:= vector_a_lista(iguales4_L1, Iguales4_Ini1, Iguales4_Fin1);
   L2:= vector_a_lista(iguales4_L2, Iguales4_Ini2, Iguales4_Fin2);
   Put("Son iguales las listas ("); mostrar(L1); Put(") y ("); mostrar(L2); Put(") ? FALSE");
   new_line;
   Put_Line(son_iguales(L1, L2)'img);

   new_line;

   Put_Line("Caso 5: L1 y L2 ambas un unico elemento");
   L1:= vector_a_lista(iguales5_L1, Iguales5_Ini1, Iguales5_Fin1);
   L2:= vector_a_lista(iguales5_L2, Iguales5_Ini2, Iguales5_Fin2);
   Put("Son iguales las listas ("); mostrar(L1); Put(") y ("); mostrar(L2); Put(") ? TRUE");
   new_line;
   Put_Line(son_iguales(L1, L2)'img);

   new_line;

   Put_Line("Caso 6: L1 vacia y L2 al menos un elemento");
   L1:= vector_a_lista(iguales6_L1, Iguales6_Ini1, Iguales6_Fin1);
   L2:= vector_a_lista(iguales6_L2, Iguales6_Ini2, Iguales6_Fin2);
   Put("Son iguales las listas ("); mostrar(L1); Put(") y ("); mostrar(L2); Put(") ? FALSE");
   new_line;
   Put_Line(son_iguales(L1, L2)'img);

   new_line;

   Put_Line("Caso 7: L1 al menos un elemento y L2 vacia");
   L1:= vector_a_lista(iguales7_L1, Iguales7_Ini1, Iguales7_Fin1);
   L2:= vector_a_lista(iguales7_L2, Iguales7_Ini2, Iguales7_Fin2);
   Put("Son iguales las listas ("); mostrar(L1); Put(") y ("); mostrar(L2); Put(") ? FALSE");
   new_line;
   Put_Line(son_iguales(L1, L2)'img);

   new_line;

   Put_Line("Caso 8: ambas listas vacias");
   L1:= vector_a_lista(iguales8_L1, Iguales8_Ini1, Iguales8_Fin1);
   L2:= vector_a_lista(iguales8_L2, Iguales8_Ini2, Iguales8_Fin2);
   Put("Son iguales las listas ("); mostrar(L1); Put(") y ("); mostrar(L2); Put(") ? TRUE");
   new_line;
   Put_Line(son_iguales(L1, L2)'img);


   -----------------
   -- Simplificar --
   -----------------
   new_line(3);
   Put_Line("*** Simplificar ***");
   new_line;

   Put_Line("Caso 1: lista de 15 elementos");
   LP:= vector_puntos_a_lista(Simplify, S_Ini01, S_Fin01);
   Put_Line("Lista:");
   Put("("); mostrar_puntos(LP); Put(")");
   new_line(2);
   Put_Line("Simplificada:");
   mostrar_puntos(vector_puntos_a_lista(S_Res01, S_Ini01, S_Res01_len));
   new_line;
   Put_Line("Elementos despues de simplificar: " & S_Res01_len'img);
   Simplificar(LP, Cuantos);
   new_line;
   Put_Line("Lista resultante:");
   mostrar_puntos(LP);
   new_line;
   Put_Line("Elementos despues de simplificar: " & Cuantos'img);

   new_line(2);

   Put_Line("Caso 2: lista de 14 elementos");
   LP:= vector_puntos_a_lista(Simplify, S_Ini02, S_Fin02);
   Put_Line("Lista:");
   Put("("); mostrar_puntos(LP); Put(")");
   new_line(2);
   Put_Line("Simplificada:");
   mostrar_puntos(vector_puntos_a_lista(S_Res02, S_Ini02, S_Res02_len));
   new_line;
   Put_Line("Elementos despues de simplificar: " & S_Res02_len'img);
   Simplificar(LP, Cuantos);
   new_line;
   Put_Line("Lista resultante:");
   mostrar_puntos(LP);
   new_line;
   Put_Line("Elementos despues de simplificar: " & Cuantos'img);

   new_line(2);

   Put_Line("Caso 3: lista de 13 elementos");
   LP:= vector_puntos_a_lista(Simplify, S_Ini03, S_Fin03);
   Put_Line("Lista:");
   Put("("); mostrar_puntos(LP); Put(")");
   new_line(2);
   Put_Line("Simplificada:");
   mostrar_puntos(vector_puntos_a_lista(S_Res03, S_Ini03, S_Res03_len));
   new_line;
   Put_Line("Elementos despues de simplificar: " & S_Res03_len'img);
   Simplificar(LP, Cuantos);
   new_line;
   Put_Line("Lista resultante:");
   mostrar_puntos(LP);
   new_line;
   Put_Line("Elementos despues de simplificar: " & Cuantos'img);

   new_line(2);

   Put_Line("Caso 4: lista de 12 elementos");
   LP:= vector_puntos_a_lista(Simplify, S_Ini04, S_Fin04);
   Put_Line("Lista:");
   Put("("); mostrar_puntos(LP); Put(")");
   new_line(2);
   Put_Line("Simplificada:");
   mostrar_puntos(vector_puntos_a_lista(S_Res04, S_Ini04, S_Res04_len));
   new_line;
   Put_Line("Elementos despues de simplificar: " & S_Res04_len'img);
   Simplificar(LP, Cuantos);
   new_line;
   Put_Line("Lista resultante:");
   mostrar_puntos(LP);
   new_line;
   Put_Line("Elementos despues de simplificar: " & Cuantos'img);

   new_line(2);

   Put_Line("Caso 5: lista de 11 elementos");
   LP:= vector_puntos_a_lista(Simplify, S_Ini05, S_Fin05);
   Put_Line("Lista:");
   Put("("); mostrar_puntos(LP); Put(")");
   new_line(2);
   Put_Line("Simplificada:");
   mostrar_puntos(vector_puntos_a_lista(S_Res05, S_Ini05, S_Res05_len));
   new_line;
   Put_Line("Elementos despues de simplificar: " & S_Res05_len'img);
   Simplificar(LP, Cuantos);
   new_line;
   Put_Line("Lista resultante:");
   mostrar_puntos(LP);
   new_line;
   Put_Line("Elementos despues de simplificar: " & Cuantos'img);

   new_line(2);

   Put_Line("Caso 6: lista de 10 elementos");
   LP:= vector_puntos_a_lista(Simplify, S_Ini06, S_Fin06);
   Put_Line("Lista:");
   Put("("); mostrar_puntos(LP); Put(")");
   new_line(2);
   Put_Line("Simplificada:");
   mostrar_puntos(vector_puntos_a_lista(S_Res06, S_Ini06, S_Res06_len));
   new_line;
   Put_Line("Elementos despues de simplificar: " & S_Res06_len'img);
   Simplificar(LP, Cuantos);
   new_line;
   Put_Line("Lista resultante:");
   mostrar_puntos(LP);
   new_line;
   Put_Line("Elementos despues de simplificar: " & Cuantos'img);

   new_line(2);

   Put_Line("Caso 7: lista de 9 elementos");
   LP:= vector_puntos_a_lista(Simplify, S_Ini07, S_Fin07);
   Put_Line("Lista:");
   Put("("); mostrar_puntos(LP); Put(")");
   new_line(2);
   Put_Line("Simplificada:");
   mostrar_puntos(vector_puntos_a_lista(S_Res07, S_Ini07, S_Res07_len));
   new_line;
   Put_Line("Elementos despues de simplificar: " & S_Res07_len'img);
   Simplificar(LP, Cuantos);
   new_line;
   Put_Line("Lista resultante:");
   mostrar_puntos(LP);
   new_line;
   Put_Line("Elementos despues de simplificar: " & Cuantos'img);

   new_line(2);

   Put_Line("Caso 8: lista de 8 elementos");
   LP:= vector_puntos_a_lista(Simplify, S_Ini08, S_Fin08);
   Put_Line("Lista:");
   Put("("); mostrar_puntos(LP); Put(")");
   new_line(2);
   Put_Line("Simplificada:");
   mostrar_puntos(vector_puntos_a_lista(S_Res08, S_Ini08, S_Res08_len));
   new_line;
   Put_Line("Elementos despues de simplificar: " & S_Res08_len'img);
   Simplificar(LP, Cuantos);
   new_line;
   Put_Line("Lista resultante:");
   mostrar_puntos(LP);
   new_line;
   Put_Line("Elementos despues de simplificar: " & Cuantos'img);

   new_line(2);

   Put_Line("Caso 9: lista de 7 elementos");
   LP:= vector_puntos_a_lista(Simplify, S_Ini09, S_Fin09);
   Put_Line("Lista:");
   Put("("); mostrar_puntos(LP); Put(")");
   new_line(2);
   Put_Line("Simplificada:");
   mostrar_puntos(vector_puntos_a_lista(S_Res09, S_Ini09, S_Res09_len));
   new_line;
   Put_Line("Elementos despues de simplificar: " & S_Res09_len'img);
   Simplificar(LP, Cuantos);
   new_line;
   Put_Line("Lista resultante:");
   mostrar_puntos(LP);
   new_line;
   Put_Line("Elementos despues de simplificar: " & Cuantos'img);

   new_line(2);

   Put_Line("Caso 10: lista de 6 elementos");
   LP:= vector_puntos_a_lista(Simplify, S_Ini10, S_Fin10);
   Put_Line("Lista:");
   Put("("); mostrar_puntos(LP); Put(")");
   new_line(2);
   Put_Line("Simplificada:");
   mostrar_puntos(vector_puntos_a_lista(S_Res10, S_Ini10, S_Res10_len));
   new_line;
   Put_Line("Elementos despues de simplificar: " & S_Res10_len'img);
   Simplificar(LP, Cuantos);
   new_line;
   Put_Line("Lista resultante:");
   mostrar_puntos(LP);
   new_line;
   Put_Line("Elementos despues de simplificar: " & Cuantos'img);

   new_line(2);

   Put_Line("Caso 11: lista de 5 elementos");
   LP:= vector_puntos_a_lista(Simplify, S_Ini11, S_Fin11);
   Put_Line("Lista:");
   Put("("); mostrar_puntos(LP); Put(")");
   new_line(2);
   Put_Line("Simplificada:");
   mostrar_puntos(vector_puntos_a_lista(S_Res11, S_Ini11, S_Res11_len));
   new_line;
   Put_Line("Elementos despues de simplificar: " & S_Res11_len'img);
   Simplificar(LP, Cuantos);
   new_line;
   Put_Line("Lista resultante:");
   mostrar_puntos(LP);
   new_line;
   Put_Line("Elementos despues de simplificar: " & Cuantos'img);

   new_line(2);

   Put_Line("Caso 12: lista de 4 elementos");
   LP:= vector_puntos_a_lista(Simplify, S_Ini12, S_Fin12);
   Put_Line("Lista:");
   Put("("); mostrar_puntos(LP); Put(")");
   new_line(2);
   Put_Line("Simplificada:");
   mostrar_puntos(vector_puntos_a_lista(S_Res12, S_Ini12, S_Res12_len));
   new_line;
   Put_Line("Elementos despues de simplificar: " & S_Res12_len'img);
   Simplificar(LP, Cuantos);
   new_line;
   Put_Line("Lista resultante:");
   mostrar_puntos(LP);
   new_line;
   Put_Line("Elementos despues de simplificar: " & Cuantos'img);

   new_line(2);

   Put_Line("Caso 13: lista de 3 elementos");
   LP:= vector_puntos_a_lista(Simplify, S_Ini13, S_Fin13);
   Put_Line("Lista:");
   Put("("); mostrar_puntos(LP); Put(")");
   new_line(2);
   Put_Line("Simplificada:");
   mostrar_puntos(vector_puntos_a_lista(S_Res13, S_Ini13, S_Res13_len));
   new_line;
   Put_Line("Elementos despues de simplificar: " & S_Res13_len'img);
   Simplificar(LP, Cuantos);
   new_line;
   Put_Line("Lista resultante:");
   mostrar_puntos(LP);
   new_line;
   Put_Line("Elementos despues de simplificar: " & Cuantos'img);

   new_line(2);

   Put_Line("Caso 14: lista de 2 elementos");
   LP:= vector_puntos_a_lista(Simplify, S_Ini14, S_Fin14);
   Put_Line("Lista:");
   Put("("); mostrar_puntos(LP); Put(")");
   new_line(2);
   Put_Line("Simplificada:");
   mostrar_puntos(vector_puntos_a_lista(Simplify, S_Ini14, S_Res14_len));
   new_line;
   Put_Line("Elementos despues de simplificar: " & S_Res14_len'img);
   Simplificar(LP, Cuantos);
   new_line;
   Put_Line("Lista resultante:");
   mostrar_puntos(LP);
   new_line;
   Put_Line("Elementos despues de simplificar: " & Cuantos'img);

   new_line(2);

   Put_Line("Caso 15: lista de 1 elementos");
   LP:= vector_puntos_a_lista(Simplify, S_Ini15, S_Fin15);
   Put_Line("Lista:");
   Put("("); mostrar_puntos(LP); Put(")");
   new_line(2);
   Put_Line("Simplificada:");
   mostrar_puntos(vector_puntos_a_lista(S_Res15, S_Ini15, S_Res15_len));
   new_line;
   Put_Line("Elementos despues de simplificar: " & S_Res15_len'img);
   Simplificar(LP, Cuantos);
   new_line;
   Put_Line("Lista resultante:");
   mostrar_puntos(LP);
   new_line;
   Put_Line("Elementos despues de simplificar: " & Cuantos'img);


   -------------------------
   -- Crear_Arbol_Binario --
   -------------------------
   new_line(3);
   Put_Line("*** Crear_Arbol_Binario ***");
   new_line;

   Put_Line("Caso 1: ejemplo");
   arbol := null;
   Put("Crear arbol binario de la lista ("); mostrar_vector_enteros(Arbol1_L1, Arbol1_Ini1, Arbol1_Fin1); Put(")");
   new_line;
   Put_Line("Si se devuelve TRUE, el arbol ha sido construido correctamente");
   Crear_Arbol_Binario(Arbol1_copia, Arbol);
   Put_Line(eval_crear_arbol_binario(Arbol, Arbol1_L2)'img);

   new_line;

   Put_Line("Caso 2: balanceado");
   arbol := null;
   Put("Crear arbol binario de la lista ("); mostrar_vector_enteros(Arbol2_L1, Arbol2_Ini1, Arbol2_Fin1); Put(")");
   new_line;
   Put_Line("Si se devuelve TRUE, el arbol ha sido construido correctamente");
   Crear_Arbol_Binario(Arbol2_copia, Arbol);
   Put_Line(eval_crear_arbol_binario(Arbol, Arbol2_L2)'img);

   new_line;

   Put_Line("Caso 3: ordenado ascendentemente");
   arbol := null;
   Put("Crear arbol binario de la lista ("); mostrar_vector_enteros(Arbol3_L1, Arbol3_Ini1, Arbol3_Fin1, 2); Put(")");
   new_line;
   Put_Line("Si se devuelve TRUE, el arbol ha sido construido correctamente");
   Crear_Arbol_Binario(Arbol3_copia, Arbol);
   Put_Line(eval_crear_arbol_binario(Arbol, Arbol3_L2)'img);

   new_line;

   Put_Line("Caso 4: ordenado descendentemente");
   arbol := null;
   Put("Crear arbol binario de la lista ("); mostrar_vector_enteros(Arbol4_L1, Arbol4_Ini1, Arbol4_Fin1, 2); Put(")");
   new_line;
   Put_Line("Si se devuelve TRUE, el arbol ha sido construido correctamente");
   Crear_Arbol_Binario(Arbol4_copia, Arbol);
   Put_Line(eval_crear_arbol_binario(Arbol, Arbol4_L2)'img);

   new_line;

   Put_Line("Caso 5: lista de un unico elemento");
   arbol := null;
   Put("Crear arbol binario de la lista ("); mostrar_vector_enteros(Arbol5_copia, Arbol5_copia'first, Arbol5_copia'last); Put(")");
   new_line;
   Put_Line("Si se devuelve TRUE, el arbol ha sido construido correctamente");
   Crear_Arbol_Binario(Arbol5_copia, Arbol);
   Put_Line(eval_crear_arbol_binario(Arbol, Arbol_un_valor)'img);

   new_line;

   Put_Line("Caso 6: lista vacia");
   arbol := null;
   Put("Crear arbol binario de la lista ("); mostrar_vector_enteros(Vv, Vv'first, Vv'last); Put(")");
   new_line;
   Put_Line("Si se devuelve TRUE, el arbol ha sido construido correctamente");
   Crear_Arbol_Binario(Vv, Arbol);
   Put_Line(eval_crear_arbol_binario(Arbol, Arbol_vacio)'img);

END laboratorio09b_pruebas;