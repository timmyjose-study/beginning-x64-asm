; fcalc.asm
;
; movsd - move double precision 
; movss - move single precision
; addsd - add double precision
; subsd - subtract double precision
; mulsd - multiply double precision
; divsd - divide double precision
; sqrtsd - square root in double precision

extern printf

section .data
  number1 dq 9.0123
  number2 dq 73.9912
  fmt db 'The numbers are %f and %f',10,0
  fmtflt db '%s %f',10,0
  sumfmt db '%f + %f = %f',10,0
  difffmt db '%f - %f = %f',10,0
  prodfmt db '%f * %f = %f',10,0
  divfmt db '%f / %f = %f',10,0
  sqrtfmt db 'sqrt(%f) = %f',10,0

section .bss
section .text
  global main

main:
  push rbp
  mov rbp, rsp

  ; print the numbers
  mov rax, 2
  mov rdi, fmt
  movsd xmm0, [number1]
  movsd xmm1, [number2]
  call printf

  ; sum
  movsd xmm2, [number1]
  addsd xmm2, [number2]

  mov rax, 3
  mov rdi, sumfmt
  movsd xmm0, [number1]
  movsd xmm1, [number2]
  call printf

  ; difference
  movsd xmm2, [number1]
  subsd xmm2, [number2]

  mov rax, 3
  mov rdi, difffmt
  movsd xmm0, [number1]
  movsd xmm1, [number2]
  call printf

  ; product
  movsd xmm2, [number1]
  mulsd xmm2, [number2]

  mov rax, 3
  mov rdi, prodfmt
  movsd xmm0, [number1]
  movsd xmm1, [number2]
  call printf

  ; quotient
  movsd xmm2, [number1]
  divsd xmm2, [number2]

  mov rax, 3
  mov rdi, divfmt
  movsd xmm0, [number1]
  movsd xmm1, [number2]
  call printf

  ; square root
  sqrtsd xmm1, [number1]
  mov rax, 2
  mov rdi, sqrtfmt
  movsd xmm0, [number1]
  call printf

  sqrtsd xmm1, [number2]
  mov rax, 2
  mov rdi, sqrtfmt
  movsd xmm0, [number2]
  call printf

  mov rsp, rbp
  pop rbp
  ret
