; Write another Assembly program that adds numbers from 25 down to 15 using a
; decrementing loop (dec).
section .text
    global _start

_start:
    mov ecx, 25      ; start at 25
    mov eax, 0       ; sum = 0

loop_down:
    add eax, ecx
    dec ecx
    cmp ecx, 14      ; stop when below 15
    jne loop_down

    mov ebx, eax
    mov eax, 1
    int 0x80
