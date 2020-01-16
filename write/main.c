#include <stdio.h>
#include <unistd.h>

extern ssize_t ft_write(int fildes, const void *buf, size_t nbyte);

int	main(void)
{
	int		fd;
	char	*str;
	int		len;
	int		ret;

	fd = 1;
	str = "helo";
	len = 40976;

	ret = ft_write(fd, str, len);
	printf("\n%d\n", ret);
	ret = write(fd, str, len);
	printf("\n%d\n", ret);
	return (0);
}
