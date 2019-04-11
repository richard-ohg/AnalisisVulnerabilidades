global _start
section .text

_start: 
        mov ebx, 3              ; guardamos en ebx el valor a comparar
        cmp ebx, 1              ; comparamos ese valor con 1
        je case_one             ; si es uno, salta a la etiqueta case_one
        cmp ebx, 2              ; comparamos ese valor con 2
        je case_two             ; si es dos, salta a la etiqueta case_two
        cmp ebx, 3              ; comparamos ese valor con 3
        je case_three           ; si es tres, salta a la etiqueta case_three
        cmp ebx, 4              ; comparamos ese valor con 4
        je case_four            ; si es cuatro, salta a la etiqueta case_for
        cmp ebx, 5              ; comparamos ese valor con 5
        je case_five            ; si es cinco, salta a la etiqueta case_five
        jmp default             ; en caso de no ser ninguno, saltamos a la opción por defecto

    case_one:                   ; case 1:
        mov edx, len_uno        ; guardamos la longitud de la cadena a imprimir en edx
        mov ecx, uno            ; en el registro ecx guardamos la cadena a imprimir
        jmp imprimir            ; saltamos a la etiqueta imprimir

    case_two:                   ; case 2:
        mov edx, len_dos        ; guardamos la longitud de la cadena a imprimir en edx
        mov ecx, dos            ; en el registro ecx guardamos la cadena a imprimir
        jmp imprimir            ; saltamos a la etiqueta imprimir

    case_three:                 ; case 3:
        mov edx, len_tres       ; guardamos la longitud de la cadena a imprimir en edx
        mov ecx, tres           ; en el registro ecx guardamos la cadena a imprimir
        jmp imprimir            ; saltamos a la etiqueta imprimir

    case_four:                  ; case 4:
        mov edx, len_cuatro     ; guardamos la longitud de la cadena a imprimir en edx
        mov ecx, cuatro         ; en el registro ecx guardamos la cadena a imprimir
        jmp imprimir            ; saltamos a la etiqueta imprimir

    case_five:                  ; case 5:
        mov edx, len_cinco      ; guardamos la longitud de la cadena a imprimir en edx
        mov ecx, cinco          ; en el registro ecx guardamos la cadena a imprimir
        jmp imprimir            ; saltamos a la etiqueta imprimir
    
    default:                    ; default:
        mov edx, len_no_existe  ; guardamos la longitud de la cadena a imprimir en edx
        mov ecx, no_existe      ; en el registro ecx guardamos la cadena a imprimir
        jmp imprimir            ; saltamos a la etiqueta imprimir
        

    imprimir:                   ; etiqueta imprimir
    ; para imprimir tenemos que mandar a llamar la syscall write(), esta recibe 4 argumentos que deben ser guardados
    ; en los registros eax, ebx, ecx, edx respectivamente. 
    ; ssize_t write(int fd, const void *buf, size_t count), esta es la definición de la función
    ; en eax debe ir el número de la syscall, en caso de write es el 4
    ; en ebx debe de ir el file descriptor, para mostrar en pantalla necesitamos la salida estándar, para este caso el fd es el 1
    ; en ecx debe ir la cadena
    ; en edx debe ir la longitud de esa cadena
    ; cuando la ejecución llegue a la etiqueta imprimir, previamente se guarda la cadena y su longitud
        mov ebx, 1              ; guardamos el fd de la salida estándar
        mov eax, 4              ; guardamos en eax el número de la syscall (4=write)
        int 0x80                ; ejecutamos la interrupción
        jmp salir               ; saltamos a la etiqueta salir

    salir:                      ; etiqueta salir
        mov eax, 1              ; guardamos en eax el número de la syscall (1=exit)
        int 0x80                ; ejecutamos la interrupción



section .data                   ; definición de cadenas
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
    

