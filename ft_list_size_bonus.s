; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_list_size_bonus.s                               :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: cclaude <cclaude@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/01/24 16:03:58 by cclaude           #+#    #+#              ;
;    Updated: 2020/01/24 16:13:43 by cclaude          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; nasm -f macho64 ft_list_size_bonus.s && gcc -o exec main.c ft_list_size_bonus.o && ./exec

section .text
	global _ft_list_size

_ft_list_size:
	mov		rax, 0		; i = 0
loop:
	cmp		rdi, 0		; if lst == NULL
	je		end			; then return
	mov		rdi, [rdi+8]; lst = lst->next
	inc		rax			; i++
	jmp		loop		; loop til NULL

end:
	ret
