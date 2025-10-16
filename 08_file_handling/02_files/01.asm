; writing to a file

; Assemble the file   : nasm -f elf32 01.asm -o 01.o
; Link:                 ld -m elf_i386 01.o -o 01 
; Run/Execute:          ./01

section .data
    file db "output.txt", 0
    msg db "Assembly Language Programming", 10
    msg_len equ $ - msg

section .text
    global _start:

_start:
; openning the file
    mov eax, 5 ; sys open
    mov ebx, file
    mov ecx, 0x241 ; write only, create, trunc
    mov edx, 0o644 ; owner rw, r ,r
    int 0x80

    ; eax fs that is returned is 3
    mov esi, eax
    
    ; write to the file
    mov eax, 4          ; sys write
    mov ebx, esi        ; write to a file
    mov ecx, msg
    mov edx, msg_len
    int 0x80

    ; closing a file
    mov eax, 6       ; close
    mov ebx, esi     ; a file
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80



