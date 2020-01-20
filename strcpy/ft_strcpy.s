; nasm -f macho64 ft_strcpy.s && gcc -o exec main.c ft_strcpy.o && ./exec

section .data

section .text
	global _ft_strcpy

_ft_strcpy:
		mov		rax, -1				; i = -1
loop:	inc		rax					; i++
		mov		cl, byte [rsi+rax]	; cl = str[i]
		mov		byte [rdi+rax], cl	; dst[i] = cl
		cmp		cl, 0				; if cl == 0
		je		end				; then zero
		jmp		loop

end:
	movsx	rax, cl			; return = str1[i] - str2[i]
	movsx	rdx, dl
	mov		rax, rdi
	ret
