; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_cat_bonus.s                                     :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: cclaude <cclaude@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/01/22 14:26:33 by cclaude           #+#    #+#              ;
;    Updated: 2020/01/24 14:42:11 by cclaude          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; nasm -f macho64 ft_cat_bonus.s && gcc -o exec main.c ft_cat_bonus.o && ./exec

section .text
	extern _malloc
	extern _free
	extern _ft_read
	extern _ft_write
	global _ft_cat

_ft_cat:
	mov		r12, rdi	; store fd
loop:
	mov		rdi, r12	; reinit fd
	push	rdi			;
	mov		rdi, 4096	; 1st = 4096
	call	_malloc		; malloc(4096)
	pop		rdi			; 1st = fd
	mov		rsi, rax	; 2nd = buf ptr
	mov		rdx, 4095	; 3rd = 4095
	call	_ft_read	; read(fd, buf, 4095)
	mov		rdi, 1		; 1st = 1
	mov		rdx, rax	; 3rd = read return
	push	rdx			;
	push	rsi			;
	call	_ft_write	; write(1, buf, ret)
	pop		rsi			;
	pop		rdx			;
	mov		rdi, rsi	; 1st = buf ptr
	push	rdi			;
	push	rsi			;
	push	rdx			;
	call	_free		; free(buf)
	pop		rdx			;
	pop		rsi			;
	pop		rdi			;
	cmp		rdx, 4095	; if ret == 4095
	je		loop		; then loop
	ret
