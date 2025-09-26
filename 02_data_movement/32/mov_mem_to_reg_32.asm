; Move value from memory to register (32-bit)

section .data
    num dd 1234    ; define 32-bit integer

section .text
    global _start

_start:
    mov al, [num]  ; load value from memory into EAX

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80
