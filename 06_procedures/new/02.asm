section .text
global _start

_start:
    mov rdi, 5          ; n = 5
    call factorial       ; call factorial(n)
    ; result is now in RAX

    ; exit
    mov rax, 60          ; syscall: exit
    xor rdi, rdi         ; status = 0
    syscall

factorial:
    cmp rdi, 1           ; if (n <= 1)
    jg recurse           ; jump if n > 1
    mov rax, 1           ; base case: return 1
    ret

recurse:
    push rdi             ; save current n
    dec rdi              ; n - 1
    call factorial       ; recursive call
    pop rbx              ; restore n
    imul rax, rbx        ; rax = n * factorial(n - 1)
    ret



    