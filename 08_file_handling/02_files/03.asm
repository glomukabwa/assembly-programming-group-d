; reading from a file and display on the terminal

; Assemble the file   : nasm -f elf32 01.asm -o 01.o
; Link:                 ld -m elf_i386 01.o -o 01 
; Run/Execute:          ./01

section .data
    file db "output.txt", 0
    buffer times 128 db 0

section .text
    global _start:

_start:
; openning the file
    mov eax, 5 ; sys open
    mov ebx, file
    mov ecx, 0
    ; no edx
    int 0x80

    ; eax fs that is returned is 3
    mov esi, eax

    ; get data from a file and store it inside buffer
    mov eax, 3
    mov ebx, esi
    mov ecx, buffer
    mov edx, 128
    int 0x80

    ; getting data from a variable and siplay on the terminal
    mov edx, eax
    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    int 0x80

    ; closing a file
    mov eax, 6       ; close
    mov ebx, esi     ; a file
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80