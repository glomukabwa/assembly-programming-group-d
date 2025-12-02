
section .data
    ; define byte array
    array db 10, 20, 30, 40

section .text
    global _start

_start:

    mov ebx, array ; Remember in q3.asm we have talked about loading. Here, we load the address of the first
                   ; value of the array which is 10. Plz note that we are just loading its address not its
                   ; value   

    mov dl, [ebx] ; Here, we are actually loading the first value of the array into dl. Notice the brackets

    mov dh, [ebx+1]  ; Here, we are loading the 2nd value of the array which is 20. Each value of the array 
                     ; occupies one byte so the structure is:
                     ; | address	    | value   |
                     ; |----------------|---------|
                     ; | arr	        | 10      |
                     ; | arr+1	        | 20      |
                     ; | arr+2	        | 30      |
                     ; | arr+3	        | 40      |

    ; Exit program
    mov ax, 1
    xor bx, bx
    int 0x80
