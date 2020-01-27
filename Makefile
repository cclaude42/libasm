NAME = libasm.a

NA = nasm

NFLAGS = -f macho64

SRC = ft_read.s \
	ft_write.s \
	ft_strcmp.s \
	ft_strlen.s \
	ft_strcpy.s \
	ft_strdup.s \

B_SRC = ft_cat_bonus.s \
		ft_list_size_bonus.s \
		ft_list_push_front_bonus.s \
		ft_list_sort_bonus.s \
		ft_list_remove_if_bonus.s \

OBJ = $(SRC:.s=.o)

B_OBJ = $(SRC:.s=.o) $(B_SRC:.s=.o)

all: $(NAME)

$(NAME): $(OBJ)
	@echo "\033[0;33mUpdating library..."
	ar rc $(NAME) $^
	ranlib $(NAME)
	@echo "\033[0m"

%.o: %.s
	@echo "\033[0;32mGenerating binary..."
	$(NA) $(NFLAGS) $<
	@echo "\033[0m"

clean:
	@echo "\033[0;31mCleaning..."
	rm -f $(B_OBJ)
	rm -f ./exec
	@echo "\033[0m"

fclean: clean
	@echo "\033[0;31mRemoving library..."
	rm -f $(NAME)
	@echo "\033[0m"

re: fclean all

bonus: $(B_OBJ)
	@echo "\033[0;33mUpdating library (with bonuses)..."
	ar rc $(NAME) $^
	ranlib $(NAME)
	@echo "\033[0m"

test: re
	@echo "\033[0;31mCleaning..."
	rm -f $(B_OBJ)
	rm -f ./exec
	@echo "\033[0m"
	@echo "\033[0;36mTesting : "
	gcc -L. -lasm -o exec main.c
	@echo "\033[0m"
	./exec

btest: $(B_OBJ)
	@echo "\033[0;33mUpdating library (with bonuses)..."
	ar rc $(NAME) $^
	ranlib $(NAME)
	@echo "\033[0m"
	@echo "\033[0;31mCleaning..."
	rm -f $(B_OBJ)
	rm -f ./exec
	@echo "\033[0m"
	@echo "\033[0;36mTesting : "
	gcc -L. -lasm -o exec main_bonus.c
	@echo "\033[0m"
	./exec

.PHONY: all re clean fclean test bonus
