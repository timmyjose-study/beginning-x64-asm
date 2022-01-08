; add_nums.asm

extern scanf
extern printf

section .data
  prompt1 db 'Enter first number: ',10,0
  prompt2 db 'Enter second number: ',10,0
  readfmt db '%d',0
  printfmt db '%d',10,0

section .bss
  number1 resq 1
  number2 resq 1
  sum resq 1

section .text
  global main

main:
  push rbp
  mov rbp, rsp

  ; read number1
  xor rax, rax
  mov rdi, prompt1
  call printf
  mov rdi, readfmt
  mov rsi, number1
  call scanf

  ; read number2
  xor rax, rax
  mov rdi, prompt2
  call printf
  mov rdi, readfmt
  mov rsi, number2
  call scanf

  ; add the numbers together
  mov rax, [number1]
  mov rbx, [number2]
  add rax, rbx
  mov qword [sum], rax


  ; display sum
  xor rax, rax
  mov rdi, printfmt
  mov rsi, [sum]
  call printf

  mov rsp, rbp
  pop rbp
  ret
