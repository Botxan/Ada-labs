def ordenar_dos_numeros(num1, num2):
    assert num1 > 0
    assert num2 > 0
    
    if (num1 > num2):
        num1 = num1 + num2
        num2 = num1 - num2
        num1 = num1 - num2
    return num1, num2