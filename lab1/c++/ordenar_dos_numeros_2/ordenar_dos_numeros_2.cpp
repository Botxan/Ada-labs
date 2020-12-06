#include <iostream>

using namespace std;

void ordenar_dos_numeros() {
	int num1, num2;
	
	cout << "Introduzca el primer numero: ";
	cin >> num1;
	
	cout << "Introduzca el segundo numero: ";
	cin >> num2;
	
	if (num1 > 0 && num2 > 0) {
		if (num1 > num2) {
	        num1 = num1 + num2;
	        num2 = num1 - num2;
	        num1 = num1 - num2;
    	}
    	
    	cout << num1 << " <= " << num2; 
	}
	
}

int main() {

	ordenar_dos_numeros();

	return 0;

}
