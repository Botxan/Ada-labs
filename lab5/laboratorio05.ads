package Laboratorio05 is
   type T_Vector is array(Integer range <>) of Integer;
   subtype T_Vector10 is T_Vector(1..10);
   subtype T_Vector16 is T_Vector(1..16);

   procedure Ultimo_Par(V: in T_Vector10; Ultimo_Par: out Integer; Posicion: out Natural);
   --Pre: V tiene diez enteros
   --post: ultimo par = numero par de V que está en la posicion más alta de V (0 si no hay)
   --      posicion = posición de ultimo par en V (si está repetido, la más alta de ellas)

   function multiplos_del_ultimo(V: in T_Vector10) return Positive;
   --Pre: V tiene diez enteros
   --post: resultado = numero elementos de V que son múltiplos de V(10)

   function esta_ordenado(V: in T_Vector10) return Boolean;
   --Pre: V tiene diez enteros
   --post: resultado = true <--> V ordenado crecientemente o V ordenado decrecientemente

   procedure Separar_digitos (Num: In Natural; V: out T_Vector10; impares: out Natural);
   --post: V contiene los dígiros de Num (rellenando 0s a la izquierda hasta 10 digitos)
   --      impares contiente cuántos dígitos impares tiene Num

   function binario_a_decimal(V: in T_Vector10) return Natural;
   --Pre: V tiene diez bits
   --post: resultado = numero decimal que representan los 10 bits de V

   procedure Rot13 (Sin_Cifrar: in STRING; Cifrado: out STRING);
   --Pre: Sin_cifrar contiene una cadena de 10 caracteres
   --Post: resultado contiene la cadena de entrada cifrada con el algoritmo rot13.

   function Digito_Control(Codigo_Cuenta: in T_Vector10) return Natural;
   --Pre: codigo cuenta son los 10 digitos de una cuenta corriente
   --Post: resultado es el digito de control para la cuenta indicada
end Laboratorio05;
