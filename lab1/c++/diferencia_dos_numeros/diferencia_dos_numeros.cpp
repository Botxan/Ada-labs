#include <iostream> //importar biblioteca para inputs y outputs

using namespace std;

int diferencia_dos_numeros(int num1, int num2) {		
	int resultado;
	
	if (num1 > num2) {
		resultado = num1 - num2;
	} else if (num2 > 1) {
		resultado = num2 - num1;
	} else {
		resultado = 0;
	}
	
	return resultado;

}

int main() {
	
	cout << diferencia_dos_numeros(2, 9);
	
}


