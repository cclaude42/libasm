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

void	print_list(t_list *list)
{
	t_list	*tmp;

	tmp = list;
	while (tmp)
	{
		printf("%s\n", tmp->data);
		tmp = tmp->next;
	}
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

int		list_push_front_test(void *new)
{
	t_list	*list;

	list = NULL;
	list_add_back(&list, list_new("wtf"));
	list_add_back(&list, list_new("test"));
	ft_list_push_front(&list, new);
	if (!new && !list->data)
	{
		printf("" GREEN "[OK] " RESET "");
		return (0);
	}
	if (!strcmp(list->data, (char*)new))
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

	/*
	** FT_PUSH_FRONT
	*/
	printf("%-16s :  ", "ft_push_front.s");
	list_push_front_test(strdup("aie"));
	list_push_front_test(strdup(""));
	list_push_front_test(strdup("POULOULOU"));
	list_push_front_test(NULL);
	printf("\n\n");

	/*
	** FT_LIST_SORT
	*/
	printf("%-16s :  \n\n", "ft_list_sort.s");
	t_list	*list;

	list = NULL;
	list_add_back(&list, list_new("test"));
	list_add_back(&list, list_new("allo"));
	list_add_back(&list, list_new("what"));
	list_add_back(&list, list_new("ok"));
	list_add_back(&list, list_new("abed"));
	list_add_back(&list, list_new("one"));
	list_add_back(&list, list_new("zklo"));
	list_add_back(&list, list_new("zklo"));
	printf("before:\n");
	print_list(list);
	printf("\n");

	ft_list_remove_if(&list, "zklo", strcmp);

	printf("after:\n");
	print_list(list);
	printf("\n");
	list = NULL;
	list_add_back(&list, list_new(strdup("5")));
	list_add_back(&list, list_new(strdup("5")));
	list_add_back(&list, list_new(strdup("5")));
	list_add_back(&list, list_new(strdup("5")));
	list_add_back(&list, list_new(strdup("5")));
	list_add_back(&list, list_new(strdup("2")));
	list_add_back(&list, list_new(strdup("5")));
	list_add_back(&list, list_new(strdup("2")));
	list_add_back(&list, list_new(strdup("8")));
	list_add_back(&list, list_new(strdup("0")));
	list_add_back(&list, list_new(strdup("0")));
	list_add_back(&list, list_new(strdup("1")));
	printf("before:\n");
	print_list(list);
	printf("\n");

	ft_list_remove_if(&list, "5", strcmp);

	printf("after:\n");
	print_list(list);

	list = NULL;
	list_add_back(&list, list_new(strdup("5")));
	list_add_back(&list, list_new(strdup("0")));
	list_add_back(&list, list_new(strdup("2")));
	list_add_back(&list, list_new(strdup("5")));
	list_add_back(&list, list_new(strdup("8")));
	list_add_back(&list, list_new(strdup("7")));
	list_add_back(&list, list_new(strdup("4")));
}
