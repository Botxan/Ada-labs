#include <iostream>
#include <math.h>

using namespace std;

bool es_par(int num) {
	return remainder(num, 2) == 0 ? true : false;
}

int main() {
	int num1 = 4;
	int num2 = 27;
	
	// 1 == true, 0 == false
	cout << "Es par el numero " << num1 << "? " << es_par(num1) << endl;
	cout << "Es par el numero " << num2 << "? " << es_par(num2);
	
	return 0;
}

