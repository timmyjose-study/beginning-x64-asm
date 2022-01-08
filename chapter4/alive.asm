; alive.asm

section .data
  msg1 db 'Hello, world!',10,0
  msg1len equ $-msg1-1
  msg2 db 'Alive and kicking!',10,0
  msg2len equ $-msg2-1
  radius dq 357
  pi dq 3.14159

section .bss
section .text
  global main

main:
  ; function prologue
  push rbp
  mov rbp, rsp

  ; display msg1
  mov rax, 1
  mov rdi, 1
  mov rsi, msg1
  mov rdx, msg1len
  syscall

  ; display msg2
  mov rax, 1
  mov rdi, 1
  mov rsi, msg2
  mov rdx, msg2len
  syscall

  ; function epilogue
  mov rsp, rbp
  pop rbp

  ; exit
  mov rax, 60
  mov rdi, 0
  syscall