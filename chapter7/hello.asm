; hello.asm

section .data
  msg db 'Hello, world',10,0
  msglen equ $-msg-1

section .bss
section .text
  global main

main:
  push rbp
  mov rbp, rsp

  mov rax, 1
  mov rdi, 1
  mov rsi, msg
  mov rdx, msglen
  syscall

  mov rsp, rbp
  pop rbp

  mov rax, 60
  mov rdi, 0
  syscall