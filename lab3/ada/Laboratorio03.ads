package Laboratorio03 is
	type T_TRIANGULO is (NO_TRIANGULO, EQUILATERO, ISOSCELES, ESCALENO);
	function tipo_triangulo(A1,A2,A3: in Float) return T_TRIANGULO;
	--datos: A1, A2 y A3 son los ángulos (en gradosI de un triangulo
	--pre: 0.0 < A1, A2, A3 <180.0
	--post: NO_TRIANGULO <--> no suman 180;
	--      EQUILATERO   <--> si son iguales
	--      ISOSCELES    <--> si dos iguales
	--      ESCALENOS    <--> si todos distintos

	procedure Multiplos_de_tres_entre(N1,N2: in Integer; suma: out Natural);
	--pre: N1 < N2
	--post: Suma = suma de los múltiplos de tres entre N1 y N2
	--      cuenta = número de multiplos de tres entre N1 y N2 (opcional)

	procedure sin_blancos;
	--Entrada: una serie de caracteres
	--pre: la serie termina en '.'
	--Salida: una serie de caracteres
	--post: la serie de salida contiene los mismos caracteres
	--      que la entrada sin los espacios en blanco (incluido el punto)

	procedure pares_impares;
	--Entrada: una serie de enteros
	--pre: la serie termina en 0
	--Salida: dos enteros: pares impares
	--post: pares contiene cuantos pares hay en la serie (sin el 0)
	--      impares contiene la suma de los impares de la serie

	procedure secuencia_collatz(N: in Integer; longitud, suma: out integer);
	--pre: N>0
	--Salida: una serie de naturales
	--post: la serie son los elementos de la serie de collatz en 1 linea
	-- longitud = cuantos elementos de la serie que empieza en N
	-- suma = suma de los elementos de la serie que empieza en N

	function control_ISBN(num:In Integer) return character;
	--pre: num es un entero de 9 dígitos
	--post: resultado es el dígito de control de un ISBN con ese valor
	--Es el mismo programa cambia el formato de entrada de los datos
end Laboratorio03;

