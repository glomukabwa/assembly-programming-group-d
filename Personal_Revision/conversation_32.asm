; read hello_name_64.asm before this

section .data
    msg_greet db "Hello user" , 10 , 0
    len_greet equ $ - msg_greet
    msg_qn db "Can you speak Spanish?" , 10, 0
    len_qn equ $ - msg_qn
    msg_reply db "Really?" , 10, 0
    len_reply equ $ - msg_reply
    msg_complete db "Hmmm, noted" , 10, 0
    len_complete equ $ - msg_complete

section .bss
    buffer resb 50 

section .text
    global _start

_start:
    ;Greet
    mov eax, 4 ; syscall write
    mov ebx, 1 ; stdout
    mov ecx, msg_greet
    mov edx, len_greet
    int 0x80

    ;Ask question
    mov eax, 4 ; syscall write
    mov ebx, 1 ; stdout
    mov ecx, msg_qn
    mov edx, len_qn
    int 0x80

    ;Get reply
    mov eax, 3 ; syscall read
    mov ebx, 0 ; stdin
    mov ecx, buffer ; where it should store the input
    mov edx, 50 ; size allocated to the buffer
    int 0x80

    ;Follow up qn
    mov eax, 4 ; syscall write
    mov ebx, 0 ; stdout
    mov ecx, msg_reply
    mov edx, len_reply
    int 0x80

    ; Get reply to follow up qn
    mov eax, 3 ; syscall read
    mov ebx, 0 ; stdin
    mov ecx, buffer ; overwrite the buffer
    mov edx, 50 ; same space allocated to buffer initially
    int 0x80

    ;End conversation
    mov eax, 4 ; syscall write
    mov ebx, 1 ; stdout
    mov ecx, msg_complete
    mov edx, len_complete
    int 0x80

    ;exit
    mov eax, 1
    xor ebx, ebx
    int 0x80