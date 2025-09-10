

section .data
    value1 db 5
    value2 db 7

section .text
    global _start

_start:
    mov al, [value1] 
    add al, [value2]  

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80
