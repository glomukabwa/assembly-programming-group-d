; JNC → Jump if No Carry
section .data
    msg_carry db "Carry occurred (CF=1)",10,0
    msg_nocarry db "No carry (CF=0)",10,0

section .text
    global _start
_start:
    mov ax,5
    add ax,2       ; no carry
    jnc nocarry

    mov ecx, msg_carry
    jmp print

nocarry:
    mov ecx, msg_nocarry

print:
    mov eax,4
    mov ebx,1
    mov edx,40
    int 0x80

    mov eax,1
    xor ebx,ebx
    int 0x80
