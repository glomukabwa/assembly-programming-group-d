; Assemble the file   : nasm -f elf32 hello_world_32.asm -o hello_world_32.o
; Link:                 ld -m elf_i386 hello_world_32.o -o hello32 
; Run/Execute:          ./hello32

section .data
    ; message with newline 0xA, this indicates where the string ends
    msg db "Hello, World!", 0xA

    ;length of message
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

;| Register | Purpose                                                  |
;| -------- | -------------------------------------------------------- |
;| EAX      | Syscall number (tells the kernel which service you want) |
;| EBX      | 1st argument                                             |
;| ECX      | 2nd argument                                             |
;| EDX      | 3rd argument                                             |
;| ESI      | 4th argument (if needed)                                 |
;| EDI      | 5th argument                                             |
;| EBP      | 6th argument                                             |

    mov eax, 4        ; syscall number (sys_write)/diplay
    mov ebx, 1        ; file descriptor (stdout)
    mov ecx, msg      ; address of message
    mov edx, len      ; message length
    int 0x80          ; call kernel

    ; The rules of printing are:
    ; eax stores the either the read or write command. Read means take the data being entered by the user
    ; and store it in memory while write means the opposite. 
    ; Write is represented by 4 and Read is represented by 3. See at the end how read would work
    ; ebx stores the description of the file:0 = standard input(keyboard most of the time), 
    ; 1 = standard output(terminal in this case) and 2 = standard error message(error messages). 
    ; ecx stores the data to be displayed which in this case is the message
    ; edx stores the length of the messages to be displayed
    ; Now together, you have all the instructions. Note that this only works with a 32-bit system call
    ; which is known as int 0x80 as you can see above

    ;Exit
    mov eax, 1        ; syscall number (sys_exit)
    xor ebx, ebx      ; status 0
    int 0x80

    
    ;Read:
    ;section .bss
    ;    buffer:res50 ;Cz we need to reserve space for the input we are about to receive
    ;
    ;section .data
    ;    global _start
    ;    _start:
    ;       mov eax, 3 ;syscall for read
    ;       mov ebx, 0 ;stdin for input
    ;       mox ecx, buffer ;where to store the input
    ;       mov edx, 50     ;the size of the input. Notice that it is similar to the size we have reserved for the buffer
