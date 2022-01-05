; hello3.asm - newline as part of the string

section .data
  msg db 'Hello, world',0xa,0x0

section .bss
section .text
  global main

main:
  mov rax, 1  ; sys_write
  mov rdi, 1  ; stdout
  mov rsi, msg
  mov rdx, 13
  syscall

  mov rax, 60 ; sys_exit
  mov rdi, 0  ; exit code
  syscall
