; alive.asm

section .data
  msg1 db "Hello, world!",0x0a,0
  msg1len equ $-msg1-1
  msg2 db "Alive and kicking!",0x0a,0
  msg2len equ $-msg2-1
  radius dq 357
  pi dq 3.14

section .bss
section .text
  global main

main:
  push rbp  ; function prologue
  mov rbp, rsp  ; function prologue
  mov rax, 1
  mov rdi, 1
  mov rsi, msg1
  mov rdx, msg1len
  syscall
  mov rax, 1
  mov rdi, 1
  mov rsi, msg2
  mov rdx, msg2len
  syscall
  mov rsp, rbp ; function epilogue
  pop rbp ; function epilogue
  mov rax, 60
  mov rdi, 0
  syscall
