; hello.asm

section .data
  msg db 'Hello, world', 0x0, 0xa 

section .bss
section .text
  global main

main:
  mov rax, 1 ; sys_write
  mov rdi, 1 ; stdout
  mov rsi, msg
  mov rdx, 14 ; with the \0 and \n
  syscall

  mov rax, 60 ; sys_exit
  mov rdi, 1 ; exit code
  syscall