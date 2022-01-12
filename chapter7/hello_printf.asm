; hello_printf.asm

extern printf

section .data
  msg db 'Hello, world!',0
  fmtstr db '%s',10,0

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
