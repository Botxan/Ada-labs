PROCEDURE segundos_a_horas_minutos_segundos_p(seg_in: in Integer; h, min, seg: out Integer) IS
BEGIN
   h := (seg_in / 60 ) / 60;
   min := (seg_in / 60) rem 60;
   seg := seg_in rem 60;
END segundos_a_horas_minutos_segundos_p;