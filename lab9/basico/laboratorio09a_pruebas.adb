WITH Ada.Text_IO, Ada.Integer_Text_IO, Laboratorio09a, lab09a_escenarios;
USE Ada.Text_IO, Ada.Integer_Text_IO, Laboratorio09a, lab09a_escenarios;

PROCEDURE laboratorio09a_pruebas IS
   L2342: constant T_Lista_Dinamica := --(2 3 4 2)
      new T_Nodo_Enteros'(2,
      new T_Nodo_Enteros'(3,
      new T_Nodo_Enteros'(4,
      new T_Nodo_Enteros'(2, null))));

   L_copia: T_Lista_Dinamica := new T_Nodo_Enteros;
   L_copia_2: T_Lista_Dinamica := new T_Nodo_Enteros;

   LP_copia: T_Lista_Puntos;
   cuantos: Integer;

   -- Listas de puntos
   -- LP10 -> LP1_res, 3 borrados
   -- LP11 -> LP4_res, 9 borrados
   -- LP12 -> LP5_res, 7 borrados
   -- LP13 -> LP13_res, 0 borrados
   -- LP0 -> LP0_res, 0 borrados
   LP10: T_Lista_Puntos :=
      new T_Nodo_Punto'((1.1, 1.1),
      new T_Nodo_Punto'((1.10001, 1.10001),
      new T_Nodo_Punto'((1.10002, 1.10002),
      new T_Nodo_Punto'((4.4, 4.4),
      new T_Nodo_Punto'((5.5, 5.5),
      new T_Nodo_Punto'((5.50001, 5.50001),
      new T_Nodo_Punto'((7.7, 7.7),
      new T_Nodo_Punto'((8.8, 8.8), null))))))));

   LP11: T_Lista_Puntos :=
      new T_Nodo_Punto'((1.99, 1.99),
      new T_Nodo_Punto'((1.99, 1.99),
      new T_Nodo_Punto'((1.99, 1.99),
      new T_Nodo_Punto'((1.99, 1.99),
      new T_Nodo_Punto'((1.99, 1.99),
      new T_Nodo_Punto'((1.99, 1.99),
      new T_Nodo_Punto'((1.99, 1.99),
      new T_Nodo_Punto'((1.99, 1.99),
      new T_Nodo_Punto'((1.99, 1.99),
      new T_Nodo_Punto'((1.99, 1.99),
      new T_Nodo_Punto'((1.99, 1.99), null)))))))))));

   LP12: T_Lista_Puntos :=
      new T_Nodo_Punto'((1.1111, 1.1111),
      new T_Nodo_Punto'((1.1110, 1.1110),
      new T_Nodo_Punto'((1.1112, 1.1112),
      new T_Nodo_Punto'((1.1111, 1.1111),
      new T_Nodo_Punto'((1.1110, 1.1110),
      new T_Nodo_Punto'((1.1112, 1.1112),
      new T_Nodo_Punto'((1.1111, 1.1111),
      new T_Nodo_Punto'((1.1110, 1.1110),
      new T_Nodo_Punto'((1.1112, 1.1112), null)))))))));

   LP13, LP13_Res: T_Lista_Puntos := new T_Nodo_Punto'((1.1111, 1.1111), null);

   LP0, LP0_Res: T_Lista_Puntos := null;

   -- Programa auxiliar para copiar objetos de tipo T_Lista_Dinamica
   FUNCTION copiar(L: T_Lista_Dinamica) return T_Lista_Dinamica IS
   BEGIN
      if L = null then
         return null;
      else
         return New T_Nodo_Enteros'(L.info, copiar(L.all.sig));
      end if;
   END copiar;

   -- Programa auxiliar para mostrar objetos T_Lista_Dinamica por consola
   procedure recorrer(L: T_Lista_Dinamica) IS
   BEGIN
      if L /= null then
         put(L.info);
         recorrer(L.sig);
      end if;
   END recorrer;

   -- Programa auxiliar para copiar objetos de tipo T_Lista_Puntos
   FUNCTION copiar_lista_puntos(LP: T_Lista_Puntos) return T_Lista_Puntos IS
   BEGIN
     if LP = null then
        return null;
     else
        return New T_Nodo_Punto'(LP.info, copiar_lista_puntos(LP.all.sig));
     end if;
   END copiar_lista_puntos;

   -- Programa axiliar que comprueba si el programa simplificar devuelve el resultado correcto
   FUNCTION eval_simplificar(LP, LP_correcta: in T_Lista_Puntos; cuantos, cuantos_correcto: in Integer) return Boolean IS
   BEGIN
      if LP = null and LP_correcta = null and cuantos = cuantos_correcto then
         return True;
      else
         if (LP /= null and LP_correcta /= null) and then LP.info = LP_correcta.info then
            return eval_simplificar(LP.all.sig, LP_correcta.all.sig, cuantos, cuantos_correcto);
         else
            return False;
         end if;
      end if;
   END eval_simplificar;

   procedure borrado (L: in out T_Lista_Dinamica; Num: Integer) is
      L2: T_Lista_Dinamica := L;
      borrado: Boolean := False;
   begin
      if L2 /= null then
         if L2.info = num then
            L := L.sig;
         else
            while (not borrado and L2 /= null) and then L2.sig /= null loop
               if L2.sig.info = num then
                  L2.sig := L2.sig.sig;
                  borrado := True;
               else
                  L2 := L2.sig;
               end if;
            end loop;

         end if;
      end if;
   end borrado;
