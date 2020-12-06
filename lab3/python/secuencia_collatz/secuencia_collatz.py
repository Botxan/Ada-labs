def secuencia_collatz(num: int):
    longitud = 1
    suma = num

    while True:
        print(int(num))
        num = num / 2 if num % 2 == 0 else num * 3 + 1 
        longitud += 1
        suma += num
        if (num == 1):
            break
            
    print(int(num))

    return suma, longitud
        