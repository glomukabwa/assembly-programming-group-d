section .data
    num dd 55

    ; contains ADDRESS of num
    ptr dd num

section .text
    global _start

_start:
    mov eax, [ptr]

    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
