#include <stdio.h>

extern int fstrlen(char *s);

int	main(void)
{
	int	ret;

	ret = fstrlen("ijefowefowkemfowefnewofnwe");
	printf("%d\n", ret);
	return (0);
}
