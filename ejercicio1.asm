global _start
section .text
_start:
        mov eax, 0xFACEB00C
        cmp eax, 0xFACEB00C
        jne no_es
        jmp si_es
    no_es:
        mov edx, len_no_tiene        ; longitud del mensaje
        mov ecx, no_tiene
        mov eax, 4
        int 0x80
        mov eax, 1
        int 0x80
    si_es:
        mov edx, len_si_tiene        ; longitud del mensaje
        mov ecx, si_tiene
        mov eax, 4
        int 0x80
        mov eax, 1
        int 0x80


section .data
    si_tiene: db'EAX tiene 0xFACEB00C :)',0xa
    len_si_tiene: equ $ - si_tiene
    no_tiene: db'EAX no tiene 0xFACEB00C :V',0xa
    len_no_tiene: equ $ - no_tiene