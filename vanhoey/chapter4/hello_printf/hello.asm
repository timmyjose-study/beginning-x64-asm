; hello.asm

extern printf

section .data
  msg db "Hello, world!",0x0
  fmtstr db "This is our string: %s",0x0a,0x0

section .bss
section .text
  global main

main:
  push rbp
  mov rbp, rsp
  mov rdi, fmtstr ; first argument for printf
  mov rsi, msg  ; second argument for printf
  mov rax, 0 ; no xmm registers used
  call printf
  mov rsp, rbp
  pop rbp
  mov rax, 60
  mov rdi, 0
  syscall