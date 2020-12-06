FUNCTION edad_aparente(edad: in Positive) return Integer IS
   -- Pre: edad > 0. Siempre sera > 0 si ponemos edad de tipo Positive
   -- Post: (edad * 2) + 4 ---> La edad aparente
BEGIN
   return (edad * 2) + 4;
END edad_aparente;