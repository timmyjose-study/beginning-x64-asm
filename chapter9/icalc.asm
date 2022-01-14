; icalc.asm

extern printf

section .data
  number1 dq 128
  number2 dq 19
  neg_num dq -12
  fmt db 'The numbers are %ld and %ld',10,0
  fmtint db '%s %ld',10,0
  sumi db 'The sum is',0
  diffi db 'The difference is',0
  inci db 'Number 1 incremented:',0
  deci db 'Number 1 decremented:',0
  sali db 'Number 1 shift left 2 (x4):',0
  sari db 'Number 1 shift right 2 (/2):',0
  sariex db 'neg_num shift right 2 (/4) with sign extension:',0
  multi db 'The product is',0
  divi db 'The integer quotient is',0
  remi db 'The modulo is',0

section .bss
  resulti resq 1
  modulo resq 1

section .text
  global main

main:
  push rbp
  mov rbp, rsp

  ; display the numbers
  xor rax, rax
  mov rdi, fmt
  mov rsi, [number1]
  mov rdx, [number2]
  call printf

  ; adding
  mov rax, [number1]
  add rax, [number2]
  mov [resulti], rax

  xor rax, rax
  mov rdi, fmtint
  mov rsi, sumi
  mov rdx, [resulti]
  call printf

  ; subtracting
  mov rax, [number1]
  sub rax, [number2]
  mov [resulti], rax
  
  xor rax, rax
  mov rdi, fmtint
  mov rsi, diffi
  mov rdx, [resulti]
  call printf

  ; incrementing
  mov rax, [number1]
  inc rax
  mov [resulti], rax
  
  xor rax, rax
  mov rdi, fmtint
  mov rsi, inci
  mov rdx, [resulti]
  call printf

  ; decrementing
  mov rax, [number1]
  dec rax
  mov [resulti], rax

  xor rax, rax
  mov rdi, fmtint
  mov rsi, deci
  mov rdx, [resulti]
  call printf

  ; shift arithmetic left
  mov rax, [number1]
  sal rax, 2 ; shift the contents of rax leftwards by 2
  mov [resulti], rax

  xor rax, rax
  mov rdi, fmtint
  mov rsi, sali
  mov rdx, [resulti]
  call printf

  ; shift arithmetic right 
  mov rax, [number1]
  sar rax, 2 ; shift the contents of rax rightwards by 2
  mov [resulti], rax

  xor rax, rax
  mov rdi, fmtint
  mov rsi, sari
  mov rdx, [resulti]
  call printf

  ; shift arithemtic right with sign extension
  mov rax, [neg_num]
  sar rax, 2 ; shift the contents of rax rightwards by 2, filling in with sign bits (since neg_num is negative)
  mov [resulti], rax

  xor rax, rax
  mov rdi, fmtint
  mov rsi, sariex
  mov rdx, [resulti]
  call printf

  ; multiply
  mov rax, [number1]
  imul qword [number2] ; signed integer multiply - needs qword here
  mov [resulti], rax

  xor rax, rax
  mov rdi, fmtint
  mov rsi, multi
  mov rdx, [resulti]
  call printf

  ; signed integer division - rdx + rax contains the dividend, and
  ; after division, rdx contains the remainder (modulo) and rax the quotient
  mov rax, [number1]
  xor rdx, rdx ; this need to be zero 
  idiv qword [number2] ; again, qword is required here
  mov [resulti], rax ; quotient
  mov [modulo], rdx ; remainder

  xor rax, rax
  mov rdi, fmtint
  mov rsi, divi
  mov rdx, [resulti]
  call printf

  xor rax, rax
  mov rdi, fmtint
  mov rsi, remi
  mov rdx, [modulo]
  call printf

  mov rsp, rbp
  pop rbp
  xor rax, rax ; return code
  ret