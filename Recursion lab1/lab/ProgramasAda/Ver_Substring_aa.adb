WITH Ada.Text_Io; USE Ada.Text_Io;

procedure Ver_Substring_aa is
   -- salida: 11 booleanos
   -- post: corresponden a cada uno de los casos de pruebas diseñados.

   function Substring_aa(
         S : String)
     return Boolean is
   -- EJERCICIO 3- ESPECIFICA E IMPLEMENTA recursivamente el subprograma
   -- Substring_aa que decide si el string S contiene el substring 'aa'.
   BEGIN
      if S'Length < 2 then
         return false;
      elsif S(S'First..S'First+1) = "aa" then
         return true;
      else
         return Substring_aa(S(S'First+1..S'Last));
      end if;
   end Substring_aa;


begin
   Put_Line("-------------------------------------");
   Put("La palabra vacia no contiene el string 'aa': ");
   Put(Boolean'Image(Substring_aa("")));
   new_Line(3);
   Put_Line("-------------------------------------");
   Put_Line("Palabras de 1 caracter");
   Put("-- La palabra de 1 caracter 'a' no contiene el substring 'aa': ");
   Put(Boolean'Image(Substring_aa("a")));
   New_Line;
   Put("-- La palabra de 1 caracter 'b' no contiene el substring 'aa': ");
   Put(Boolean'Image(Substring_aa("b")));
   new_Line(3);
   Put_Line("-------------------------------------");
   Put_Line("Palabras de varios caracteres");
   Put("-- 'aaaa' contiene el substring 'aa': ");
   Put(Boolean'Image(Substring_aa("aaaa")));
   New_Line;
   Put("-- 'bbbb' no contiene el substring 'aa': ");
   Put(Boolean'Image(Substring_aa("bbbb")));
   New_Line;
   Put("-- 'abab' no contiene el substring 'aa': ");
   Put(Boolean'Image(Substring_aa("abab")));
   New_Line;
   Put("-- 'baba' no contiene el substring 'aa': ");
   Put(Boolean'Image(Substring_aa("baba")));
   New_Line;
   Put("-- 'abba' no contiene el substring 'aa': ");
   Put(Boolean'Image(Substring_aa("abba")));
   New_Line;
   Put("-- 'aabb' contiene el substring 'aa': ");
   Put(Boolean'Image(Substring_aa("aabb")));
   New_Line;
   Put("-- 'baab' contiene el substring 'aa': ");
   Put(Boolean'Image(Substring_aa("baab")));
   New_Line;
   Put("-- 'bbaa' contiene el substring 'aa': ");
   Put(Boolean'Image(Substring_aa("bbaa")));
   New_Line;
   Put_Line("-------------------------------------");
end Ver_Substring_aa;
