; hola_mundo.asm

section .data
  msg db 'Hola, mundo!',10,0
  msglen equ $-msg-1

section .bss
section .text
  global main

main:
  push rbp
  mov rbp, rsp

  mov rax, 1 ; sys_write
  mov rdi, 1 ; stdout
  mov rsi, msg
  mov rdx, msglen
  syscall

  mov rax, 60 ; sys_exit
  mov rdi, 0 ; exit code
  syscall