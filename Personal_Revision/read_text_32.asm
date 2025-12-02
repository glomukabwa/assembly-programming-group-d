; This is where revision begins

section .data
    msg db "What is your name?" , 10, 0
    len_msg equ $ - msg

section .bss
    buffer resb 50 ;reserve 50 bytes for buffer
                   ; A buffer is a block of memory used to store data temporarily
                   ; If I wanted to store two replies that I would use in the future, I'd give do this:
                   ; buffer1 resb 50
                   ; buffer2 resb 50 
                   ; However, if I don't need the first reply, I can just use the one buffer I have declared
                   ; here. The new reply will override the old one

section .text
    global _start

_start:
    ;display the question
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len_msg
    int 0x80 ; call the kernel

    ;read the message the user types:
    mov eax, 3 ; syscall for read in 32-bit
    mov ebx, 0 ; stdin
    mov ecx, buffer ; copies address of the buffer in .bss so that the kernel knows where to store the incoming
                    ; user input
    mov edx, 50    ; max number of bytes to store
    int 0x80 ; don't forget to call the kernel for each operation

    ;printing out the output entered:
    mov edx, eax ;I'm starting with this rn cz after a read operation(after the kernel is called), eax usually 
    ;stores the number of bytes read, after a write operation, it stores the number of bytes written.
    ;I want to store the number of bytes entered by the user before eax is assined the syscall. We could
    ;also just assign 50 to edx because that is the space we allocated to the buffer however, if the user entered
    ;sth that is eg 5 bytes, printing sth of length 50 bytes would print what the user has entered plus all the
    ;other junk or other unnecessary data that is occupying the 45 bytes that ended up not being used so was 
    ;given that space so instead we allocated the correct length of the input entered in this way
    mov eax, 4 ; syscall write
    mov ebx, 1 ; stdout
    mov ecx, buffer
    int 0x80 ;call the kernel
    

    ;exit
    mov eax, 1    ;syscall exit 
    xor ebx, ebx  ;ebx must be set to zero. You could do mov ebx, 0 or this cz the value will always be zero after
                  ;xor. Programers like the lec do this cz xor takes a shorter time to encode, its faster on some
                  ;CPUs and it cleans the register
    int 0x80  ;as usual you call the kernel to exit


    ; the above program will just output the name. Go to the program hello_name_32 in this folder to see a program
    ; that outputs both a greeting and name
