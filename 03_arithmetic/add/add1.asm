; add8.asm
section .data
    num1 db 120   ; 01111000b
    num2 db 10    ; 00001010b
    result db 0

section .text
    global _start

_start:

    ; add [num1], [num2]

    mov al, [num1]
    add al, [num2]       ; al = num1 + num2        10000010
    mov [result], al


    

    mov eax, 1
    xor ebx, ebx
    int 0x80

; flags set are
; PF - Even number of 1s
; AF - Carry from lower nibble to upper nibble
;      Borrow from upper nibble to lower nibble
; SF - set if MSB is 1 (Bit 7)
; OF - Set if the signed result is out of range.
;      Signed 8-bit: range = -128 to +127.