; JA / JNBE → Jump if Above
section .data
    str_above db "Gloria Mukabwa, Student No:167754",10,0
    len_above equ $ - str_above
    str_not_above db "Gloria Mukabwa, Student No:167754",10,0
    len_not_above equ $ - str_not_above

section .text
    global _start
_start:
    mov ax, 7 
    mov bx, 3
    cmp ax, bx ; This is checking if 7 is larger than 3 and if it is, ja is true so it jumps to above clause
    ja above

    mov ecx, str_not_above
    mov edx, len_not_above
    jmp print

above:
    mov ecx, str_above
    mov edx, len_above

print:
    mov eax,4
    mov ebx,1
    int 0x80

    ; Exit
    mov eax,1
    xor ebx,ebx
    int 0x80
