; print nums

extern printf

section .data
  bnum db 123
  wnum dw 12345
  dnum dd 123456789
  qnum1 dq 123467890123456789
  fmtint db '%d',10,0
  fmtlong db '%ld',10,0
  fmtlonglong db '%lld',10,0
  fmtfloat db '%.3f',10,0

section .bss
section .text
  global main

main:
  ; prologue
  push rbp
  mov rbp, rsp

  ; epilogue
  mov rsp, rbp
  pop rbp

  ; print the byte
  xor rax, rax
  mov rdi, fmtint
  xor rsi, rsi
  mov sil, byte [bnum]
  call printf

  ; print the word
  xor rax, rax
  mov rdi, fmtlong
  xor rsi, rsi
  mov si, word [wnum]
  call printf

  ; print the double word
  xor rax, rax
  mov rdi, fmtlong
  mov rsi, rsi
  mov esi, dword [dnum]
  call printf

  ; print the quad word
  xor rax, rax
  mov rdi, fmtlonglong
  mov rsi, qword [qnum1]
  call printf

  ; exit
  xor rax, rax ; return code
  ret
