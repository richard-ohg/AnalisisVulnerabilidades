#include<string.h>
void func(char* cadena){
	char buffer[128];
	strcpy(buffer,cadena);
	puts(buffer);
}
void main(int argc, char* argv[]){
	func(argv[1]);
}