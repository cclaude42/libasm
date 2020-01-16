; nasm -f macho64 ft_read.s && gcc -o exec main.c ft_read.o && ./exec 1 && ./exec 0

section .data

section .text
	global _ft_read

_ft_read:
	test	edi, edi	; if fd < 0
	js		error		; error

	test	esi, esi	; if ptr == NULL
	jz		error		; error

	test	edx, edx	; if len < 0
	js		error		; error

	push	rdx			; store len in stack
	mov		rdx, 0		; len = 0

	mov     rax, 0x2000003	; read call
	syscall					; read (fd, buf, 0)
	pop		rdx				; retrieve len from stack

	test	eax, eax		; if return != 0
	jne		error			; error

    mov     rax, 0x2000003	; read call
    syscall					; read (fd, buf, len)
	ret

error:
	mov		rax, -1	; return = -1
	ret				;
