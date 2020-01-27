; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_list_sort_bonus.s                               :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: cclaude <cclaude@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/01/24 18:46:15 by cclaude           #+#    #+#              ;
;    Updated: 2020/01/27 11:38:11 by cclaude          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; nasm -f macho64 ft_list_sort_bonus.s && gcc -o exec main.c ft_list_sort_bonus.o && ./exec

section .text
	global _ft_list_sort

_ft_list_sort:
	mov		r13, [rdi]	; r13 = *begin_list
	mov		rdi, [rdi]	; lst = *begin_list

loop:
	mov		r10, [rdi+8]; r10 = lst->next
	cmp		r10, 0		; if lst->next == NULL
	je		end			; then return
	push	rdi			;
	push	rsi			;
	mov		rcx, rsi	; store *cmp
	mov		rsi, [rdi+8]; 2nd = lst->next
	mov		rsi, [rsi]	; 2nd = lst->next->data
	mov		rdi, [rdi]	; 1st = lst->data
	call	rcx			; *cmp(lst->data, lst->next->data)
	pop		rsi			;
	pop		rdi			;
	cmp		rax, 0		; if rax > 0
	jg		unsorted	; then unsorted
	jmp		sorted		; else sorted

unsorted:
	mov		r11, [r10]	; r11 = lst->next->data
	mov		r12, [rdi]	; r12 = lst->data
	mov		[rdi], r11	; lst->data = lst->next->data
	mov		[r10], r12	; lst->next->data = lst->data
	mov		rdi, r13	; return to beginning of list
	jmp		loop		; loop

sorted:
	mov		rdi, [rdi+8]; lst = lst->next
	jmp		loop		; loop

end:
	ret
