; factorial.asm

extern scanf
extern printf

section .data
  prompt_for_number db 'Enter number:',10,0
  read_int_fmt db '%d',0
  print_factorial_fmt db 'The factorial of %d is %d',10,0
  factorial dq 1

section .bss
  number resq 1

section .text
  global main

main:
  push rbp
  mov rbp, rsp

  xor rax, rax
  mov rdi, prompt_for_number
  call printf
  mov rdi, read_int_fmt
  mov rsi, number
  call scanf

  xor r14, r14
  mov r14, qword [number]

floop:
  mov rax, qword [factorial]
  mul r14
  mov qword [factorial], rax
  dec r14
  xor rax, rax
  cmp rax, r14
  jl floop

  xor rax, rax
  mov rdi, print_factorial_fmt
  mov rsi, qword [number]
  mov rdx, qword [factorial]
  call printf

  mov rsp, rbp
  pop rbp
  ret

