; JLE / JNG → Jump if Less or Equal
section .data
    msg_le db "Gloria Mukabwa, Student No:167754",10,0
    len_le equ $ - msg_le
    msg_greater db "Gloria Mukabwa, Student No:167754",10,0
    len_greater equ $ - msg_greater

section .text
    global _start
_start:
    mov ax,5
    mov bx,5
    cmp ax,bx
    jle le_label

    mov ecx, msg_greater
    mov edx, len_greater
    jmp print

le_label:
    mov ecx, msg_le
    mov edx, len_le

print:
    mov eax,4
    mov ebx,1
    int 0x80

    mov eax,1
    xor ebx,ebx
    int 0x80
