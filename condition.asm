global _start


section .text

_start: 
    jmp main

main:
   mov rax,0
   mov rdi,0
   mov rsi,user_key
   mov rdx,64
   syscall
 

cmp_key:
    cmp rax,origina_key_len
    jne access_denied
    mov rsi,origina_key
    mov rdi,user_key
    mov rcx,origina_key_len
    repe cmpsb             ; cmps comper karo string byte ko , repe mean reapt repe use rcx rigister hold value
    je access_granded
    jne access_denied
access_granded:
    mov rax,1
    mov rdi,1
    mov rsi,access_granted_mssg
    mov rdx,access_granted_mssg_len
    syscall
    jmp exiting

access_denied:
    mov rax,1
    mov rdi,1
    mov rsi,access_denied_mssg
    mov rdx,access_denied_mssg_len
    syscall

exiting:
  mov rax,60
  mov rdi,0
  syscall

section .data
     access_granted_mssg: db "Access Granted !",10 ;10is ascii value of new line
     access_granted_mssg_len:equ $-access_granted_mssg 

     access_denied_mssg: db "Access denied !",10 
     access_denied_mssg_len:equ $-access_denied_mssg
     origina_key: db "111-111-111-111"
     origina_key_len: equ $-origina_key


section .bss
     user_key: resb 64