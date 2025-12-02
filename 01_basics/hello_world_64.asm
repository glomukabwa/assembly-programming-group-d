; Assemble the file: nasm -f elf64 hello_world_64.asm -o hello_world_64.o
; Link:              ld hello_world_64.o -o hello64
; Run:               ./hello64

section .data

    ; message with newline 0xA, this indicates where the string ends
    msg db "Hello, World!", 0xA 
    ; you could also write 10 in place of 0xA
    ;10 decimal / 0x0A hex - newline character to move cursor to the next line after printing

    ; length of message
    ;Subtract the start address of msg from the current address.
    ;That gives you the number of bytes between the start of msg and “now.”
    ;Which is exactly the length of your string.
    len equ $ - msg

section .text
    global _start
    ;Why do we type global _start ? To make it visible to the linker from outside the file
    ;The linker must know which one is the actual entry point — the place where the OS should start running your program when you run
    ;when you use ld..., it usually searches for _start and uses it as the program entry point unless u specify a different entry

_start:

;| Register | Purpose        |
;| -------- | -------------- |
;| RAX      | Syscall number |
;| RDI      | 1st argument   |
;| RSI      | 2nd argument   |
;| RDX      | 3rd argument   |
;| R10      | 4th argument   |
;| R8       | 5th argument   |
;| R9       | 6th argument   |

    ;How to display a message.
    ;Notice that this one is different from the 32-bit one when it comes to registers, the syscall for write and calling the kernel
    mov rax, 1        ; syscall number (sys_write) Notice that it is different from the one for 32-bit
                      ; The syscall for write in 64-bit is 1 and for read is 0
    mov rdi, 1        ; file descriptor (stdout)/display on the terminal
    mov rsi, msg      ; address of message
    mov rdx, len      ; length of message
    syscall           ; call kernel


    ; exit            ; Notice that the exit is also different in terms of registers and the syscall
    mov rax, 60       ; syscall number (sys_exit)
    xor rdi, rdi      ; status 0
    syscall

; So in summary the differences of 32-bit and 64-bit are:
; The registers used
; The syscall values for write and read
; The calling of the kernel
; The registers in the exit obviously cz the registers are different in 64-bit