#include<iostream>

using namespace std;

int edad_aparente(int edad){	
	return edad * 2 + 4;
}

int main(){
	cout << edad_aparente(35);
}
