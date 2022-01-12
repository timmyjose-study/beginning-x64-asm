; alive.asm

extern printf

section .data
  msg1 db 'Hello, world',0
  msg2 db 'Alive and kicking!',0
  radius dq 357
  pi dq 3.14159
  fmtstr db '%s',10,0
  fmtint db '%d',10,0
  fmtfloat db '%.3f',10,0

section .bss
section .text
  global main

main:
  push rbp
  mov rbp, rsp

  ; print msg1
  xor rax, rax
  mov rdi, fmtstr
  mov rsi, msg1
  call printf

  ; print msg2
  xor rax, rax
  mov rdi, fmtstr
  mov rsi, msg2
  call printf

  ; print radius
  xor rax, rax
  mov rdi, fmtint
  mov rsi, qword [radius]
  call printf

  ; print pi
  mov rax, 1
  mov rdi, fmtfloat
  movq xmm0, [pi]
  call printf

  mov rsp, rbp
  pop rbp
  ret
