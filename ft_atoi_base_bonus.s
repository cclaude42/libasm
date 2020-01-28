; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_atoi_base_bonus.s                               :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: cclaude <cclaude@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/01/27 17:08:04 by cclaude           #+#    #+#              ;
;    Updated: 2020/01/28 12:06:18 by cclaude          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; nasm -f macho64 ft_atoi_base_bonus.s && gcc -o exec main.c ft_atoi_base_bonus.o && ./exec

section .text
	extern _ft_strlen
	global _ft_atoi_base

_ft_atoi_base:
	push	rdi
	push	rsi
	mov		rdi, rsi	; 1st = base
	call	check_base	; call strlen
	pop		rsi
	pop		rdi
	mov		r11, 0		; nbr = 0
	mov		r12, 1		; sign = 1
	cmp		rax, 0		; if ret == 0
	je		end			; then end
	push	rdi
	push	rsi
	mov		rdi, rsi	; 1st = base
	call	_ft_strlen	; call strlen
	pop		rsi
	pop		rdi
	cmp		rax, 2		; if ret < 2
	jl		end			; then end
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
	mov		dl, byte[rdi]; dl = str[0]
	push	rdi
	push	rsi
	mov		dil, dl		; 1st = str[0]
	call	in_str		; in_str(str[0], base)
	pop		rsi
	pop		rdi
	cmp		rax, 0		; if (ret < 0)
	jl		end			; then end
	imul	r11, r10	; nbr *= baselen
	add		r11, rax	; nbr += index
	inc		rdi			; str++
	jmp		loop		; loop

sign:
	imul	r12, -1		;
	jmp		skipsign	;

end:
	imul	r11, r12	; nbr * sign
	mov		rax, r11	; return (nbr)
	ret


in_str:
	mov		rax, -1		; i = -1
index:
	inc		rax			; i++
	mov		dl, byte[rsi+rax]; dl = str[i]
	cmp		dl, 0		; if (str[i] == '\0')
	je		error		; then return (-1)
	cmp		dl, dil		; if (str[i] == c)
	je		stop		; then return (i)
	jmp		index		; loop
stop:
	ret
error:
	mov		rax, -1
	ret

check_base:
	mov		rax, 0		; ret = 0
	mov		r11, 0		; i = 0
	mov		r12, 0		; j = 0
whilei:
	mov		sil, byte[rdi+r11]; sil = base[i]
	cmp		sil, 0		; if base[i] == '\0'
	je		donei		; then end while
	mov		r12, r11	; j =
	inc		r12			; i + 1
	cmp		sil, 43		; if base[j] == '+'
	je		done		; then return
	cmp		sil, 45		; if base[j] == '-'
	je		done		; then return
	cmp		sil, 33		; if base[j] < 33
	jl		done		; then return
	cmp		sil, 127		; if base[j] > 127
	jg		done		; then return
whilej:
	mov		dl, byte[rdi+r12]; dl = base[j]
	cmp		dl, 0		; if base[j] == '\0'
	je		donej		; then end while
	cmp		sil, dl		; if base[i] == base[j]
	je		done		;
	inc		r12			; j++
	jmp		whilej		; while loop
donej:
	inc		r11			; i++
	jmp		whilei		; while loop
donei:
	mov		rax, 1		; valid, ret = 1
done:
	ret
