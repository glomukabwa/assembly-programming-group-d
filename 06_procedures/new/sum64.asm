section .text
global _start

_start:
    mov rax, 0      ; sum = 0
    mov rcx, 1      ; counter i = 1
    mov rbx, 5      ; upper limit = 5

sum_loop:
    add rax, rcx    ; sum += i
    inc rcx         ; i++

    cmp rcx, rbx    ; compare i with 5
    jle sum_loop    ; if i <= 5, repeat

    mov rax, 60     ; syscall number for exit (sys_exit)
    mov rdi, 0      ; exit code = 0
    syscall         ; make system call
