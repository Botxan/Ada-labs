from digito_control import digito_control

def incluir_digitos_iban(pais: str, banco: int, sucursal: int, numero_cuenta: list):
    if len(pais) == 2 and len(str(banco)) == 4 and len(str(sucursal)) == 4 and len(numero_cuenta) == 10:
        c1_vec = [0, 0]
        
        for i in range(1, 5):
            c1_vec[i+1] = banco / 10**(4-i) % 10
            c1_vec[i+5] = banco / 10**(4-i) % 10

        c1 = digito_control(c1_vec)
        c2 = digito_control(numero_cuenta)

        arr_n_cuenta_str = [str(num) for num in numero_cuenta]
        n_cuenta_str = "".join(arr_n_cuenta_str)

        codigo_control = 98 - (int( str(banco) + str(sucursal) + str(n_cuenta_str) + "00" + str((ord(pais[0]) - 55)) + str((ord(pais[1]) - 55)) + "00" ) % 97)
        

    else:
        raise ValueError("El país debe de tener 2 caracteres. El banco y la sucursal son 2 numeros de 4 cifras, y el numero de cuenta una lista de 10 numeros.")

# Python no permite ceros a la izquierda
#incluir_digitos_iban("ES", 20.zfill, 19)
banco = 4875
sucursal = 3233
numero_cuenta = [1,2,3,4,5,6,7,8,9,0]
numero_cuenta_strs = [str(num) for num in numero_cuenta]
a_str = "".join(numero_cuenta_strs)
numeraco = int(str(banco) + str(sucursal) + str(a_str))
mod_97 = numeraco % 97
print(numeraco)
print(mod_97)
