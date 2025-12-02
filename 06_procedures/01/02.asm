; version 2
section .text
    global factorial

factorial:
    cmp rdi, 1           ; if (n <= 1)
    jg recurse           ; jump if n > 1
    mov rax, 1           ; base case: return 1
    ret

recurse:
    push rdi             ; save n
    dec rdi              ; n - 1
    call factorial       ; recursive call
    pop rbx              ; restore n
    imul rax, rbx        ; rax = n * factorial(n - 1)
    ret
