#include "libasm_bonus.h"

int	main(void)
{
	int	fd;
	char	*line;
	int	ret;

	fd = open("file.txt", O_RDONLY);
	// printf("FD %d\n", fd);
	ret = ft_cat(fd);
	close(fd);
	return (0);
}
