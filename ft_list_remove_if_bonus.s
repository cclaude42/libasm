; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_list_remove_if_bonus.s                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: cclaude <cclaude@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/01/26 19:05:21 by cclaude           #+#    #+#              ;
;    Updated: 2020/01/26 19:21:03 by cclaude          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; nasm -f macho64 ft_list_remove_if_bonus.s && gcc -o exec main.c ft_list_remove_if_bonus.o && ./exec

section .text
	global _ft_list_remove_if

_ft_list_remove_if:
	mov		r12, rdi	; list_start ptr
	mov		rdi, [rdi]	; lst = *lst_start
loop:
	cmp		[rdi+8], 0	; if lst->next == NULL
	je		end			; then return
	push	rdi			;
	mov		rcx, rsi	; store *cmp
	mov		rsi, [rdi+8]; 2nd = lst->next
	mov		rsi, [rsi]	; 2nd = lst->next->data
	mov		rdi, [rdi]	; 1st = lst->data
	call	rdx			; *cmp(lst->data, lst->next->data)
	pop		rdi			;
	test	rax, rax	; if rax > 0
	jns		unsorted	; then unsorted
	jmp		sorted		; else sorted

unsorted:
	mov		r10, [rdi+8]; lst->next
	mov		r11, [r10+8]; lst->next->next
	mov		[r12], r10; before->next = next
	mov		[r10+8], rsi; next->next = lst
	mov		[rdi+8], r11; lst-> next = lst->next->next
sorted:
	mov		r12, [rdi+8]; before = lst
	mov		rdi, [rdi+8]; lst = lst->next
	jmp		loop		; loop

end:
	ret
