; nasm -f macho64 ft_strcmp.s && gcc -o exec main.c ft_strcmp.o && ./exec

section .data

section .text
	global _ft_strcmp

_ft_strcmp:
		mov		rax, -1				; i = -1
loop:	inc		rax					; i++
		mov		cl, byte [rdi+rax]	; cl = str1[i]
		mov		dl, byte [rsi+rax]	; dl = str2[i]
		cmp		cl, 0				; if cl == 0
		je		end				; then zero
		cmp		dl, 0				; if dl == 0
		je		end				; then zero
		cmp		cl, dl				; if cl == dl
    	je		loop				; then loop
		jmp		end

end:
	movsx	rax, cl			; return = str1[i] - str2[i]
	movsx	rdx, dl
	sub		rax, rdx
	ret
