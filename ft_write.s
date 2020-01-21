; nasm -f macho64 ft_write.s && gcc -o exec main.c ft_write.o && ./exec

section .data

section .text
	global _ft_write

_ft_write:
	test	edi, edi	; if fd < 0
	js		error		; error

	test	esi, esi	; if ptr == NULL
	jz		error		; error

	test	edx, edx	; if len < 0
	js		error		; error

	push	rdx			; store len in stack
	mov		rdx, 0		; len = 0

	mov     rax, 0x2000004	; write call
	syscall					; write (fd, buf, 0)
	pop		rdx				; retrieve len from stack

	test	eax, eax		; if return != 0
	jne		error			; error

    mov     rax, 0x2000004	; write call
    syscall					; write (fd, buf, len)

	cmp		rax, 14			; if ret != 14
	jne		end				; end
	cmp		rdx, 14			; if len != 14
	jne		error			;
	ret

error:
	mov		rax, -1	; return = -1
	ret				;

end:
	ret
