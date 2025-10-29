; JG / JNLE → Jump if Greater
section .data
    msg_greater db "Gloria Mukabwa, Student No:167754",10,0
    len_greater equ $ - msg_greater
    msg_not_greater db "Gloria Mukabwa, Student No:167754",10,0
    len_not_greater equ $ - msg_not_greater

section .text
    global _start
_start:
    mov ax,7
    mov bx,3
    cmp ax,bx
    jg greater

    mov ecx, msg_not_greater
    mov edx, len_not_greater
    jmp print

greater:
    mov ecx, msg_greater
    mov edx, len_greater

print:
    mov eax,4
    mov ebx,1
    int 0x80

    mov eax,1
    xor ebx,ebx
    int 0x80
