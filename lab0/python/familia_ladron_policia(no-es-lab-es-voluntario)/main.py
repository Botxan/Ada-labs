from cruzar import cruzar
from data import sujetos 
# todos los miembros de la partida son importados desde data.sujetos:
# ["ladron", "policia", "padre", "madre", "hijo1", "hijo2", "hija1", "hija2"]

cruzar("ladron", "policia")
cruzar("policia")
cruzar("hijo1", "policia")
cruzar("ladron", "policia")
cruzar("padre", "hijo2")
cruzar("padre")
cruzar("padre", "madre")
cruzar("madre")
cruzar("ladron", "policia")
cruzar("padre")
cruzar("padre", "madre")
cruzar("madre")
cruzar("madre", "hija1")
cruzar("policia", "ladron")
cruzar("hija2", "policia")
cruzar("policia")
cruzar("policia", "ladron")