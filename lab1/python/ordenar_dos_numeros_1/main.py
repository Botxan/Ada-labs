from ordenar_dos_numeros_1 import ordenar_dos_numeros

num1 = int(input("Introduzca el primer número: "))
num2 = int(input("Introduzca el segundo número: "))

# numeros_ordenados[0] el menor, numeros_ordenador[1] el mayor
numeros_ordenados = ordenar_dos_numeros(num1, num2)

print(f'{numeros_ordenados[0]} <= {numeros_ordenados[1]}')