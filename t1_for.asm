global _start
section .text

_start:
        mov ecx, 5              ; guardamos en ecx el número de iteraciones a realizar
        mov ebx, 1              ; guardamos en ebx el fd de la salida estándar
    myloop:                     ; etiqueta myloop
        push ecx                ; metemos a la pila temporalmente el valor de ecx, ya que necesitamos el registro para imprimir
        mov edx, len_cad        ; guardamos en edx la longitud de la cadena
        mov ecx, cad            ; guardamos en ecx la cadena
        mov eax, 4              ; guardamos en eax el número de la syscall (4-write)
        int 0x80                ; ejecutamos la interrupción
        pop ecx                 ; sacamos de la pila el valor de ecx
        loop myloop             ; loop hace 3 cosas, salta a la etiqueta myloop, decrementa en 1 el registro ecx, verifica que ecx sea mayor que 0 para poder saltar
        mov eax, 1              ; guardamos en eax el número de la syscall (1-exit)
        int 0x80                ; ejecutamos la interrupción

section .data                   ; declaración de cadenas
    cad: db'hola mundo',0xa
    len_cad: equ $ - cad