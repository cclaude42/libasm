; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_list_push_front_bonus.s                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: cclaude <cclaude@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/01/24 16:30:29 by cclaude           #+#    #+#              ;
;    Updated: 2020/01/24 19:05:07 by cclaude          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; nasm -f macho64 ft_list_push_front_bonus.s && gcc -o exec main.c ft_list_push_front_bonus.o && ./exec

section .text
	extern _malloc
	global _ft_list_push_front

_ft_list_push_front:
	push	rdi			; store list_start
	push	rsi			; store data
	mov		rdi, 16		; 1st = 16
	call	_malloc		; malloc(16)
	pop		rsi			;
	pop		rdi			;
	cmp		rax, 0		; if ret == NULL
	je		end			; then return
	mov		[rax], rsi	; lst = data
	mov		rcx, [rdi]	;
	mov		[rax+8], rcx; lst->next = list_start
	mov		[rdi], rax	; list_start = lst

end:
	ret
