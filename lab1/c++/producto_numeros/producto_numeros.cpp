#include<iostream>

using namespace std;

int producto_numeros() {
	int num1, num2;
	
	cout << "Introduzca el primer numero: ";
	cin >> num1;
	
	cout << "Introduzca el segundo numero: ";
	cin >> num2;
	
	cout << "El resultado es: " << (num1 * num2);
}

int main() {
	producto_numeros();
}
