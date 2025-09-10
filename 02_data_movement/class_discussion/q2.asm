section .data
    arr dd 10, 20, 30, 40

section .text
    global _start

_start:
    mov esi, 2
    mov eax, [arr + esi*4]

    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
