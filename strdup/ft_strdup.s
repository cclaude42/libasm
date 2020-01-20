; nasm -f macho64 ft_strdup.s && gcc -o exec main.c ft_strdup.o && ./exec

section .data

section .text
	global _ft_strdup

_ft_strdup:
		mov		rax, -1				; i = -1
len:	inc		rax					; i++
		mov		cl, byte [rdi+rax]	; cl = str[i]
		cmp		cl, 0				; if cl == \0
		jne		len					; then loop
		mov		

		call	_malloc				; call malloc
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
