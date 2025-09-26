; simple loop

section .data
    str_msg db "Hello from LOOP!", 10
    len equ $ - str_msg

section .text
    global _start

_start:
    mov ecx, 5              ; loop counter

print_loop:
    mov eax, 4              
    mov ebx, 1              
    push ecx                ; save loop counter
    mov ecx, str_msg
    mov edx, len
    int 0x80
    pop ecx                 ; restore loop counter from stack

    loop print_loop          ; decrements ecx, jumps if not 0


    mov eax, 1
    xor ebx, ebx
    int 0x80
