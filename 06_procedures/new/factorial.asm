section .text
global factorial     ; make factorial visible to C

; uint64_t factorial(uint64_t n)
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
