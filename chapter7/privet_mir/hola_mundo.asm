; hola_mundo.asm

extern printf

section .data
  msg db "Hola, mundo!",0x0
  fmtstr db "%s",0x0a,0x0

section .bss
section .text
  global main

main:
  push rbp
  mov rbp, rsp
  xor rax, rax
  mov rdi, fmtstr
  mov rsi, msg
  call printf
  mov rsp, rbp
  pop rbp
  ret
