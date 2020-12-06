# Creo este programa porque es necesario para el ejercicio 11
def digito_control(codigo_cuenta):
    if len(codigo_cuenta) == 10:
        suma = 0
        for i in range(0, 10):
            suma += codigo_cuenta[i] * (2**(i+1) % 11)

        d_control = 11 - suma % 11
        if d_control == 10:
            d_control = 1
        elif d_control == 11:
            d_control = 0
        
        return d_control

    else:
        raise ValueError("El codigo de la cuenta tiene que estar formado por 10 dígitos")