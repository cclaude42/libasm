#include "../libasm.h"

int	main(void)
{
	char	*str1;
	char	*str2;
	int		ret;

	str1 = "hello";
	str2 = NULL;
	ret = ft_strcmp(str1, str2);
	printf("%d\n", ret);
	ret = strcmp(str1, str2);
	printf("%d\n", ret);
	return (0);
}
