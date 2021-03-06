with ada.Text_IO;
use ada.Text_IO;

with ada.Integer_Text_IO;
use ada.Integer_Text_IO;

with ada.Float_Text_IO;
use ada.Float_Text_IO;

with laboratorio08;
use laboratorio08;

with lab08_escenarios;
use lab08_escenarios;

procedure laboratorio08a_pruebas is

V1: T_vector_enteros (1..10);
V2: T_vector_enteros (-5..4);
V3, V4: T_vector_enteros(0..1);
Vv: T_vector_enteros(0..-1);
Comunes_r: natural;

N: T_Vector_Enteros (0..4);
N2: T_Vector_Enteros (0..2);
Clave: T_Vector_Enteros (1..5);
Num: T_Vector_Enteros(Clave'range);
Num_v: T_Vector_Enteros(Vv'range);

number: T_Vector_Enteros(6..8);
cl: T_Vector_Enteros(-5..2);
res: T_Vector_Enteros(cl'range);

Nn: integer;
L: T_Lista_Estatica;

R: T_Rascacielos;
Respuesta: boolean:= false;

Consumo_electrico: Float:= 0.0;
Consumo_gas: T_Consumo_Medio_Manos;
begin

   -------------
   -- Comunes --
   -------------

put_line("-   Comunes   -"); New_Line;
put_line("Caso estandar:");
put_line("(3, 4, 5, 6, 7, 8, 9, 10, 11, 12) y (9, 11, 13, 15, 17, 19, 21, 23, 25, 27); Comunes: 2");
V1:= (3, 4, 5, 6, 7, 8, 9, 10, 11, 12);
V2:= (9, 11, 13, 15, 17, 19, 21, 23, 25, 27);
Comunes_r:= Comunes(V1,V2);
put(Comunes_r); New_Line(2);

put_line("Caso negativo:");
put_line("(0,1,2,3,4,5,6,7,8,9) y (10,11,12,13,14,15,16,17,18,19); Comunes: 0");
V1:= (0,1,2,3,4,5,6,7,8,9);
V2:= (10,11,12,13,14,15,16,17,18,19);
Comunes_r:= Comunes(V1,V2);
put(Comunes_r); New_Line(2);

put_line("Caso estandar 2:");
put_line("(3, 4, 5, 6, 7, 8, 9, 10, 11, 12) y (4, 6, 9, 11, 13, 15, 17, 19, 21, 23); Comunes: 4");
V1:= (3, 4, 5, 6, 7, 8, 9, 10, 11, 12);
V2:= (4, 6, 9, 11, 13, 15, 17, 19, 21, 23);
Comunes_r:= Comunes(V1,V2);
put(Comunes_r); New_Line(2);

put_line("Caso minimo:");
put_line("(1,2) y (1,2); Comunes: 2");
V3:= (1,2);
V4:= (1,2);
Comunes_r:= Comunes(V3,V4);
put(Comunes_r); New_Line(2);

put_line("Caso vacio:");
put_line("() y (1,2); Comunes: 0");
V4:= (1,2);
Comunes_r:= Comunes(Vv,V4);
put(Comunes_r); New_Line(2);

   ---------------
   -- Encriptar --
   ---------------

put_line("-   Encriptar   -");
put_line("Caso estandar:");
put_line("N(8,7,5,3,9) y (2,4,1,5,3) y Resultado: (5,8,9,7,3)");
n:= (8,7,5,3,9);
clave:= (2,4,1,5,3);
encriptar(n,clave,num);
for i in num'range loop
   put(num(i), 13);
end loop; New_line(2);

put_line("Caso diferente medida:");
put_line("N(5,7,6)  y (2,4,1,5,3) y Resultado: (5,0,6,0,7)");
n2:= (5,7,6);
clave:= (2,4,1,5,3);
encriptar(n2,clave,num);
for i in num'range loop
   put(num(i));
end loop; New_line(2);

put_line("Caso diferente medida 2:");
put_line("N(5,7,6)  y (2,4,1,5,7,8,6,3) y Resultado: (0,0,6,0,0,7,0,5)");
number:= (5,7,6);
cl:= (2,4,1,5,7,8,6,3);
encriptar(number, cl, res);
for i in res'range loop
   put(res(i));
end loop; New_line(2);

put_line("Caso vacio:");
put_line("N()  y () y Resultado: ()");
encriptar(Vv,Vv,num_v);
for i in num_v'range loop
   put(num_v(i));
end loop; New_line(5);

   -----------------------
   -- Insertar_En_Medio --
   -----------------------

put_line("-   Insertar En Medio   -");
put_line("Caso estandar:");
put_line("L(4,5,3,6) N=9; Resultado: (4,5,9,3,6)");
L.Cont:= 4;
L.Dato(1..L.Cont):= (4,5,3,6);
Nn:= 9;
Insertar_En_Medio(L,Nn);
for i in 1..L.Cont loop
   put(L.Dato(i));
end loop; New_line(2);

put_line("Caso nulo:");
put_line("L(4,6,3) N=9; Resultado: (4,6,3)");
L.Cont:= 3;
L.Dato(1..L.Cont):= (4,6,3);
Nn:= 9;
Insertar_En_Medio(L,Nn);
for i in 1..L.Cont loop
   put(L.Dato(i));
end loop; New_line(2);

put_line("Caso vacio:");
put_line("L() N=9; Resultado: ()");
L.Cont:= 0;
L.Dato:= (others=>0);
Nn:= 9;
Insertar_En_Medio(L,Nn);
for i in 1..L.Cont loop
   put(L.Dato(i));
end loop; New_line(2);

put_line("Caso unico numero:");
put_line("L(4) N=9; Resultado: (4)");
L.Cont:= 1;
L.Dato(L.Cont):= (4);
Nn:= 9;
Insertar_En_Medio(L,Nn);
for i in 1..L.Cont loop
   put(L.Dato(i));
end loop; New_line(2);

put_line("Caso dos numeros:");
put_line("L(4,5) N=9; Resultado: (4,9,5)");
L.Cont:= 2;
L.Dato(1..L.Cont):= (4,5);
Nn:= 9;
Insertar_En_Medio(L,Nn);
for i in 1..L.Cont loop
   put(L.Dato(i));
end loop; New_line(5);

   -----------------------
   -- Borrar_Intermedio --
   -----------------------

put_line("-   Borrar Intermedio   -");
put_line("Caso estandar:");
put_line("L(4,5,9,3,6) Resultado: (4,5,3,6)");
L.Cont:= 5;
L.Dato(1..L.Cont):= (4,5,9,3,6);
Borrar_Intermedio(L);
for i in 1..L.Cont loop
   put(L.Dato(i));
end loop; New_line(2);

put_line("Caso estandar:");
put_line("L(4,5,9,3,6,5,4) Resultado: (4,5,9,6,5,4)");
L.Cont:= 7;
L.Dato(1..L.Cont):= (4,5,9,3,6,5,4);
Borrar_Intermedio(L);
for i in 1..L.Cont loop
   put(L.Dato(i));
end loop; New_line(2);

put_line("Caso nulo:");
put_line("L(4,5,3,6) Resultado: (4,5,3,6)");
L.Cont:= 4;
L.Dato(1..L.Cont):= (4,5,3,6);
Borrar_Intermedio(L);
for i in 1..L.Cont loop
   put(L.Dato(i));
end loop; New_line(2);

put_line("Caso cero elem:");
put_line("L() Resultado: ()");
L.Cont:= 0;
Borrar_Intermedio(L);
for i in 1..L.Cont loop
   put(L.Dato(i));
end loop; New_line(2);

   --------------------------------------
   -- Obtener_Num_Vecinos_por_Vivienda --
   --------------------------------------

put_line("-   Num Edificios Vecinos   -");
put_line("Caso 1:");
put_line("Si la respuesta es true, funciona:");
--for i in R1'range(1) loop
--   for j in R1'range(2) loop
--      put(R1(i,j),width=>4);
--   end loop;
--   New_line;
--end loop; New_Line(5);
Obtener_Num_Vecinos_por_Vivienda(C1,R);
put_line("RESPUESTA:");
--for i in R'range(1) loop
--  for j in R'range(2) loop
--      put(R(i,j),width=>4);
--   end loop;
--   New_line;
--end loop; New_Line(2);

if R1 = R then
   respuesta:= true;
end if;
put(boolean'image(respuesta)); respuesta:= false; New_Line(2);

put_line("Caso 2:");
put_line("Si la respuesta es true, funciona:");
Obtener_Num_Vecinos_por_Vivienda(C2,R);

if R2 = R then
   respuesta:= true;
end if;
put(boolean'image(respuesta)); respuesta:= false; New_Line(2);

put_line("Caso 3:");
put_line("Si la respuesta es true, funciona:");
Obtener_Num_Vecinos_por_Vivienda(C3,R);

if R3 = R then
   respuesta:= true;
end if;
put(boolean'image(respuesta)); respuesta:= false; New_Line(5);

   ----------------------
   -- Obtener_Consumos --
   ----------------------

put_line("-   Obtener_Consumos   -");
put_line("Caso 1:");
Obtener_Consumos(E1, Consumo_electrico, Consumo_gas);
put_line("Respuesta:");
put(Con_Ele_E1,0,3,0); New_Line;

for i in Cmm_Gas_E1'range loop
   put(Cmm_Gas_E1(i),0,3,0); put(" ");
end loop; New_Line(2);

put_line("Tu Resultado:");
put(Consumo_electrico,0,3,0); New_Line;

for i in Consumo_gas'range loop
   put(Consumo_gas(i),0,3,0); put(" ");
end loop; New_Line(2);

put_line("Caso 2:");
Obtener_Consumos(E2, Consumo_electrico, Consumo_gas);
put_line("Respuesta:");
put(Con_Ele_E2,0,3,0); New_Line;

for i in Cmm_Gas_E2'range loop
   put(Cmm_Gas_E2(i),0,3,0); put(" ");
end loop; New_Line(2);

put_line("Tu Resultado:");
put(Consumo_electrico,0,3,0); New_Line;

for i in Consumo_gas'range loop
   put(Consumo_gas(i),0,3,0); put(" ");
end loop; New_Line(2);

end laboratorio08a_pruebas;