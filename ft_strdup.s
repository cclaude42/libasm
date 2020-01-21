; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strdup.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: cclaude <cclaude@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/01/21 18:26:24 by cclaude           #+#    #+#              ;
;    Updated: 2020/01/21 18:26:25 by cclaude          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; nasm -f macho64 ft_strdup.s && gcc -o exec main.c ft_strdup.o && ./exec

section .text
	extern _malloc
	extern _ft_strlen
	extern _ft_strcpy
	global _ft_strdup

_ft_strdup:
		push	rdi
		call	_ft_strlen
		inc		rax
		mov		rdi, rax

		call	_malloc				; call malloc
		pop		rdi

		mov		rsi, rdi
		mov		rdi, rax
		call	_ft_strcpy
		ret
