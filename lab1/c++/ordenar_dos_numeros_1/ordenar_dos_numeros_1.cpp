#include <iostream>

using namespace std;

void ordenar_dos_numeros(int num1, int num2, int &menor, int &mayor) {	

	if (num1 > 0 && num2 > 0) {
		if (num1 > num2) {
	        menor = num2;
	        mayor = num1;
    	} else {
    		menor = num1;
    		mayor = num2;
		}
	}
	
}

int main() {
	int num1 = 54;
	int num2 = 12;
	int menor, mayor;
	ordenar_dos_numeros(num1, num2, menor, mayor);
	cout << menor << " <= " << mayor;
	return 0;
}
