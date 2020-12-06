import math as M

def areaEsferaF(radio):
    # primero calculamos el area del circulo
    area_circulo = 2 * M.pi * radio**2

    # luego el de la esfera
    return 4 * area_circulo