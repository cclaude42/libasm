#include "../libasm.h"

int	main(void)
{
	char	*str;
	char	*dst;

	str = "Hello";
	// dst = ft_strdup(str);
	// printf("%s\n", dst);
	dst = strdup(str);
	printf("%s\n", dst);
	free(dst);
	return (0);
}
