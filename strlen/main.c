#include <stdio.h>
#include <string.h>

extern size_t ft_strlen(const char *s);

int	main(void)
{
	char	*str;
	int		ret;

	str = NULL;

	ret = ft_strlen(str);
	printf("%d\n", ret);
	ret = strlen(str);
	printf("%d\n", ret);
	return (0);
}
