With Ada.Text_IO;
Use Ada.Text_IO;

package body Laboratorio05 is

   ----------------
   -- Ultimo_Par --
   ----------------

   -- Ejercicio ok! Un par de cambios sin importancia
   procedure Ultimo_Par(V: in T_Vector10; Ultimo_Par: out Integer; Posicion: out Natural)is
      i: Integer := 10;
      encontrado: Boolean := False;
   begin
      Ultimo_Par := 0;
      Posicion:=0;
      loop
         exit when i=0 or encontrado;
         if V(I) rem 2 = 0 then
            Ultimo_Par := V(I);
            Posicion := I;
            Encontrado := True;
         else
            I:=I-1;
         end if;
      end loop;
   end Ultimo_Par;

   --------------------------
   -- multiplos_del_ultimo --
   --------------------------

   -- No se tenia en cuenta la opcion V(V'Last) = 0
   -- No se puede dividir entre 0
   function Multiplos_Del_Ultimo (V: in T_Vector10) return Positive is
      cont:Natural := 0;
   begin
      for I in V'range loop
         if V(V'Last) = 0 then
            if V(I) = 0 then
               cont := cont + 1;
            end if;
         elsif V(I) rem V(V'Last)=0 then
            Cont := Cont + 1;
         end if;
      end loop;
      return cont;
   end multiplos_del_ultimo;

   -------------------
   -- esta_ordenado --
   -------------------

   -- I solo incrementaba si el vector estaba siendo creciente o decreciente
   -- Si cambiamos de creciente a decreciente o viceversa, la i no aumentaba
   -- luego nos quedabamos en el bucle para siempre
   -- *Solucion: salir del bucle si ordenado = false

   -- No comprobar si es creciente (Vx<Vx+1) o disinto de decreciente (Vx>=Vx+1)
   -- Comprobar que es creciente (Vx<Vx+1) o decreciente (Vx>Vx+1)

   function Esta_Ordenado (V: in T_Vector10) return Boolean is
      ordenado: Boolean := True;
      I: Integer := 2;
   begin

      loop
         if V(1) < V(2) and V(I) > V(I+1) then
            ordenado := False;
         elsif V(1) > V(2) and V(I) < V(I+1) then
            ordenado := False;
         else
            I:=I+1;
         end if;
         exit when not ordenado or I = V'Last;
      end loop;
      return ordenado;
   end esta_ordenado;

   ---------------------
   -- Separar_digitos --
   ---------------------

   procedure Separar_digitos(Num: In Natural; V: out T_Vector10; impares: out Natural) is
      N: Integer := Num;
   begin
      impares := 0;
      for I in reverse V'range loop
         V(I):= N rem 10;
         if V(I) rem 2 = 1 then
            Impares := Impares + 1;
         end if;
         N := N / 10;
      end loop;
   end Separar_digitos;

   -----------------------
   -- binario_a_decimal --
   -----------------------

   -- La funcion multiplicaba por 2 ** (10-i) todos los numeros del vector, independientemente de si el valor de estos
   -- es 1 o 0
   -- * Solucion: sumar solo las multiplicaciones de aquellos valores del vector que sean 1
   function Binario_A_Decimal (V: in T_Vector10) return Natural is
      Resultado : Natural := 0;
   begin
      for I in reverse V'range loop
         resultado := resultado + V(I) * 2**(10-I);
      end loop;
      return resultado;
   end binario_a_decimal;

   -----------
   -- Rot13 --
   -----------

   -- Solo funcionaba para mayusculas
   -- *Solucion: a�adir el rango de las minusculas
   procedure Rot13 (Sin_Cifrar: in String; Cifrado: out String) is
   begin
      cifrado := Sin_cifrar;
      for I in Sin_Cifrar'range loop
         if Cifrado(I) in 'A'..'M' or Cifrado(I) in 'a'..'m' then
            Cifrado(I) := Character'Val(Character'Pos(Sin_Cifrar(I))+13);
         elsif Cifrado(I) in 'N'..'Z' or Cifrado(I) in 'n'..'z' then
            Cifrado(I) := Character'Val(Character'Pos(Sin_Cifrar(I))-13);
         else
            Cifrado(I) := Sin_Cifrar(I);
         end if;
      end loop;
   end Rot13;

   --------------------
   -- Digito_Control --
   --------------------

   function Digito_Control (Codigo_Cuenta: in T_Vector10) return Natural is
      Suma: Natural := 0;
      D_Control : Natural;
   begin
      for I in Codigo_Cuenta'range loop
         suma := suma + Codigo_cuenta(I)*(2**I rem 11);
      end loop;
      D_Control := 11 - Suma rem 11;
      if D_Control = 10 then
         D_Control := 1;
      elsif D_Control = 11 then
         D_Control := 0;
      end if;
      return D_control;
   end Digito_Control;

end Laboratorio05;
