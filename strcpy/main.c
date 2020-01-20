#include "../libasm.h"

int	main(void)
{
	char	*str;
	char	*dst;

	str = "Hello";
	dst = malloc(6);
	dst = ft_strcpy(dst, str);
	printf("%s\n", dst);
	// dst = strcpy(dst, str);
	// printf("%s\n", dst);
	free(dst);
	return (0);
}
