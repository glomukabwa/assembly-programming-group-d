; Go through read_text_32.asm before this

section .data
    msg_qn db "What is your name?" , 10, 0
    len_qn equ $ - msg_qn
    msg_greet db "Hello " , 0 ; I'm not gonna put the 10 cz I want the greeting and name to be in the same line
    len_greet equ $ - msg_greet

section .bss
    buffer resb 50

section .text
    global _start

_start:
    ; Ask the user a question
    mov eax, 4 ;syscall write
    mov ebx, 1 ;stdout
    mov ecx, msg_qn 
    mov edx, len_qn
    int 0x80

    ; Read data from the user
    mov eax, 3 ; syscall read
    mov ebx, 0 ; stdin
    mov ecx, buffer ;copies the address of the buffer in .bss so that the kernel knows where to store incoming 
                    ;user input
    mov edx, 50 ;give it the same size you had allocated to the buffer initially
    int 0x80

    ; eax has the number of bytes entered so store them in another register. I won't store them in edx this time
    ;cz I have to print the greeting first before I print the data entered. The other registers are esi, edi and ebp
    mov esi, eax

    ; Display the greeting
    mov eax, 4 ; syscall write
    mov ebx, 1 ; stdout
    mov ecx, msg_greet
    mov edx, len_greet
    int 0x80

    ; Display the name entered
    mov eax, 4 ;syscall write
    mov ebx, 1
    mov ecx, buffer
    mov edx, esi ; You had stored the length of the data entered in esi so move it to edx
    int 0x80

    ;exit
    mov eax, 1
    xor ebx, ebx
    int 0x80


; read hello_name_64.asm next