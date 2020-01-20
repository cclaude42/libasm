NAME = libasm.a

CC = nasm

CFLAGS = -f macho64

SRC = read/ft_read.s \
	write/ft_write.s \
	strcmp/ft_strcmp.s \
	strlen/ft_strlen.s \

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

.PHONY: all re clean fclean
