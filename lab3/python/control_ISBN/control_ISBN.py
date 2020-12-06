import math

def control_ISBN(num: int):

    if int(math.log10(num) + 1) == 9:
        sumador = 0

        for i in range(9, 0, -1):
            print(i)
            sumador += num // (10 ** i - 1) * i

        sumador %= 11
        if (sumador == 10):
            digito_control = 'X'
        else:
            digito_control = chr(48 + sumador)

        return digito_control
    else:
        raise Exception("El número introducido no tiene 9 dígitos")