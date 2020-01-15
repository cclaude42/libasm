; nasm -f macho64 ft_strlen.s && gcc -o exec main.c ft_strlen.o && ./exec

section .data

section .text
	global _fstrlen

_fstrlen:
	mov		rdx, rsi ; 1st argument
	mov		rsi, rdi ; 2nd argument
    mov     rdi, 1 ; stdout
    mov     rax, 0x2000004 ; write
    syscall

    mov     rax, 0x2000001 ; exit
    mov     rdi, 0
    syscall
