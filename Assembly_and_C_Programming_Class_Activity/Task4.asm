; Write a factorial program in assembly and call it from C to display the result.
section .text
    global factorial  ; function accessible from C

factorial:
    mov eax, 1        ; result = 1
    mov ecx, [esp+4]  ; get n from stack

factorial_loop:
    test ecx, ecx
    jz end_factorial
    imul eax, ecx
    dec ecx
    jmp factorial_loop

end_factorial:
    ret
