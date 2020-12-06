import data, time, os

# las orillas que pasaremos como argumento a la funcion cruzar()
orilla1 = data.sujetos
orilla2 = []

# marcador de pasos
pasos = 0

# variable que guarda la orilla en la que estamos en cada paso
orilla_actual = 1

# Funcion para cruzar el rio de una orilla a otra
# Parametros
    # pax1: primer pasajero
    # pax2: segundo pasajero. Por defecto null, porque no son necesarios 2 pasajeros
def cruzar(pax1: str, pax2: str = None):
    global orilla_actual # creamos orilla_actual como global para poder guardar la orilla en la que nos situamos
    
    # Condiciones:
    print("Orilla actual: " + str(orilla_actual))
    print(orilla1)
    print(orilla2)

    # Antes de cruzar:
    # El barco solo lo sabe utilizar el policia, el padre y la madre
    if (pax1 != "policia" and pax1 != "padre" and pax1 != "madre" and pax1 and
        pax2 != "policia" and pax2 != "padre" and pax2 != "madre" and pax2 != None):
        terminarPrograma(False, "En el barco tiene que estar el policía, el padre o la madre.")


    # Cruzamos los pasajeros:
    if (orilla_actual == 1):
        if (pax1 not in orilla1):
            terminarPrograma(False, "El pasajero " + pax1 + " no se encuentra en la orilla izquierda.")

        # Eliminarlos de la orilla 1 y añadirlos a la orilla 2
        orilla1.remove(pax1)
        orilla2.append(pax1)
        if (pax2 != None):
            if (pax2 not in orilla1):
                terminarPrograma(False, "El pasajero " + pax2 + " no se encuentra en la orilla izquierda.")
            orilla1.remove(pax2)
            orilla2.append(pax2)
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
        orilla_actual = 1 # nos situamos en la otra orilla

    # Despues de cruzar:
    # El ladron no puede quedarse con un miembro de la familia en una orilla sin el policia presente
    if ((len(orilla1) > 1) and ("ladron" in orilla1) and ("policia" not in orilla1) or
          (len(orilla2) > 1) and ("ladron" in orilla2) and ("policia" not in orilla2)):
        terminarPrograma(False, "El ladrón no puede quedarse con un miembro de la familia en la orilla sin el policía presente")
    
    # El padre no puede quedarse con las hijas en la orilla sin la madre presente
    elif (("padre" in orilla1 and "madre" not in orilla1 and ("hija1" in orilla1 or "hija2" in orilla1)) or
          ("padre" in orilla2 and "madre" not in orilla2 and ("hija1" in orilla2 or "hija2" in orilla2))):
        terminarPrograma(False, "El padre no se puede quedar con sus hijas en la orilla sin su madre presente")
    
    # La madre no puede quedarse con los hijos en la orilla sin el padre presente
    elif (("madre" in orilla1 and "padre" not in orilla1 and ("hijo1" in orilla1 or "hijo2" in orilla1)) or
          ("madre" in orilla2 and "padre" not in orilla2 and ("hijo1" in orilla2 or "hijo2" in orilla2))):
        terminarPrograma(False, "La madre no se puede quedar con sus hijas en la orilla sin su padre presente")

    visualizar(pax1, pax2)

    # Si todos los pasajeros estan en la orilla 2, fin del juego
    if(len(orilla2) == 8):
        terminarPrograma(True)
    
    time.sleep(1)


# Termina el programa y muestra al usuario si ha ganado o perdido
# Parametros:
    # resultado: determina si el usuario ha ganado (True) o perdido (False)
    # mensaje: texto adicional para informar al usuario acerca de su victoria/derrota
def terminarPrograma(resultado: bool, mensaje: str = None): 
    # limpiar la consola 
    os.system('cls' if os.name=='nt' else 'clear')
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
        print("Cruza " + pax1 + " sólo.")
    # mostrar el rio con los sujetos en sus respectivos lados
    print(', '.join(orilla1) + "|~~~~~~~~~~~~~~~~~~~~~~|" + ', '.join(orilla2))