global _start ;start program
 section .text



_start:
    mov rax,1
    mov rdi,1
    mov rsi,wlc
    mov rdx,wllenght
    syscall
    
 user_input:
    mov rax,0
    mov rdi,0
    mov rsi,input  
    mov rdx,100
    mov rbx,rax ;after input value in syscall returrn input value store into rax register
    
 print_hello:
     mov rax,1
     mov rdi,1
     mov rsi,hello
     mov rdx,hello_lenght
     syscall
     
 printing_userinput:
    mov rax,1
    mov rdi,1
    mov rsi,input
    mov rdx, rbx
    syscall
     
    
    mov rax,60
    mov rdi,22
    syscall
    
     
 section .data 

   wlc: db_'Enter Your Name : '
   wllenght: equ $-wlc
   hello : db "Hello"
   hello_lenght :  equ $-hello
   
   
   
   
   
 
   

 section .bss 
     
     input: resb 100
