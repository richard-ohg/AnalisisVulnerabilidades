section .text
global _start

_start:

    mov ecx, cadena
    add ecx, 8
    ror ecx, 2
    xor ecx, 0x12345678
    inc ecx
    shr ecx, 1

section .data
    cadena: db'hola',0x0
    len_cadena: equ $ - cadena