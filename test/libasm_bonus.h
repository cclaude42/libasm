/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm_bonus.h                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cclaude <cclaude@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/01/22 17:51:44 by cclaude           #+#    #+#             */
/*   Updated: 2020/01/27 18:50:59 by cclaude          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <string.h>
#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>

# define RESET   "\033[0m"
# define RED     "\033[31m"
# define GREEN   "\033[32m"
# define BUFFER_SIZE 512

typedef struct	s_list
{
	void 			*data;
	struct s_list 	*next;
} 				t_list;

extern ssize_t	ft_read(int fildes, void *buf, size_t nbyte);
extern int		ft_strcmp(const char *s1, const char *s2);
extern char		*ft_strcpy(char *dst, const char *src);
extern size_t	ft_strlen(const char *s);
extern ssize_t	ft_write(int fildes, const void *buf, size_t nbyte);
extern char		*ft_strdup(const char *s1);
extern void		ft_cat(int fildes);
extern int		ft_list_size(t_list *lst);
extern int		ft_list_push_front(t_list **begin_list, void *data);
extern void		ft_list_sort(t_list **begin_list, int (*cmp)());
extern void		ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)());
extern int		ft_atoi_base(char *str, char *base);
