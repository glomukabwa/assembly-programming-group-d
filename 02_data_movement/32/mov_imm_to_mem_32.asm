; Move immediate value into memory (32-bit)
; nasm -f elf32 mov_imm_to_mem_32.asm -o mov_imm_to_mem_32.o
; ld -m elf_i386 -o mov_imm_to_mem_32 mov_imm_to_mem_32.o
; ./mov_imm_to_mem_32

section .data
    num dd 0 ; We put this in data cz we want to initialize the num but if we didn't want to give it a initial 
             ; we would put it in .bss and do num resd 1 and moved it the way we are about to move this in
             ; _start

section .text
    global _start

_start:
    mov dword [num], 42  ; store immediate 42 into memory
    ; As much as we have already defined that num is double word, mov instruction still requires us to tell
    ; us the size of the data it is moving cz it has no way of knowing what size num is. It doesn't usually 
    ; know the size when it comes to memory but for register, it doesn. Fore example if we were moving sth
    ; from eax to num, we wouldn't need to specify the size cz it knows that eax is 32 bits.
    ; These are the rules:
    ; | Instruction type               | Need size?   | Why?                   |
    ; | ------------------------------ | -----------  | ---------------------- |
    ; | imm → mem (`mov dword [x], 5`) | ✔️ Yes      | CPU cannot infer size  |
    ; | reg → mem (`mov [x], eax`)     | ❌ No       | Register size is known |
    ; | mem → reg (`mov ax, [x]`)      | ❌ No       | Register size is known |
    ; | reg → reg (`mov eax, ebx`)     | ❌ No       | Both sizes known       |
    ; | mem → mem                      | ❌ Illegal  | Not allowed            | ; You can't do memory to memory

    ; So this is what we add to move depending on the size we have defined: 
    ; | Instruction            | Meaning       |
    ; | ---------------------- | ------------- |
    ; | `mov byte [mem], val`  | store 1 byte  |
    ; | `mov word [mem], val`  | store 2 bytes |
    ; | `mov dword [mem], val` | store 4 bytes |
    ; | `mov qword [mem], val` | store 8 bytes |

    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
