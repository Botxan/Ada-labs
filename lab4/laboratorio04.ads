package Laboratorio04 is
   subtype T_Digito is Natural range 0..9;
   function Digito_I (Num, I: in Natural) return T_Digito;
   --pre: 1 <= I <= 9
   --post: resultado es el I-esimo digito de Num (comenzando por izda)

   procedure Digito_I (Num, I: in Natural; Dig_I: out T_Digito);
   --pre: 1 <= I <= 9
   --post: resultado es el I-esimo digito de Num (comenzando por dcha)

   function Contar_Digitos (Num : in Positive) return Natural;
   -- post: resultado es el número de dígitos de Num
   procedure Contar_Digitos (Num : in Positive; digitos: out Natural);
   -- post: digitos contiene el número de dígitos de Num

   procedure Iteracion_Kaprekar (Num: in Natural; resultado: out Natural);
   --post: resultado es el resultado de una iteración kaprekar

   function es_Capicua (Num: in Positive) return Boolean;
   --post: resultado = true <--> Num es Capicua

   function es_Omirp (Num: in Positive) return Boolean;
   --post: resultado = true <--> Num es Omirp

   function es_odioso (Num: in Positive) return Boolean;
   --post: resultado = true <--> Num es odioso

   procedure lleva_a_kaprekar;
   --Entrada: una secuencia de numeros terminada en 0
   --Salida: tantas líneas como numeros hay en la entrada con un
   --        valor booleeano y un entero Bi y Ei
   --post: Bi es true si el Entero de la posición i de la entrada
   --lleva a la constante de kaprekar en menos de 100 iteraciones
   --      Ei es el número de iteraciones que se tarda en llegar o 0

   procedure es_collatz(resultado: out Boolean);
   --Entrada: una secuencia de positivos terminada en -1
   --Post: Es_collatz = true <--> los positivos de la entrada son
   --      una secuencia de collatz (sin contar el -1).

   procedure pos_omirp (el_omirp:out Natural; Pos: out Natural);
   --Entrada: una secuencia de positivos
   --Pre: la secuencia termine en 0
   --Post: el_omirp contiene el primer omirp de la secuencia
   --      Pos es la posición en la secuencia del primer omirp

   procedure secuencia_odiosos (suma_odiosa: out Boolean);
   --Entrada: una secuencia de positivos
   --Pre: la secuencia termina en 0
   --Post: suma_odiosa = true <--> la suma de los 5 primeros impar
   --                          es odiosos es un numero odioso

end Laboratorio04;