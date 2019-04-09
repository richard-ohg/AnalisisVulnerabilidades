global _start
section .text

_start: 
        mov ebx, 3
        cmp ebx, 1
        je case_one
        cmp ebx, 2
        je case_two
        cmp ebx, 3
        je case_three
        cmp ebx, 4
        je case_four
        cmp ebx, 5
        je case_five
        mov edx, len_no_existe
        mov ecx, no_existe
        jmp imprimir

    case_one:
        mov edx, len_uno
        mov ecx, uno
        jmp imprimir

    case_two:
        mov edx, len_dos
        mov ecx, dos
        jmp imprimir

    case_three:
        mov edx, len_tres
        mov ecx, tres
        jmp imprimir

    case_four:
        mov edx, len_cuatro
        mov ecx, cuatro
        jmp imprimir


    case_five:
        mov edx, len_cinco
        mov ecx, cinco
        jmp imprimir

    imprimir:
        mov ebx, 1
        mov eax, 4
        int 0x80
        jmp salir 

    salir:
        mov eax, 1
        int 0x80

section .data
    tres: db'tres',0xa
    len_tres: equ $ - tres
    uno: db'uno',0xa
    len_uno: equ $ - uno
    dos: db'dos',0xa
    len_dos: equ $ - dos
    cuatro: db'cuatro',0xa
    len_cuatro: equ $ - cuatro
    cinco: db'cinco',0xa
    len_cinco: equ $ - cinco
    no_existe: db'no existe',0xa
    len_no_existe: equ $ - no_existe
    

