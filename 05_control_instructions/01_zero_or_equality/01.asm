; jump if equal 

section .data
    msg_equal db "Gloria Mukabwa, Student No:167754",10,0
    len_equal equ $ - msg_equal 
    ;10 decimal / 0x0A hex - newline character to move cursor to the next line after printing
    ;0 - null terminator
    ; len_equal and msg_equal are just variable names that the programmer declares so its okay to give them diff. names
    ; $ is the location where $ is standing so we say it is the location of the current address
    ; msg_equal is the address of the variable msg_equal
    ; you are subtrating the 2 addresses to get the length of the message then equ which stands for equate 
    ; assigns that constant number to len_equal
    msg_not_equal db "Gloria Mukabwa, Student No:167754",10,0
    len_not_equal equ $ - msg_not_equal

section .text
    global _start
_start:
    mov ax, 5
    mov bx, 5

    ; cmp ax, bx performs (ax - bx), 
    ; updates flags but does not store result
    cmp ax, bx
    je equal ; This means jump if equal. cmp above compares ax and bx through subtraction and
    ; if the answer is zero it means they are equal so it jumps to the equal clause below so 
    ; you'll notice it only prints once. If we wanted to use the not equal clause, we would've 
    ; interchanged their positions then used jne (jump if not equal)
    ; plz note that je and jne check the zero flag so if je is true it means Z-flag = 1

    ; Not equal case
    mov ecx, msg_not_equal ; ecx = pointer to message
    mov edx, len_not_equal ; correct string(message) length
    jmp print

equal:
    ; Equal case
    mov ecx, msg_equal ; ecx = pointer to message
    mov edx, len_equal ; correct string(message) length

print:
    ; The rules of printing are:
    ; eax stores the either the read or write command. Read means take the data being entered by the user
    ; and store it in memory while write means the opposite
    ; ebx stores the description of the file:0 = standard input(keyboard most of the time), 
    ; 1 = standard output(terminal in this case) and 2 = standard error message(error messages). 
    ; ecx stores the data to be displayed which in this case is the message
    ; edx stores the length of the messages to be displayed
    ; Now together, you have all the instructions. Note that this only works with a 32-bit system call
    ; which is known as int 0x80 as you will see below

    mov eax,4   ; syscall number for sys_write
    mov ebx,1   ; file descriptor (1 = stdout)
    int 0x80    ;interrupt to invoke the call

    ; Exit
    mov eax,1
    xor ebx,ebx
    int 0x80    ; interrupt to exit the program
