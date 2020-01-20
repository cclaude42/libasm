#include "../libasm.h"

int	main(int ac, char **av)
{
	int		fd;
	int		len;
	int		ret;
	char	buffer[11];

	len = 10;
	fd = open("file.txt", O_RDONLY);

	if (av[1][0] == '1')
	{
		ret = ft_read(fd, buffer, len);
		printf("%s\n%d (Mine)\n", buffer, ret);
	}
	else if (av[1][0] == '0')
	{
		ret = read(fd, buffer, len);
		printf("%s\n%d (Real)\n", buffer, ret);
	}
	close(fd);
	return (0);
}
