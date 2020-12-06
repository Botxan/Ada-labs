#include<iostream>
#include<math.h>

using namespace std;

float area_circulo(float radio) {
	
	if (radio > 0) {
		return M_PI * (pow(radio, 2));
	} else {
		throw "El radio tiene que ser mayor que 0";
	}
}

int main() {
	cout << area_circulo(8.377);
}
