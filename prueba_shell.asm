section .text
global _start
_start:

    push edx
    push 0x68732f2f ; hs//
    push 0x6e69622f ; nib/
    
    mov ebx, esp
    mov ecx, edx ; NULL
    
    mov al, 0x0b ; llamamos al sycall * sys_execve - 11* 
    int 0x80