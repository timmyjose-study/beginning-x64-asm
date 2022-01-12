; move.asm

extern printf

section .data
  bnum db 123
  wnum dw 12345
  dnum dd 1234567890
  qnum1 dq 1234567890123456789
  qnum2 dq 123456
  qnum3 dq 3.14159
  fmtint db '%d',10,0
  fmtlong db '%ld',10,0
  fmtflt db '%6.5f',10,0

section .bss
section .text
  global main

main:
  push rbp
  mov rbp, rsp

  ; print the integers
  xor rax, rax
  mov rdi, fmtint
  xor rsi, rsi ; needed to clear upper bits for registers below 32 bits
  mov sil, byte [bnum] ; `byte` is redundant here
  call printf

  xor rax, rax
  mov rdi, fmtint
  xor rsi, rsi
  mov si, word [wnum]
  call printf

  xor rax, rax
  mov rdi, fmtint
  mov esi, dword [dnum]
  call printf

  xor rax, rax
  mov rdi, fmtlong
  mov rsi, qword [qnum1]
  call printf

  xor rax, rax
  mov rdi, fmtlong
  mov rsi, qword [qnum2]
  call printf

  ; print the float
  mov rax, 1
  movq xmm0, [qnum3]
  mov rdi, fmtflt
  call printf

  mov rsp, rbp
  pop rbp
  ret
