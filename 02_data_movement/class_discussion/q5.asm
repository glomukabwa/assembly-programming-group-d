

section .data
    value1 db 5
    value2 db 7

section .text
    global _start

_start:
    mov al, [value1] ; will load 5 into al
    add al, [value2]  ; will add 7 to 7 which is in al and the new value will be 12

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80
