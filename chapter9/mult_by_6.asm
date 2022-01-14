; mult_by_6.asm

extern scanf
extern printf

section .data 
  prompt db 'Enter number:',10,0
  readfmt db '%ld',0
  printfmt db '%ld x 6 = %ld',10,0
  fmt db '%d',0

section .bss
  number resq 1
  product resq 1

section .text
  global main

main:
  push rbp
  mov rbp, rsp

  ; read in the number
  xor rax, rax
  mov rdi, prompt
  call printf
  mov rdi, readfmt
  mov rsi, number
  call scanf

  ; multiply by 6:
  ; x x 6  = x << 2 | x << 1
  mov rax, [number]
  sal rax, 2
  mov [product], rax
  mov rax, [number]
  sal rax, 1
  add qword [product], rax

  ; print the product
  xor rax, rax
  mov rdi, printfmt
  mov rsi, [number]
  mov rdx, [product]
  call printf

  mov rsp, rbp
  pop rbp
  xor rax, rax
  ret
