#include<iostream>

using namespace std;

void ordenar_tres_numeros() {
	int num1, num2, num3;
	
	cout << "Introduzca el primer numero: ";
	cin >> num1;
	
	cout << "Introduzca el segundo numero: ";
	cin >> num2;
	
	cout << "Introduzca el tercer numero: ";
	cin >> num3;
	
	if (num1 > 0 && num2 > 0 && num3 > 0) {
		
		// Pasar el valor menor a num1 y pasar el valor mayor a num3
		
		if (num1 > num2) {
		    num2 = num2 + num1;
		    num1 = num2 - num1;
		    num2 = num2 - num1;
		}
		
		if (num1 > num3) {
		    num3 = num3 + num1;
		    num1 = num3 - num1;
		    num3 = num3 - num1;
		}
		
		// Ahora el valor menor esta en num1
		
		if (num2 > num3) {
		    num3 = num3 + num2;
		    num2 = num3 - num2;
		    num3 = num3 - num2;
		}
		
		cout << num1 << " <= " << num2 << " <= " << num3;
					
	}
	
}

int main() {
	
	ordenar_tres_numeros();
	
	return 0;
}
