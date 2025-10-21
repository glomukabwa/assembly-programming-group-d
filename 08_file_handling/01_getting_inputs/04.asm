section .data
nl db 10

section .text
global _start

_start:
    mov ebp, esp
    mov ecx, [ebp]        ; argc
    add ebp, 4            ; point to argv[0]

print_args:
    cmp ecx, 0
    jz done               ; stop when no args left

    mov esi, [ebp]        ; esi = argv[i]
    test esi, esi
    jz done               ; in case of NULL pointer safety check

    ; calculate string length
    mov edx, 0
count_loop:
    cmp byte [esi + edx], 0
    je write_string
    inc edx
    jmp count_loop

write_string:
    mov eax, 4
    mov ebx, 1
    mov ecx, esi
    int 0x80

    ; print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, nl
    mov edx, 1
    int 0x80

    add ebp, 4            ; next argument
    dec ecx
    jmp print_args

done:
    mov eax, 1
    xor ebx, ebx
    int 0x80