BEGIN
   L_copia := copiar(L1234);
   borrado(L_copia, 4);
   recorrer(L_copia);
   new_line(2);
   ----------
   -- Esta --
   ----------
   Put_Line("*** Esta ***");
   new_line;

   Put_Line("Caso 1: numero por el medio.");
   Put_Line("Esta el numero 3 en la lista (1 2 3 4)? TRUE");
   Put_Line(esta(L1234, 3)'img);

   new_line(2);

   Put_Line("Caso 2: numero al principio.");
   Put_Line("Esta el numero 1 en la lista (1 2 3 4)? TRUE");
   Put_Line(esta(L1234, 1)'img);

   new_line(2);

   Put_Line("Caso 3: numero al final.");
   Put_Line("Esta el numero 4 en la lista (1 2 3 4)? TRUE");
   Put_Line(esta(L1234, 3)'img);

   new_line(2);

   Put_Line("Caso 4: numero no existe en la lista.");
   Put_Line("Esta el numero 27 en la lista (1 2 3 4)? FALSE");
   Put_Line(esta(L1234, 27)'img);

   new_line(2);

   Put_Line("Caso 5: lista vacia.");
   Put_Line("Esta el numero 8 en la lista ()? FALSE");
   Put_Line(esta(L0, 8)'img);

   new_line(2);

   Put_Line("Caso 6: lista con un unico nodo.");
   Put_Line("Esta el numero 1 en la lista (1)? TRUE");
   Put_Line(esta(L1, 1)'img);


   --------------
   -- Posicion --
   --------------
   new_line(3);
   Put_Line("*** Posicion ***");
   new_line;

   Put_Line("Caso 1: numero por el medio.");
   Put_Line("Posicion del numero 2 en el vector (1 2 3 4): 2");
   Put_Line(posicion(L1234, 2)'img);

   new_line(2);

   Put_Line("Caso 2: numero al principio.");
   Put_Line("Posicion del numero 1 en la lista (1 2 3 4): 1");
   Put_Line(posicion(L1234, 1)'img);

   new_line(2);

   Put_Line("Caso 3: numero al final.");
   Put_Line("Posicion del numero 4 en la lista (1 2 3 4): 4");
   Put_Line(posicion(L1234, 4)'img);

   new_line(2);

   Put_Line("Caso 4: numero no existe en la lista.");
   Put_Line("Posicion del numero 27 en la lista (1 2 3 4)? Integer'Last");
   Put_Line(posicion(L1234, 27)'img);

   new_line(2);

   Put_Line("Caso 5: lista vacia.");
   Put_Line("Posicion del numero 8 en la lista (): Integer'Last");
   Put_Line(posicion(L0, 8)'img);

   new_line(2);

   Put_Line("Caso 6: lista con un unico nodo.");
   Put_Line("Posicion del numero 1 en la lista (1): 1");
   Put_Line(posicion(L1, 1)'img);

   new_line(2);

   Put_Line("Caso 6: lista con el entero repetido.");
   Put_Line("Posicion del numero 2 en la lista (2 3 4 2): 1");
   Put_Line(posicion(L2342, 2)'img);


   ----------------------
   -- Insertar_Delante --
   ----------------------
   new_line(3);
   Put_Line("*** Insertar_Delante ***");
   new_line;

   L_copia := copiar(L1234);
   Put_Line("Caso 1: una lista estandar");
   Put_Line("Anteponer el numero 5 a la lista (1 2 3 4)");
   Insertar_Delante(L_copia, 5);
   recorrer(L_copia);

   new_line(3);

   L_copia := copiar(L1);
   Put_Line("Caso 2: una lista con un unico nodo");
   Put_Line("Anteponer el numero 9 a la lista (1)");
   Insertar_Delante(L_copia, 9);
   recorrer(L_copia);

   new_line(3);

   L_copia := copiar(L0);
   Put_Line("Caso 3: una lista vacia");
   Put_Line("Anteponer el numero 7 a la lista ()");
   Insertar_Delante(L_copia, 7);
   recorrer(L_copia);


   ---------------------
   -- Insertar_Detras --
   ---------------------
   new_line(3);
   Put_Line("*** Insertar_Detras ***");
   new_line;

   L_copia := copiar(L1234);
   Put_Line("Caso 1: una lista estandar");
   Put_Line("Posponer el numero 5 a la lista (1 2 3 4)");
   Insertar_Detras(L_copia, 5);
   recorrer(L_copia);

   new_line(3);

   L_copia := copiar(L1);
   Put_Line("Caso 2: una lista con un unico nodo");
   Put_Line("Posponer el numero 9 a la lista (1)");
   Insertar_Detras(L_copia, 9);
   recorrer(L_copia);

   new_line(3);

   L_copia := copiar(L0);
   Put_Line("Caso 3: una lista vacia");
   Put_Line("Posponer el numero 7 a la lista ()");
   Insertar_Detras(L_copia, 7);
   recorrer(L_copia);


   ------------------------------
   -- Insertar_Elemento_En_Pos --
   ------------------------------
   new_line(3);
   Put_Line("*** Insertar_Elemento_En_Pos ***");
   new_line;

   L_copia := copiar(L1234);
   Put_Line("Caso 1: insertar en el medio");
   Put_Line("Insertar el numero 20 en la posicion 3 de la lista (1 2 3 4)");
   insertar_elemento_en_pos(L_copia, 20, 3);
   recorrer(L_copia);

   new_line(3);

   L_copia := copiar(L1234);
   Put_Line("Caso 2: insertar en el medio");
   Put_Line("Insertar el numero 30 en la posicion 3 de la lista (1 2 3 4)");
   insertar_elemento_en_pos(L_copia, 30, 3);
   recorrer(L_copia);

   new_line(3);

   L_copia := copiar(L1234);
   Put_Line("Caso 3: insertar al principio (primera posicion)");
   Put_Line("Insertar el numero 0 en la posicion 1 de la lista (1 2 3 4)");
   insertar_elemento_en_pos(L_copia, 0, 1);
   recorrer(L_copia);

   new_line(3);

   L_copia := copiar(L1234);
   Put_Line("Caso 4: insertar al principio (menor que primera posicion)");
   Put_Line("Insertar el numero 0 en la posicion -5000 de la lista (1 2 3 4)");
   insertar_elemento_en_pos(L_copia, 0, -5000);
   recorrer(L_copia);

   new_line(3);

   L_copia := copiar(L1234);
   Put_Line("Caso 5: insertar al final (posicion final)");
   Put_Line("Insertar el numero 5 en la posicion 5 de la lista (1 2 3 4)");
   insertar_elemento_en_pos(L_copia, 5, 5);
   recorrer(L_copia);

   new_line(3);

   L_copia := copiar(L1234);

   Put_Line("Caso 6: insertar al final (posicion mayor que final)");
   Put_Line("Insertar el numero 5 en la posicion 5000 de la lista (1 2 3 4)");
   insertar_elemento_en_pos(L_copia, 5, 5000);
   recorrer(L_copia);

   new_line(3);

   L_copia := copiar(L0);
   Put_Line("Caso 7: insertar en lista vacia");
   Put_Line("Insertar el numero 0 en la posicion 1 de la lista ()");
   insertar_elemento_en_pos(L_copia, 0, 1);
   recorrer(L_copia);

   new_line(3);

   L_copia := copiar(L0);
   Put_Line("Caso 8: insertar en lista vacia 2");
   Put_Line("Insertar el numero 2 en la posicion 10 de la lista ()");
   insertar_elemento_en_pos(L_copia, 2, 10);
   recorrer(L_copia);


   ------------
   -- Borrar --
   ------------
   new_line(3);
   Put_Line("*** Borrar ***");
   new_line;

   L_copia := copiar(L1234);
   Put_Line("Caso 1: borrar un elemento del medio");
   Put_Line("Eliminar el numero 3 de la lista (1 2 3 4). Resultado: (1 2 4)");
   borrar(L_copia, 3);
   recorrer(L_copia);

   new_line(3);

   L_copia := copiar(L1234);
   Put_Line("Caso 2: borrar primer elemento");
   Put_Line("Eliminar el numero 1 de la lista (1 2 3 4). Resultado: (2 3 4)");
   borrar(L_copia, 1);
   recorrer(L_copia);

   new_line(3);

   L_copia := copiar(L1234);
   Put_Line("Caso 3: borrar ultimo elemento");
   Put_Line("Eliminar el numero 4 de la lista (1 2 3 4). Resultado: (1 2 3)");
   borrar(L_copia, 4);
   recorrer(L_copia);

   new_line(3);

   L_copia := copiar(L1234);
   Put_Line("Caso 4: el numero no existe en la lista");
   Put_Line("Eliminar el numero 5 de la lista (1 2 3 4). Resultado: (1 2 3 4)");
   borrar(L_copia, 5);
   recorrer(L_copia);

   new_line(3);

   L_copia := copiar(L0);
   Put_Line("Caso 5: lista vacia");
   Put_Line("Eliminar el numero 1 de la lista (). Resultado: ()");
   borrar(L_copia, 1);
   recorrer(L_copia);


   ----------------
   -- Concatenar --
   ----------------
   new_line(3);
   Put_Line("*** Concatenar ***");
   new_line;

   L_copia := copiar(L1234);
   L_copia_2 := copiar(L1234);
   Put_Line("Caso 1: dos listas con al menos un nodo en cada una");
   Put_line("Concatenar las listas (1 2 3 4) y (1 2 3 4). Resultado: (1 2 3 4 1 2 3 4)");
   concatenar(L_copia, L_copia_2);
   recorrer(L_copia);

   new_line(3);

   L_copia := copiar(L0);
   L_copia_2 := copiar(L1234);
   Put_Line("Caso 2: primera lista vacia");
   Put_Line("Concatenar las listas () y (1 2 3 4). Resultado: (1 2 3 4)");
   concatenar(L_copia, L_copia_2);
   recorrer(L_copia);

   new_line(3);

   L_copia := copiar(L1234);
   L_copia_2 := copiar(L0);
   Put_Line("Caso 3: segunda lista vacia");
   Put_Line("Concatenar las listas (1 2 3 4) y (). Resultado: (1 2 3 4)");
   concatenar(L_copia, L_copia_2);
   recorrer(L_copia);

   new_line(3);

   L_copia := copiar(L0);
   L_copia_2 := copiar(L0);
   Put_Line("Caso 4: ambas listas vacias");
   Put_Line("Concatenar las listas (0) y (). Resultado: ()");
   concatenar(L_copia, L_copia_2);
   recorrer(L_copia);


   --------------
   -- Invertir --
   --------------
   new_line(3);
   Put_Line("*** Invertir ***");
   new_line;

   L_copia := copiar(L1234);
   Put_Line("Caso 1: lista con al menos un nodo");
   Put_Line("Invertir la lista (1 2 3 4). Resultado: (4 3 2 1)");
   invertir(L_copia);
   recorrer(L_copia);

   new_line(2);

   L_copia := copiar(L1);
   Put_Line("Caso 2: lista con un solo nodo");
   Put_Line("Invertir la lista (1). Resultado: (1)");
   invertir(L_copia);
   recorrer(L_copia);

   new_line(2);

   L_copia := copiar(L0);
   Put_Line("Caso 3: lista sin nodos");
   Put_Line("Invertir la lista (). Resultado: ()");
   invertir(L_copia);
   recorrer(L_copia);

   -----------------
   -- Simplificar --
   -----------------
   new_line(3);
   Put_Line("*** Simplificar ***");
   new_line;

   LP_copia := copiar_lista_puntos(LP10);
   Put_Line("Caso 1: No todos los puntos distan menos de 0.001");
   simplificar(LP_copia, cuantos);
   Put_Line("Si la salida es TRUE, el ejercicio es correcto");
   Put_Line(eval_simplificar(LP_copia, LP1_Res, cuantos, 5)'img);

   new_line(2);

   LP_copia := copiar_lista_puntos(LP11);
   Put_Line("Caso 2: Todos los puntos distan menos de 0.001");
   simplificar(LP_copia, cuantos);
   Put_Line("Si la salida es TRUE, el ejercicio es correcto");
   Put_Line(eval_simplificar(LP_copia, LP4_Res, cuantos, 2)'img);

   new_line(2);

   LP_copia := copiar_lista_puntos(LP12);
   Put_Line("Caso 3: Todos los puntos distan menos de 0.001. Algunos negativos.");
   simplificar(LP_copia, cuantos);
   Put_Line("Si la salida es TRUE, el ejercicio es correcto");
   Put_Line(eval_simplificar(LP_copia, LP5_Res, cuantos, 2)'img);

   new_line(2);

   LP_copia := copiar_lista_puntos(LP13);
   Put_Line("Caso 4: Lista de un solo punto");
   simplificar(LP_copia, cuantos);
   Put_Line("Si la salida es TRUE, el ejercicio es correcto");
   Put_Line(eval_simplificar(LP_copia, LP13_Res, cuantos, 1)'img);

   new_line(2);

   LP_copia := copiar_lista_puntos(LP0);
   Put_Line("Caso 5: Lista vacia");
   simplificar(LP_copia, cuantos);
   Put_Line("Si la salida es TRUE, el ejercicio es correcto");
   Put_Line(eval_simplificar(LP_copia, LP0_Res, cuantos, 0)'img);

END laboratorio09a_pruebas;