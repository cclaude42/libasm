#include <stdio.h>

extern void fstrlen(char *s, int size);

int	main(void)
{
	printf("In C program\n");
	fstrlen("Victory\n", 8);
	return (0);
}
