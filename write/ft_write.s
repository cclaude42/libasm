; nasm -f macho64 ft_write.s && gcc -o exec main.c ft_write.o && ./exec

section .data

section .text
	global _ft_write

_ft_write:
	test	rdi, rdi ;
	js		error ;
    mov     rax, 0x2000004	; write call
    syscall
	ret
error:
	mov		rax, -1
	ret
