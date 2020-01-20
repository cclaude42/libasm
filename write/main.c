#include "../libasm.h"

int	main(void)
{
	int		fd;
	char	*str;
	int		len;
	int		ret;

	fd = 1;
	str = "helo";
	len = 4;

	ret = ft_write(fd, str, len);
	printf("\n%d\n", ret);
	ret = write(fd, str, len);
	printf("\n%d\n", ret);
	return (0);
}
