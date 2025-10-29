; JB / JNAE → Jump if Below

section .data
    str_below     db "Gloria Mukabwa, Student No:167754",10,0
    len_below equ $ - str_below
    str_not_below db "Gloria Mukabwa, Student No:167754",10,0
    len_not_below equ $ - str_not_below

section .text
    global _start
_start:
    mov ax,2
    mov bx,5
    cmp ax,bx ; this checks if 2 is smaller and if it is, jb is set so it jumps to below
    jb below

    mov ecx, str_not_below
    mov edx, len_not_below
    jmp print

below:
    mov ecx, str_below
    mov edx, len_below

print:
    mov eax,4
    mov ebx,1
    int 0x80

    mov eax,1
    xor ebx,ebx
    int 0x80
