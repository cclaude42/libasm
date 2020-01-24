; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_list_sort_bonus.s                               :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: cclaude <cclaude@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/01/24 18:46:15 by cclaude           #+#    #+#              ;
;    Updated: 2020/01/24 19:23:30 by cclaude          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; nasm -f macho64 ft_list_sort_bonus.s && gcc -o exec main.c ft_list_sort_bonus.o && ./exec

section .text
	global _ft_list_sort

_ft_list_sort:
loop:
	cmp		[rdi+8], 0	; if lst->next == NULL
	je		end			; then return
	push	rdi			;
	push	rsi			;
	mov		rcx, rsi	; store *cmp
	mov		rsi, [rdi+16]; 2nd = list->next->data
	mov		rdi, [rdi]	; 1st = list->data
	call	rcx			; *cmp(list->data, list->next->data)
	pop		rsi			;
	pop		rdi			;
	test	rax, rax	; if rax > 0
	jns		unsorted	; then unsorted
	jmp		sorted		; else sorted

unsorted:
	mov		r10, [rsi]	; tmp_a = list
	mov		r11, [rsi+8]; tmp_b = list->next
	mov		r12, [r11+8]; after = tmp_b->next
	mov		[r13+8], r11; before->next = tmp_b
	mov		[r11+8], r10; tmp_b->next = tmp_a
	mov		[r10+8], r12; tmp_a->next = after
	mov		[rsi], r11	; list = tmp_b

	jmp		loop		; loop

sorted:
	mov		rdi, [rdi+8]; lst = lst->next
	jmp		loop		; loop

end:
	ret
