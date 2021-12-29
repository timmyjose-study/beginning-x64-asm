; hello_with_len.asm

section .data
  msg db 'Hello, world', 0x0, 0xa
  msglen equ $-msg

section .bss
section .text
  global main

main:
  ; function prologue
  push rbp
  mov rbp, rsp

  mov rax, 1 ; sys_write
  mov rdi, 1 ; stdout
  mov rsi, msg
  mov rdx, msglen
  syscall

  ; function prologue
  mov rsp, rbp
  pop rbp

  mov rax, 60 ; sys_exit
  mov rdi, 0 ; exit code
  syscall