; nasm -f macho64 ft_strlen.s && gcc -o exec main.c ft_strlen.o && ./exec

section .data

msg:    db      "Hello, world!", 10
.len:   equ     $ - msg


section .text
	global _fstrlen

_fstrlen:
	mov		rbx, rdi
    mov     rax, 0x2000004 ; write
    mov     rdi, 1 ; stdout
    lea     rsi, [rel msg]
    mov     rdx, rbx
    syscall

    mov     rax, 0x2000001 ; exit
    mov     rdi, 0
    syscall
