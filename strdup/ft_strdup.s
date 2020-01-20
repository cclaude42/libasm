; nasm -f macho64 ft_strdup.s && gcc -o exec main.c ft_strdup.o && ./exec

section .data

section .text
	global _ft_strdup

_ft_strdup:
		mov		rsi, rdi			; rsi = str
		mov		rax, -1				; i = -1
len:	inc		rax					; i++
		mov		cl, byte [rsi+rax]	; cl = str[i]
		cmp		cl, 0				; if cl == \0
		jne		len					; then next char
		mov		rdi, rax			; rdi = len

		extern _malloc
		call	_malloc				; call malloc
		mov		rdi, rax			; dst = malloc return
		mov		rax, -1				; i = -1
copy:	inc		rax					; i++
		mov		cl, byte [rsi+rax]	; cl = str[i]
		mov		byte [rdi+rax], cl	; dst[i] = cl
		cmp		cl, 0				; if cl == 0
		jne		copy				; then copy again
		mov		rax, rdi			; ret = dst
		ret
