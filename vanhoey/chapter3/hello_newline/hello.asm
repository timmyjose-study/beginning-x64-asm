; hello.asm

section .data
  msg db "Hello, world",0
  NL db 0x0a

section .bss
section .text
  global main

main:
  mov rax, 1
  mov rdi, 1
  mov rsi, msg
  mov rdx, 12
  syscall
  mov rax, 1
  mov rdi, 1
  mov rsi, NL
  mov rdx, 1
  syscall
  mov rax, 60
  mov rdi, 0
  syscall