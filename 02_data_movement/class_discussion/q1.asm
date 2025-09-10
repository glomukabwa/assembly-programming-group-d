section .data
    num dd 1234

section .text
    global _start

_start:
    mov al, [num]

    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
