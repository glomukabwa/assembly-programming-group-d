; Move immediate value into memory (32-bit)
; nasm -f elf32 mov_imm_to_mem_32.asm -o mov_imm_to_mem_32.o
; ld -m elf_i386 -o mov_imm_to_mem_32 mov_imm_to_mem_32.o
; ./mov_imm_to_mem_32

section .data
    num dd 0

section .text
    global _start

_start:
    mov dword [num], 42  ; store immediate 42 into memory

    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
