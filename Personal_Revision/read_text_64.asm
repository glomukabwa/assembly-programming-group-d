; read hello_name_64.asm before this

section .data
    msg_greet db "Hola friend" , 10, 0
    len_greet equ $ - msg_greet
    msg_qn db  "Do you like sushi? ", 0
    len_qn equ $ - msg_qn
    msg_reply db "Why?", 10, 0
    len_reply equ $ - msg_reply
    msg_complete db "Hmmm, how interesting.", 10, 0
    len_complete equ $ - msg_complete

section .bss
    buffer resb 50 

section .text
    global _start

_start:
    ; Dreeting first
    mov rax, 1 ; write syscall
    mov rdi, 1 ; stdout
    mov rsi, msg_greet
    mov rdx, len_greet
    syscall

    ;Asking them the question u want
    mov rax, 1 ; syscall write
    mov rdi, 1 ; stdout
    mov rsi, msg_qn
    mov rdx, len_qn
    syscall

    ; Getting the answer
    mov rax, 0 ; syscall read
    mov rdi, 0 ; stdin
    mov rsi, buffer ; Telling the compiler where the answer will be stored
    mov rdx, 50 ;
    syscall

    mov r10, rax ; Cz after reading, the size of the input is usually stored in rax

    ; Giving a reply
    mov rax, 1 ; syscall write
    mov rdi, 1 ; stdout
    mov rsi, msg_reply
    mov rdx, len_reply
    syscall

    ; Read reason
    mov rax, 0 ; syscall read
    mov rdi, 0 ; std in
    mov rsi, buffer ; Overwrite the buffer with the reason
    mov rdx, 50
    syscall

    ; Ending the conversation
    mov rax, 1 ; syscall write
    mov rdi, 1 ; stdout
    mov rsi, msg_complete
    mov rdx, len_complete
    syscall

    ;exit
    mov rax, 60
    xor rdi, rdi
    syscall

 ; read conversation_32.asm next   