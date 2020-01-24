; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_list_push_front_bonus.s                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: cclaude <cclaude@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/01/24 16:30:29 by cclaude           #+#    #+#              ;
;    Updated: 2020/01/24 16:40:53 by cclaude          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; nasm -f macho64 ft_list_push_front_bonus.s && gcc -o exec main.c ft_list_push_front_bonus.o && ./exec

section .text
	extern _malloc
	global _ft_list_push_front

_ft_list_push_front:
	push	rsi			; store list_start
	push	rdi			; store data
	mov		rsi, 16		; 1st = 16
	call	_malloc		; malloc(16)
	pop		rdi			;
	pop		rsi			;
	cmp		rax, 0		; if ret == NULL
	je		end			; then return ;
	


end:
	ret
