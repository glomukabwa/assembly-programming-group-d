; JO → Jump if Overflow
section .data
    msg_ov db "Overflow occurred (OF=1)",10,0
    msg_noov db "No overflow (OF=0)",10,0

section .text
    global _start
_start:
    mov ax,7FFFh
    add ax,1       ; causes signed overflow
    jo overflow

    mov ecx, msg_noov
    jmp print

overflow:
    mov ecx, msg_ov

print:
    mov eax,4
    mov ebx,1
    mov edx,40
    int 0x80

    mov eax,1
    xor ebx,ebx
    int 0x80
