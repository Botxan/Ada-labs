def es_correcta(tarjeta):
    suma = 0
    for i in range(0, 16):
        if (i+1) % 2 == 0:
            suma += tarjeta[i]
        else:
            if tarjeta[i] < 5:
                suma += 2 * tarjeta[i]
            else:
                suma += 2 * tarjeta[i] - 9
    if suma % 10 == 0:
        es_correcta = True
    else:
        es_correcta = False

    return es_correcta

print(es_correcta([5,1,4,9,1,0,7,6,6,9,5,5,2,2,3,8]))