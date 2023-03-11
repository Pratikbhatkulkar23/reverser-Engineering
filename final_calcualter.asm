%include "util.asm"
global _start

section .text

_start:
    mov rdi,num1
    call printstr
    call readint
    mov [user_num1],rax
    mov rdi,num2
    call printstr
    call readint
    mov [user_num2],rax
    mov rdi,operators
    call printstr
    mov rdi,user_operator
    mov rsi,2
    call readstr


cmp_operators:
    mov rdi,[user_operator]
    cmp rdi,43                   ; cmp  work with only integer value
    je addition
    cmp rdi,45
    je substration
    cmp rdi,42;
    je multplication
    cmp rdi,47
    je devision

execetion:
     mov rdi,error_msg
     call printstr
     call endl
     call exit0

addition:
   mov rdi,[user_num1]
   add rdi,[user_num2]
   call results
substration:
  mov rdi,[user_num1]
   sub rdi,[user_num2]
   call results
multplication:
   mov rdi,[user_num1]
   imul rdi,[user_num2]
   call results
devision:
   mov rdx,0
   mov rax,[user_num1]
   mov rbx,[user_num2]
   idiv rbx
   mov rdi,rax
   call results
   
results:
   call printint
   call endl
   call exit0
section .data
     num1: db "Enter Number 1 :" ,0
     num2: db "Enter Number 2 :",0
     operators: db "Enter operation to Perform(+,-,*,/)",0
     error_msg: db "operation can not Perform"
section .bss

   user_num1: resb 8
   user_num2: resb 8
   user_operator: resb 2
