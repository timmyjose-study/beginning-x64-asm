; hola.asm

section .data
  msg db "Hola, mundo!",0

section .bss

section .text
  global main

main:
  mov rax, 1
  mov rdi, 1
  mov rsi, msg
  mov rdx, 13
  syscall
  mov rax, 60
  mov rdi, 0
  syscall