#include "libasm.h"

int	main(int ac, char **av)
{
	char	*str;
	char	*dst;
	int		len;
	void	*ptr;

	str = "Hello";
	dst = ft_strdup(str);
	// printf("%d\n", len);
	printf("%s\n", dst);
	// dst = strdup(str);
	// printf("%s\n", dst);
	// free(dst);
	return (0);
}
