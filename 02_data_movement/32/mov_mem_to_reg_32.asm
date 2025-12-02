; Move value from memory to register (32-bit)

section .data
    num dd 1234    ; define 32-bit integer

section .text
    global _start

_start:
    mov al, [num]  ; load value from memory into EAX
                   ; 1234 is 0x000004D2. Since al can only fit 8 bits which is 1 byte, only D2 will be moved 
                   ; to al. Two digits in hex make 1 byte(8 bits). The rest of the numbers won't be moved into
                   ; the rest of eax.

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80
