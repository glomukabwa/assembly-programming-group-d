; version 1

section .text
    global factorial

factorial:
    cmp rdi, 1                ; if n <= 1
    jle .base_case
    push rdi                  ; save n in stack
    dec rdi                   ; n - 1
    call factorial            ; recursive call
    pop rbx                   ; restore n from the stack
    imul rax, rbx             ; rax = rax * n
    ret

.base_case:
    mov rax, 1
    ret


section .note.GNU-stack noalloc noexec nowrite progbits ; suppress the errors
