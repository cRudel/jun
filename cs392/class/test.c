#include <stdio.h>

int main(){

	char str[10] = "hello";
	printf("%lu\n", sizeof(str));
	str[5] = '\0';
	str[6] = 'o';
	for(int i=0; i< 10; i++)
		printf("%c\n", str[i]);
	printf("%lu\n", sizeof(str));

	return 0;
}
