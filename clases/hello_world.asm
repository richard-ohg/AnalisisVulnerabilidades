
section .text
global _start
;https://syscalls.kernelgrok.com/
_start:
        mov edx, len_cad        ; longitud del mensaje
        mov ecx, cad_hello_world; ubicación de la cadena
        mov ebx, 1              ; descriptor de archivo
        mov eax, 4              ; número de llamada
        int 0x80

        mov eax, 1              
        int 0x80
section .data
    cad_hello_world: db'hello world',0xa
    len_cad: equ $ - cad_hello_world