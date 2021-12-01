; alive.asm

extern printf

section .data
  msg1 db "Hello, world",0x0
  msg2 db "Alive and kicking!",0x0
  radius dd 357
  pi dq 3.14
  fmtstr db "%s",0x0a,0x0
  fmtint db "%d",0x0a,0x0
  fmtflt db "%f",0x0a,0x0

section .bss
section .text
  global main

main:
  push rbp
  mov rbp, rsp
; print msg1
  mov rax, 0
  mov rdi, fmtstr
  mov rsi, msg1
  call printf
; print msg2
  mov rax, 0
  mov rdi, fmtstr
  mov rsi, msg2
  call printf
; print radius
  mov rax, 0
  mov rdi, fmtint
  mov rsi, [radius]
  call printf
; print pi
  mov rax, 1 ; xmm register used for floats
  mov rdi, fmtflt
  movq xmm0, [pi]
  call printf
  mov rsp, rbp
  pop rbp
  ret
