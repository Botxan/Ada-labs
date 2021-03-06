with ada.Text_IO, ada.Float_Text_IO, ada.Integer_Text_IO;
use ada.Text_IO, ada.Float_Text_IO, ada.Integer_Text_IO;

package body Lab05_Extra is

   --------------------
   -- Num_Misterioso --
   --------------------

   procedure Num_Misterioso (Num:out String) is

      n: Natural := 123456789;

      -- Comprueba si el numero cumple las restricciones
      function cumple_las_restricciones(n: Integer) return Boolean is
      begin
         -- Comprobar que los digitos pares son pares y los digitos impares son impares
         if (((n / 10**8 rem 10) rem 2 = 1) and ((n / 10**7 rem 10) rem 2 = 0) and ((n / 10**6 rem 10) rem 2 = 1) and ((n / 10**5 rem 10) rem 2 = 0) and (n / 10**4 mod 10 = 5) and ((n / 10**3 rem 10) rem 2 = 0) and ((n / 10**2 rem 10) rem 2 = 1) and ((n / 10 rem 10) rem 2 = 0) and ((n rem 10) rem 2 = 1))
         -- Comprobar reglas de divisibilidad
         and ((n / 10**8 rem 10) rem 1 = 0) and ((n / 10**7 rem 10**2) rem 2 = 0) and ((n / 10**6 rem 10**3) rem 3 = 0) and ((n / 10**5 rem 10**4) rem 4 = 0) and ((n / 10**4 rem 10**5) rem 5 = 0) and ((n / 10**3 rem 10**6) rem 6 = 0) and ((n / 10**2 rem 10**7) rem 7 = 0) and ((n / 10 rem 10**8) rem 8 = 0) and (n rem 9 = 0)
         then
            return True;
         else
            return False;
         end if;
      end cumple_las_restricciones;


      -- Comprobar si todos los digitos son distintos
      function son_distintos(n: Natural) return Boolean is
      begin
         for i in 1..9 loop
            for j in 1..9 loop
               if (i /= j) and (n / 10**(i-1)) mod 10 = (n / 10**(j-1)) mod 10 then
                  return False;
               end if;
            end loop;
         end loop;
         return True;
      end son_distintos;
   begin
      loop
         n := n+1;
         exit when cumple_las_restricciones(n) and son_distintos(n);
      end loop;
      for i in num'range loop
         if i = 10 then
            num(i) := '0';
         else
            num(i) := Character'Val(((n / 10**(9-i)) mod 10) + 48);
         end if;
      end loop;
   end Num_Misterioso;

   ----------------------------
   -- Incluir_Digito_Control --
   ----------------------------

   procedure Incluir_Digito_Control (Tarjeta: in out T_Vector16) is
      suma: Natural := 0;
   begin
      for i in Tarjeta'First..Tarjeta'Last-1 loop
         new_line;
         if i rem 2 = 0 then
            suma := suma + Tarjeta(i);
         else
            if Tarjeta(i) < 5 then
               suma := suma + 2 * Tarjeta(i);
            else
               suma := suma + (2 * Tarjeta(i) - 9);
            end if;
         end if;
         new_line(3);
      end loop;
      Tarjeta(16) := 10 - suma rem 10;
   end Incluir_Digito_Control;

   -----------------
   -- Es_Correcta --
   -----------------

   function Es_Correcta(Tarjeta: in T_Vector16) return Boolean is
      suma: Natural := 0;
      es_correcta: Boolean;
   begin
      for i in Tarjeta'Range loop
         if i rem 2 = 0 then -- posicion es par
            suma := suma + Tarjeta(i);
         else
            if Tarjeta(i) < 5 then
               suma := suma + 2 * Tarjeta(i);
            else
               suma := suma + (2 * Tarjeta(i) - 9);
            end if;
         end if;
         new_line;
      end loop;
      if suma rem 10 = 0 then
         es_correcta := True;
      end if;
         return es_correcta;
   end Es_Correcta;

   --------------------------
   -- Incluir_Digitos_IBAN --
   --------------------------

   procedure Incluir_Digitos_IBAN (Pais: in String; BAnco, Sucursal: in Integer; Numero_Cuenta: in T_Vector10; IBAN: out STRING) is
      c1, c2: Natural;
      c1_vec: T_Vector10;
      rem_97: Natural := 0;
      codigo_control: Natural;
      i_cuenta: Natural := 0;
   begin
      -- Build c1
      c1_vec(1) := 0;
      c1_vec(2) := 0;
      for i in 1..4 loop
         c1_vec(i+2) := banco / 10**(4-i) mod 10;
         c1_vec(i+6) := sucursal / 10**(4-i) mod 10;
      end loop;

      c1 := digito_control(c1_vec);

      -- Build c2
      c2 := digito_control(numero_cuenta);

      -- rem97 banco
      for i in reverse 1..4 loop
         rem_97 := (rem_97 * 10 + (banco / (10 ** (i-1)) mod 10)) mod 97;
      end loop;

      -- rem97 sucursal
      for i in reverse 1..4 loop
          rem_97 := (rem_97 * 10 + (sucursal / (10 ** (i-1)) mod 10)) mod 97;
      end loop;

      -- rem97 digito de control 1
      rem_97 := (rem_97 * 10 + (c1)) mod 97;

      -- rem97 digito de control 2
      rem_97 := (rem_97 * 10 + (c2)) mod 97;

      -- rem97 numero de cuenta
      for i in numero_cuenta'range loop
         rem_97 := (rem_97 * 10 + numero_cuenta(i)) mod 97;
      end loop;

      -- rem97 digito pais 1
      rem_97 := (rem_97 * 10 + ((Character'Pos(pais(pais'first)) - 55))) mod 97;

      -- rem97 digito pais 2
      rem_97 := (rem_97 * 10 + ((Character'Pos(pais(pais'last)) - 55))) mod 97;

      -- rem97 ultimos 0's
      for i in 1..2 loop
         rem_97 := (rem_97 * 10) mod 97;
      end loop;

      codigo_control := 98 - rem_97;
      IBAN(Iban'First..Iban'First+4) := pais(pais'first) & pais(pais'last) & Character'Val(((codigo_control / 10) mod 10) + 48) & Character'Val((codigo_control mod 10) + 48) & ' ';

      IBAN(IBAN'first + 9) := ' ';

      for i in 1..4 loop
         iban(i+5) := Character'Val((banco / 10 ** (4-i) mod 10) + 48);
         iban(i+10) := Character'Val((sucursal / 10 ** (4-i) mod 10) + 48);
      end loop;

      iban(15) := ' ';
      iban(20) := ' ';
      iban(25) := ' ';
      iban(Iban'First + 15) := Character'Val((c1) + 48);
      iban(Iban'First + 16) := Character'Val((c2) + 48);

      for i in 1..10 loop
         if i >= 1 and i <= 2 then
            IBAN(17+i) := Character'Val((numero_cuenta(i)) + 48);
         elsif i >= 3 and i <= 6 then
            IBAN(18+i) := Character'Val((numero_cuenta(i)) + 48);
         elsif i >= 7 and i <= 10 then
            IBAN(19+i) := Character'Val((numero_cuenta(i)) + 48);
         end if;
      end loop;

      put(IBAN);
   end Incluir_Digitos_IBAN;

end Lab05_Extra;