#include "libasm_bonus.h"

int		list_size(t_list *lst)
{
	int		count;
	t_list	*tmp;

	tmp = lst;
	count = 0;
	while (tmp)
	{
		tmp = tmp->next;
		count++;
	}
	return (count);
}

void	list_add_back(t_list **alst, t_list *new)
{
	t_list	*tmp;

	if (!alst || !new)
		return ;
	if (*alst)
	{
		tmp = *alst;
		while (tmp->next)
			tmp = tmp->next;
		tmp->next = new;
	}
	else
		*alst = new;
}

t_list	*list_new(void *data)
{
	t_list		*lst;

	if (!(lst = malloc(sizeof(t_list))))
		return (NULL);
	lst->data = data;
	lst->next = NULL;
	return (lst);
}

int		list_size_test(int lst_num)
{
	t_list	*list;

	list = NULL;
	while (lst_num--)
		list_add_back(&list, list_new(&lst_num));
	if (list_size(list) == ft_list_size(list))
		printf("" GREEN "[OK] " RESET "");
	else
		printf("" RED "[KO] " RESET "");
	return (1);
}

int		main(void)
{
	/*
	** FT_LIST_SIZE
	*/
	printf("%-16s :  ", "ft_list_size.s");
	list_size_test(0);
	list_size_test(8);
	list_size_test(1);
	list_size_test(16);
	printf("\n\n");
}
