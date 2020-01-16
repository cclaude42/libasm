#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

extern ssize_t ft_read(int fildes, void *buf, size_t nbyte);

int	main(void)
{
	int		fd;
	char	*str1;
	char	*str2;
	int		len;
	int		ret;

	fd = open("file.txt", O_RDONLY);
	len = 11;

	ret = ft_read(fd, str1, len);
	printf("%s\n%d\n", str1, ret);
	ret = read(fd, str1, len);
	printf("%s\n%d\n", str1, ret);
	return (0);
}
