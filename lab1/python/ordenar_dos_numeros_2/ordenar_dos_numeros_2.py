num1 = int(input("Introduzca el primer número: "))
num2 = int(input("Introduzca el segundo número: "))

assert num1 > 0
assert num2 > 0

if (num1 > num2):
        num1 = num1 + num2
        num2 = num1 - num2
        num1 = num1 - num2

print(f'{num1} <= {num2}')