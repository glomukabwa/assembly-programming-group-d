; Write a Assembly assembly program that adds numbers from 15 to 25 using a loop.
section .data
    sum db 0

section .text
    global _start

_start:
    mov ecx, 15      ; counter = 15
    mov eax, 0       ; sum = 0

loop_start:
    add eax, ecx     ; sum += ecx
    inc ecx          ; ecx++
    cmp ecx, 26      ; stop at 25
    jne loop_start

    ; exit program
    mov ebx, eax     ; store sum in ebx for return value
    mov eax, 1       ; sys_exit
    int 0x80
