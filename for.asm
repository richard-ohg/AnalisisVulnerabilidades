global _start
section .text
_start:
        mov ecx, 5
        mov ebx, 1
    myloop:
        push ecx
        mov edx, len_cad
        mov ecx, cad 
        mov eax, 4 
        int 0x80
        pop ecx
        loop myloop
    
        mov eax, 1
        int 0x80

section .data
    cad: db'hola mundo',0xa
    len_cad: equ $ - cad