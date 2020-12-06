from segundos_a_horas_minutos_segundos_f import segundos_a_horas_minutos_segundos_f as conversion
segundos = int(input("Introduzca los segundos: "))
conversion = conversion(segundos)
print(str(segundos) + " segundos son: " + str(conversion[0]) + " horas, " + str(conversion[1]) + " minutos, " + str(conversion[2]) + " segundos.")