#include <string.h>
#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>

extern ssize_t	ft_read(int fildes, void *buf, size_t nbyte);
extern int		ft_strcmp(const char *s1, const char *s2);
extern char		*ft_strcpy(char *dst, const char *src);
extern size_t	ft_strlen(const char *s);
extern ssize_t	ft_write(int fildes, const void *buf, size_t nbyte);
extern char		*ft_strdup(const char *s1);
