num1 = int(input("Introduza el primer número: "))
num2 = int(input("Introduza el segundo número: "))
num3 = int(input("Introduza el tercer número: "))

assert num1 > 0
assert num2 > 0
assert num3 > 0

# Pasar el valor menor a num1 y pasar el valor mayor a num3

if (num1 > num2):
    num2 = num2 + num1
    num1 = num2 - num1
    num2 = num2 - num1

if (num1 > num3):
    num3 = num3 + num1
    num1 = num3 - num1
    num3 = num3 - num1

# Ahora el valor menor esta en num1

if (num2 > num3):
    num3 = num3 + num2
    num2 = num3 - num2
    num3 = num3 - num2

   # Ahora el valor mayor esta en num3

print(f'{num1} <= {num2} <= {num3}')