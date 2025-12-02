; Go through hello_name_32.asm before this

; In summary the differences of 32-bit and 64-bit are:
; The registers used
; The syscall values for write and read
; The calling of the kernel
; The registers in the exit obviously cz the registers are different in 64-bit 
; The syscall value for exit

section .data 
    msg_qn db "What is your name?" , 10, 0
    len_qn equ $ - msg_qn
    msg_greet db "Hello "  , 0
    len_greet equ $ - msg_greet

section .bss
    buffer resb 50

section .text
    global _start

_start:
    ; Output the question
    ; In 64-bit, the equivalent of:
    ; eax = rax
    ; ebx = rdi
    ; ecx = rsi
    ; edx = rdx
    ; syscall write = 1 and read = 0
    mov rax, 1 ; syscall write
    mov rdi, 1 ; stdout is the same
    mov rsi, msg_qn
    mov rdx, len_qn
    syscall ; The way you call the kernel is different

    ; Read data from the user
    mov rax, 0 ; syscall for read is 0
    mov rdi, 0 ; stdin is the same
    mov rsi, buffer ; copies the address of the buffer in .bss so that the kernel knows where to store the incoming 
                    ; user input 
    mov rdx, 50 ; Allocate the same size u had reserved in section .bss
    syscall

    ;store the bytes entered (which are now stored in rax after syscall) in a different register
    ;the remaining registers are r10, r9, r8
    mov r10, rax

    ;Output the greeting
    mov rax, 1 ; syscall write
    mov rdi, 1 ; stdout is the same
    mov rsi, msg_greet
    mov rdx, len_greet
    syscall

    ;Output the name entered by the user
    mov rax, 1 ; syscall read is 1
    mov rdi, 1 ; stdout is the same
    mov rsi, buffer ; I've noticed that we copy the address of the buffer into the rsi twice, When we write the 
                    ; greeting above, the content of the rsi shifts. If we wouldn't be able to copy the address of
                    ; the buffer again, we would've had to assign its address to an extra register like r9 or r8
                    ; but bcz the data in the buffer in .bss doesn't change( it can only changes if the programmer
                    ; explicitly overwrites it) , we can just copy the address of the buffer again to use it to 
                    ; write the name cz now after reading, it contains the name entered
    mov rdx, r10
    syscall

    ;exit - Don't forget the change of registers
    mov rax, 60
    xor rdi, rdi
    syscall

    ; read read_text_64.asm next