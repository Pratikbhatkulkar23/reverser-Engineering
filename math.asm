global main

section .text 

main:
   mov rax,2
   add rax,3
   
   mov rax,2
   sub rax,2
   
   mov  rax,6
   imul rax,rax,2
   
   mov rdx,0
   mov rax,100
   mov rbx,2
   ; remainder store in rdx register
   ;idiv rbx
   ;rdx=rax in mutliplication (idiv)
   ;rdx:rax
   ;0100/2
   ;ld -e main  math.o -o math   ---> when progrma not start from  global _start that time u use commend -e program you want start from that ppoin
   ;ld math.o -o math  ----> link object file with extrenal lib we use (ld) commend
   ;nasm -f elf64 math.asm  ----> complail assembly code use this commend


   
_exit:
    mov rax,60
    mov rdi,0
    syscall
   
   
   


