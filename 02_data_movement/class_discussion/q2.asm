section .data
    arr dd 10, 20, 30, 40
    ; The above means that each value of the array occupies the size of the double word which means they are
    ; each 4 bytes in size and the array is 16 bytes in size. 

section .text
    global _start

_start:
    mov esi, 2
    mov eax, [arr + esi*4]
    ; [arr + esi*4] This means, take the address of arr which points to the first array value which is 10 and
    ; add the value of esi which is 2 multiplied by 4. So you get 8. So we are adding 8 to the address of the 
    ; first value in the array. This is how the values of the array are arranged:
    ; | address	    | value   |
    ; |-------------|---------|
    ; | arr	        | 10      |
    ; | arr+4	    | 20      |
    ; | arr+8	    | 30      |
    ; | arr+12	    | 40      |
    ; We defined each value in the data section as occupying 4 bytes.
    ; Therefore the value you will get is 30 and that is what will be moved to eax

    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
