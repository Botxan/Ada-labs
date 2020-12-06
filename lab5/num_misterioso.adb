WITH Ada.Text_IO, Ada.Integer_Text_IO;
USE Ada.Text_IO, Ada.Integer_Text_IO;

procedure Num_Misterioso (Num:out String) is

   function son_distintos(num: String) return Boolean IS
      son_distintos: Boolean;
   BEGIN

      for i in num'range loop
         for j in num'first..num'last loop
            if (i /= j) then
               Put_Line("i: " & i'img);
               Put_Line("j: " & j'img);
               new_line(3);
               if num(i) = num(j) then
                  return false;
               end if;
            end if;
         end loop;
         new_line(10);
      end loop;

      return true;

   END son_distintos;

begin
   -- comprobar que cada n digitos es divisible entre n
   -- a ver, que cojones estoy haciendo, estamos tontos o que
   for i in 381245679..999999999 loop
      Put_Line("Numero: " & i'img);
      if (i / 10**8 rem 1 = 0) and (i / 10**7 rem 2 = 0) and (i / 10** 6 rem 3 = 0) and (i / 10**5 rem 4 = 0) and (i / 10**4 rem 5 = 0) and (i / 10**3 rem 6 = 0) and (i / 10**2 rem 7 = 0) and (i / 10 rem 8 = 0) and i rem 10 = 0 then
         if son_distintos(i'img) then
            put("El numero en cuestion: " & i'img);
            num := i'img & '0';
         end if;
      end if;
   end loop;

end Num_Misterioso;