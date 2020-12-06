def segundos_a_horas_minutos_segundos_f(segundos):
    h = int((segundos / 60) / 60)
    m = int((segundos / 60) % 60)
    s = int(segundos % 60)
    return h, m, s