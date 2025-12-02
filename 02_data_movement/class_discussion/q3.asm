section .data
    num dd 55

    ; contains ADDRESS of num
    ptr dd num ; If we did [num], it would contain its value but since it has no brackets, it means the address
               ; So here we are just loading the address of num in ptr. Notice we don't use mov for this bcz
               ; this is initialization of a variable but if it were in the instruction section, u'd have to
               ; use mov. See this in q4.asm

section .text
    global _start

_start:
    mov eax, [ptr] ; So this will move 55 to eax

    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
