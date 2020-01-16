; nasm -f macho64 ft_strcmp.s && gcc -o exec main.c ft_strcmp.o && ./exec

section .data

section .text
	global _ft_strcmp

_ft_strcmp:
		mov		rax, -1				; i = -1
loop:	inc		rax					; i++
		mov		cl, byte [rdi+rax]	; cl = str1[i]
		mov		dl, byte [rsi+rax]	; dl = str2[i]
		cmp		cl, dl				; if cl == \0
    	je		loop				; then loop
		movsx	ax, cl			; return = str1[i] - str2[i]
		movsx	dx, dl
		sub		ax, dx
		ret
