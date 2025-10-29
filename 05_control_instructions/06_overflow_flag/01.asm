; JO → Jump if Overflow
section .data
    msg_ov db "Gloria Mukabwa, Student No:167754",10,0
    len_ov equ $ - msg_ov
    msg_noov db "Gloria Mukabwa, Student No:167754",10,0
    len_noov equ $ - msg_noov

section .text
    global _start
_start:
    mov ax,7FFFh
    add ax,1       ; causes signed overflow
    ; An overflow is when the result of an addition leads to a bigger number than the positions allocated
    ; Please note that we check the overflow in binary addition, not decimal or any other number format
    ; So for example, if you add 100 to 50, in decimal there is no overflow but in binary there is an overflow
    jo overflow

    mov ecx, msg_noov
    mov edx, len_noov
    jmp print

overflow:
    mov ecx, msg_ov
    mov edx, len_ov

print:
    mov eax,4
    mov ebx,1
    int 0x80

    mov eax,1
    xor ebx,ebx
    int 0x80
