; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_cat_bonus.s                                     :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: cclaude <cclaude@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/01/22 14:26:33 by cclaude           #+#    #+#              ;
;    Updated: 2020/01/23 12:15:46 by cclaude          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; nasm -f macho64 ft_cat_bonus.s && gcc -o exec main.c ft_cat_bonus.o && ./exec

section .text
	extern _malloc
	extern _ft_read
	extern _ft_write
	global _ft_cat

_ft_cat:
	push	rdi			; save fd
	mov		rdi, 4096	; malloc = 4096
	call	_malloc		; call malloc
	pop		rdi			; fd = fd
	mov		rsi, rax	; buf = allocated space
	mov		rdx, 4095	; len = 4095
	call	_ft_read	; call read(fd, buf, 4095)
	mov		rdi, 1		; fd = 1
	mov		rdx, rax	; len = read return
	call	_ft_write	; call write(1, buf, ret)
	ret
