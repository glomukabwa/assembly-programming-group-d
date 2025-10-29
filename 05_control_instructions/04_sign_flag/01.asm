; JS → Jump if Sign
section .data
    msg_neg db "Gloria Mukabwa, Student No:167754",10,0
    len_neg equ $ - msg_neg
    msg_pos db "Gloria Mukabwa, Student No:167754",10,0
    len_pos equ $ - msg_pos

section .text
    global _start
_start:
    mov ax,-5
    test ax,ax ; test performs a bitwise AND on the numbers it's given
    ; A bitwise AND means performing a logical AND on the binary digits of a number so the Nos have to be converted
    ; to binary digits first. Apparently, for high level languages, logical AND is used to check if the two values
    ; it is comparing are nonzero and it returns true if both are nonzero and false if one is a zero. It is the 
    ; same principle as when it is comparing binary numbers but with the logical AND, it doesn't have to convert
    ; the numbers to binary. Eg it can compare 6 and 0 and give you false as the result
    js negative

    mov ecx, msg_pos
    mov edx, len_pos
    jmp print

negative:
    mov ecx, msg_neg
    mov edx, len_neg

print:
    mov eax,4
    mov ebx,1
    int 0x80

    mov eax,1
    xor ebx,ebx
    int 0x80
