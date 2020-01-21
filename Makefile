NAME = libasm.a

CC = nasm

CFLAGS = -f macho64

SRC = ft_read.s \
	ft_write.s \
	ft_strcmp.s \
	ft_strlen.s \
	ft_strcpy.s \
	ft_strdup.s \

OBJ = $(SRC:.s=.o)

all: $(NAME)

$(NAME): $(OBJ)
	@echo "\033[0;33mUpdating library..."
	ar rc $(NAME) $^
	ranlib $(NAME)
	@echo "\033[0m"

%.o: %.s
	@echo "\033[0;32mGenerating binary..."
	$(CC) $(CFLAGS) $<
	@echo "\033[0m"

clean:
	@echo "\033[0;31mCleaning..."
	rm -f $(OBJ)
	rm -rf a.out
	rm -rf */exec
	@echo "\033[0m"

fclean: clean
	@echo "\033[0;31mRemoving library..."
	rm -f $(NAME)
	@echo "\033[0m"

re: fclean all

test: re
	gcc -L. -lasm main.c && ./a.out

.PHONY: all re clean fclean test
