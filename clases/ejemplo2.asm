global _start
section .text
_start:
        mov eax,0x1             ; eax=1
        add eax,0x2             ; eax+=2
        add bl,byte[mem1]       ; bl += (byte en la dir de memoria a la que apunta mem1)
        mov dl,0x5              ; lowest 8 bytes edx = 5
        sub byte[mem2],dl       ; resta a lo que haya en la direccion de memoria mem2 dl
        mov eax, 1
        int 0x80

section .data
        mem1:db 0x2
        mem2:db 0x9
