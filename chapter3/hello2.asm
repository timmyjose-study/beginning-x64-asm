; hello2.asm - print message and then print a newline

section .data 
  msg db 'Hello, world', 0x0
  NL db 0xa

section .bss
section .text
  global main

main:
  mov rax, 1  ; sys_write
  mov rdi, 1  ; stdout
  mov rsi, msg
  mov rdx, 12
  syscall

  mov rax, 1
  mov rdi, 1
  mov rsi, NL
  mov rdx, 1
  syscall

  mov rax, 60 ; sys_exit
  mov rdi, 0  ; exit code
  syscall
