
section .data
    ; define byte array
    array db 10, 20, 30, 40

section .text
    global _start

_start:

    mov bx, array          

    mov dl, [bx]

    mov dh, [bx+1]

    ; Exit program
    mov ax, 1
    xor bx, bx
    int 0x80
