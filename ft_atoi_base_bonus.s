; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_atoi_base_bonus.s                               :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: cclaude <cclaude@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/01/27 17:08:04 by cclaude           #+#    #+#              ;
;    Updated: 2020/01/27 19:36:38 by cclaude          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; nasm -f macho64 ft_atoi_base_bonus.s && gcc -o exec main.c ft_atoi_base_bonus.o && ./exec

section .text
	extern _ft_strlen
	global _ft_atoi_base

_ft_atoi_base:
	mov		r11, 0		; nbr = 0
	mov		r12, 1		; sign = 1
	push	rdi
	push	rsi
	mov		rdi, rsi	; 1st = base
	call	_ft_strlen	; call strlen
	pop		rsi
	pop		rdi
	mov		r10, rax	; baselen = strlen(base)
	dec		rdi			; str--

skipspace:
	inc		rdi			; str++
	mov		dl, byte[rdi]; dl = str[0]
	cmp		dl, 9		; if str[0] == '\t'
	je		skipspace	; then loop
	cmp		dl, 10		; if str[0] == '\n'
	je		skipspace	; then loop
	cmp		dl, 11		; if str[0] == '\r'
	je		skipspace	; then loop
	cmp		dl, 12		; if str[0] == 'v'
	je		skipspace	; then loop
	cmp		dl, 13		; if str[0] == '\f'
	je		skipspace	; then loop
	cmp		dl, 32		; if str[0] == ' '
	je		skipspace	; then loop
	dec		rdi			; str--
skipsign:
	inc		rdi			; str++
	mov		dl, byte[rdi]; dl = str[0]
	cmp		dl, 43		; if str[0] == '+'
	je		skipsign	; then loop
	cmp		dl, 45		; if str[0] == '-'
	je		sign		; then change sign and loop
loop:
	call	in_str		;
	cmp		rax, 0		; if (ret < 0)
	jl		end			; then end
	imul	r11, r10	; nbr *= baselen
	add		r11, rax	; nbr += index
	inc		rdi			; str++
	jmp		loop		; loop

end:
	imul	r11, r12	; nbr * sign
	mov		rax, r11	; return (nbr)
	ret

sign:
	imul	r12, -1		;
	jmp		skipsign	;

in_str:
	mov		rax, -1		;
	mov		dl, byte[rdi];
	cmp		dl, 0		;
	je		stop
	mov		rax, 2
stop:
	ret
