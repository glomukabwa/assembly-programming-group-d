; JNC → Jump if No Carry
section .data
    msg_carry db "Gloria Mukabwa, Student No:167754",10,0
    len_carry equ $ - msg_carry
    msg_nocarry db "Gloria Mukabwa, Student No:167754",10,0
    len_nocarry equ $ - msg_nocarry

section .text
    global _start
_start:
    mov ax,5
    add ax,2       ; no carry
    jnc nocarry

    mov ecx, msg_carry
    mov edx, len_carry
    jmp print

nocarry:
    mov ecx, msg_nocarry
    mov edx, len_nocarry

print:
    mov eax,4
    mov ebx,1
    int 0x80

    mov eax,1
    xor ebx,ebx
    int 0x80
