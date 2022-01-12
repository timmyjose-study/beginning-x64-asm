; calc.asm - a simple calculator for integer operations.

; argument-passing order:
; rdi, rsi, rdx, rcx, r8, r9, and the rest in reverse order on the stack.
; rax as the first return register, for passing number of vector registers used (xmm).

extern scanf
extern printf

section .data
  prompt1 db 'Enter the first number: ',10,0
  prompt2 db 'Enter the second number: ',10,0
  readfmt db '%d',0
  sumfmt db '%d + %d = %d',10,0
  difffmt db '%d - %d = %d',10,0
  prodfmt db '%d * %d = %d',10,0
  quotfmt db '%d / %d = %d',10,0

section .bss
  number1 resq 1
  number2 resq 1
  result resq 1

section .text
  global main

main:
  push rbp
  mov rbp, rsp
  
  ; read the numbers in
  xor rax, rax
  mov rdi, prompt1
  call printf
  mov rdi, readfmt
  mov rsi, number1
  call scanf

  xor rax, rax
  mov rdi, prompt2
  call printf
  mov rdi, readfmt
  mov rsi, number2
  call scanf

  ; print sum
  mov rax, [number1]
  mov rbx, [number2]
  add rax, rbx
  mov qword [result], rax
  
  xor rax, rax
  mov rdi, sumfmt
  mov rsi, [number1]
  mov rdx, [number2]
  mov rcx, qword [result]
  call printf

  ; print difference
  mov rax, [number1]
  mov rbx, [number2]
  sub rax, rbx
  mov qword [result], rax

  xor rax, rax 
  mov rdi, difffmt
  mov rsi, [number1]
  mov rdx, [number2]
  mov rcx, qword [result]
  call printf

  ; print product
  mov rax, [number1]
  mov rbx, [number2]
  imul rax, rbx
  mov qword [result], rax

  xor rax, rax
  mov rdi, prodfmt
  mov rsi, [number1]
  mov rdx, [number2]
  mov rcx, qword [result]
  call printf

  ; print the quotient
  xor rdx, rdx ; clear the higher-order bits of rdx:rax
  mov rax, [number1]
  mov rbx, [number2]
  idiv rbx
  mov qword [result], rax

  xor rax, rax
  mov rdi, quotfmt
  mov rsi, [number1]
  mov rdx, [number2]
  mov rcx, qword [result]
  call printf

  mov rsp, rbp
  pop rbp
  ret