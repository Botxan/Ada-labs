from es_par import es_par

num = int(input("Introduzca un número: "))
if (es_par(num)):
    print('El número ', num, " es par")
else:
    print('El número ', num, " es impar")