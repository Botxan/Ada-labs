import data, time, os

orilla1 = data.sujetos
orilla2 = []

orilla_actual = 1

def cruzar(pax1: str, pax2: str = None):
    global orilla_actual

# Cruzamos los sujetos:
    if (orilla_actual == 1):
        if (pax1 not in orilla1):
            terminarPrograma(False, "El sujeto " + pax1 + " no se encuentra en la orilla izquierda.")
        # Eliminarlos de la orilla 1 y añadirlos a la orilla 2
        orilla1.remove(pax1)
        orilla2.append(pax1)
        if (pax2 != None):
            if (pax2 not in orilla1):
                terminarPrograma(False, "El sujeto " + pax2 + " no se encuentra en la orilla izquierda.")
            orilla1.remove(pax2)
            orilla2.append(pax2)

        if (("padre" in orilla1 and "madre" not in orilla1) and ("hija1" in orilla1 or "hija2" in orilla1)):
            terminarPrograma(False, "El padre no puede quedarse con las hijas.")
        
        if (("madre" in orilla1 and "padre" not in orilla1) and ("hijo2" in orilla1 or "hijo2" in orilla1)):
            terminarPrograma(False, "La madre no puede quedarse con los hijos.")

        orilla_actual = 2 # nos situamos en la otra orilla

    elif (orilla_actual == 2):
        if (pax1 not in orilla2):
            terminarPrograma(False, "El pasajero " + pax1 + " no se encuentra en la orilla derecha.")
        # Eliminarlos de la orilla 2 y añadirlos a la orilla 1
        orilla2.remove(pax1)
        orilla1.append(pax1)
        if (pax2 != None):
            if (pax2 not in orilla2):
                terminarPrograma(False, "El pasajero " + pax2 + " no se encuentra en la orilla derecha.")
            orilla2.remove(pax2)
            orilla1.append(pax2)

        if (("padre" in orilla2 and "madre" not in orilla2) and ("hija1" in orilla2 or "hija2" in orilla2)):
            terminarPrograma(False, "El padre no puede quedarse con las hijas.")
        
        if (("madre" in orilla2 and "padre" not in orilla2) and ("hijo2" in orilla2 or "hijo2" in orilla2)):
            terminarPrograma(False, "La madre no puede quedarse con los hijos.")
        
        orilla_actual = 1 # nos situamos en la otra orilla
    
    visualizar(pax1, pax2)

    # Si todos los pasajeros estan en la orilla 2, fin del juego
    if(len(orilla2) == 6):
        terminarPrograma(True)
    
    time.sleep(1)

def terminarPrograma(resultado: bool, mensaje: str = None):
    if (resultado):
        print("ENHORABUENA!")
    else:
        print("Regla violada: " + mensaje)

    exit()

# Muestra por consola el estado de los sujetos respecto al rio
def visualizar(pax1: str, pax2):
    # limpiar la consola
    os.system('cls' if os.name=='nt' else 'clear')
    # mostrar los pasajeros viajando
    if (pax2 != None):
        print("Cruzan: " + pax1 + " & " + pax2 + ".")
    else:
        print("Cruza " + pax1 + " sól@.")
    # mostrar el rio con los sujetos en sus respectivos lados
    print(', '.join(orilla1) + "|~~~~~~~~~~~~~~~~~~~~~~|" + ', '.join(orilla2))