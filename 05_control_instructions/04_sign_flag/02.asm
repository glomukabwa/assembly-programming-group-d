; JNS → Jump if Not Sign

section .data
    msg_neg db "Gloria Mukabwa, Student No:167754",10,0
    len_neg equ $ - msg_neg
    msg_nonneg db "Gloria Mukabwa, Student No:167754",10,0
    len_nonneg equ $ - msg_nonneg

section .text
    global _start
_start:
    mov ax,5
    test ax,ax
    jns nonneg

    mov ecx, msg_neg
    mov edx, len_neg
    jmp print

nonneg:
    mov ecx, msg_nonneg
    mov edx, len_nonneg

print:
    mov eax,4
    mov ebx,1
    int 0x80

    mov eax,1
    xor ebx,ebx
    int 0x80
