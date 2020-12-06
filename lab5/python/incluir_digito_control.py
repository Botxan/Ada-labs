def incluir_digito_control(tarjeta):
    if len(tarjeta) == 16:
        suma = 0
        for i in range(0, 15):
            if tarjeta[i] % 2 == 0:
                suma += tarjeta[i]
            else:
                if tarjeta[i] < 5:
                    suma += 2 * tarjeta[i]
                else:
                    suma += 2 * tarjeta[i] - 9

        tarjeta[15] = 10 - suma % 10
        return tarjeta
    else:
        raise ValueError("La tarjeta debe de tener 16 dígitos.")

print(incluir_digito_control([1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6]))