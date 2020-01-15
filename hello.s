; nasm -f macho64 hello.s && gcc -o exec main.c hello.o && ./exec

section .data

msg:    db      "Hello, world!", 10
.len:   equ     $ - msg


section .text
	global _hello

_hello:
    mov     rax, 0x2000004 ; write
    mov     rdi, 1 ; stdout
    lea     rsi, [rel msg]
    mov     rdx, msg.len
    syscall

    mov     rax, 0x2000001 ; exit
    mov     rdi, 0
    syscall
