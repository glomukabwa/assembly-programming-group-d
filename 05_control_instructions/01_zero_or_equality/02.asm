; jne_jnz.asm
section .data
    msg_equal db "Gloria Mukabwa, Student No:167754",10,0
    len_equal equ $ - msg_equal
    msg_not_equal db "Gloria Mukabwa, Student No:167754",10,0
    len_not_equal equ $ - msg_not_equal

section .text
    global _start
_start:
    mov ax, 5
    mov bx, 3
    cmp ax, bx
    jne not_equal

    mov ecx, msg_equal
    mov edx, len_equal
    jmp print

not_equal:
    mov ecx, msg_not_equal
    mov edx, len_not_equal

print:
    mov eax,4
    mov ebx,1
    int 0x80

    ; Exit
    mov eax,1
    xor ebx,ebx
    int 0x80
