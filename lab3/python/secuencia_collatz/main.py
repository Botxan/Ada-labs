from secuencia_collatz import secuencia_collatz

num = int(input("Introduce el primer número: "))

secuencia = secuencia_collatz(num)

print("La suma de todos los números de la secuencia es: " + str(int(secuencia[0])))
print("La cantidad de elementos en la sencuencia es: " + str(secuencia[1]))
