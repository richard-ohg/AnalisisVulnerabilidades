global _start

section .text

_start:
    mov edx, len_adios
    mov ecx, adios
    mov eax, 4
    int 0x80
    mov eax, 1
    int 0x80
    

section .data
    adios: db'adios',0xa
    len_adios: equ $ - adios