; nasm -f macho64 ft_strlen.s && gcc -o exec main.c ft_strlen.o && ./exec

section .data

section .text
	global _fstrlen

_fstrlen:
		mov		rax, -1				; i = -1
loop:	inc		rax					; i++
		mov		cl, byte [rdi+rax]	; cl = str[i]
		cmp		cl, 0				; if cl == \0
    	jne		loop				; then loop
		ret
