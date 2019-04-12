global _start
;shift arithmetic left
section .text
; agrega un 0 en el bit menos significativo y el bit mas significativo se desplaza a CF (si es 1) + ->01111111<--
;Cf = 0 11111110 <- nuevo cero ->
_start:
        mov al, 0b01111111
        shl al,1

        ; aqui si se activa CF
        mov al, 0b11111111
        shl al,1

        ;shift right
        mov al, 0b01111111
        shr al,1

        mov eax, 1
        int 0x80