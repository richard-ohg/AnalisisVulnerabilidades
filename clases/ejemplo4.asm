section .text
global _start
_start:
    push 0xf00d
    push 0xbaad
    mov eax, 0xf00d
    pop eax
    