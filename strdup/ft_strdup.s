; nasm -f macho64 ft_strdup.s && gcc -o exec main.c ft_strdup.o && ./exec

section .text
	extern _ft_strlen
	extern _malloc
	global _ft_strdup

_ft_strdup:
		call	_ft_strlen
		inc		rax
		mov		rdi, rax
		ret

		call	_malloc				; call malloc
		mov		rax, 2
		ret
		mov		rax, 1
		ret
		mov		rdi, rax			; dst = malloc return
		mov		rax, -1				; i = -1
copy:	inc		rax					; i++
		mov		cl, byte [rsi+rax]	; cl = str[i]
		mov		byte [rdi+rax], cl	; dst[i] = cl
		cmp		cl, 0				; if cl == 0
		jne		copy				; then copy again
		mov		rax, rdi			; ret = dst
		ret
