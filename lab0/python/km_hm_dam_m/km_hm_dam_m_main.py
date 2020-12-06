from km_hm_dam_m_f import m_a_km_hm_dam_m_f as conversor
m = int(input("Introduce una cantidad de metros: "))
convertido = conversor(m)
print(str(m) + "metros son: " + str(convertido[0]) + "km, " + str(convertido[1]) + "hm, " + str(convertido[2]), "dam y " + str(convertido[3]) + "m.")