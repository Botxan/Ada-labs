PROCEDURE km_hm_dam_m_p(m_in: in Positive; km: out Integer; hm: out Integer; dam: out Integer; m: out Integer) IS
   -- Pre: no es necesario, dado que el parametro m_in de tipo positive solo permite integers > 0
   -- Post:
      -- km := (m_in / 1000);
      -- hm := (m_in / 100) rem 10;
      -- dam := (m_in / 10) rem 10;
      -- m: m_in rem 10;
BEGIN
   -- Casos de prueba
   -- 39084 ----- Numero entero
   -- 1234.05 ----- Numero real (habria que cambiar el parametro m_in a tipo Float)

   km := m_in / 1000;
   hm := Integer(m_in / 100) rem 10;
   dam := Integer(m_in / 10) rem 10;
   m := m_in rem 10;
END km_hm_dam_m_p;