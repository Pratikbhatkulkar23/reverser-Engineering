%include	'util.asm'  ;https://github.com/mjbrusso/util.asm

global _start


section .text


_start:
  
  mov rdi,mssg
  call printstr
  call readint
  mov [user_value],rax ; [] mean rax point kar hai vaha store karo
  mov rbx,1

LOOP_START:
  mov rcx,[user_value]
  
  imul rcx,rbx
  mov rdi,rcx
  call printint
  call endl ;new line print
  add rbx,1
  cmp rbx,11
  jne LOOP_START
  call exit0



section .data
   mssg: db "Enter number",10,0  ; 0 is null byte it's seperate string


section .bss
    
     user_value: resb 8 
    