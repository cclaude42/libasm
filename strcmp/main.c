#include <stdio.h>
#include <string.h>

extern int ft_strcmp(const char *s1, const char *s2);

int	main(void)
{
	char	*str1;
	char	*str2;
	int		ret;

	str1 = "Hella";
	str2 = "Hello";
	ret = ft_strcmp(str1, str2);
	printf("%d\n", ret);
	ret = strcmp(str1, str2);
	printf("%d\n", ret);
	return (0);
}
