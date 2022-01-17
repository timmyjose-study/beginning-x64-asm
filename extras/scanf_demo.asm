; scanf_demo.asm - simple example of reading in an integer using scanf.

extern printf
extern scanf

section .data
  prompt db 'Enter number:',10,0
  readnum_fmt db '%d',0
  fmtstr db 'You entered %d',10,0

section .bss
  number resq 1

section .text
  global main

main:
  push rbp
  mov rbp, rsp

  xor rax, rax
  mov rdi, prompt
  call printf
  mov rdi, readnum_fmt
  mov rsi, number
  call scanf

  xor rax, rax
  mov rdi, fmtstr
  
  mov rsi, [number]
  call printf

  leave
  xor rax, rax
  ret