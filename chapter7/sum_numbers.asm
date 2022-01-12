; sum_numbers.asm

extern scanf
extern printf

section .data
  prompt_for_count db 'How many numbers?',10,0
  prompt_for_number db 'Enter number',10,0
  read_int_fmt db '%d',0
  print_int_fmt db 'Sum = %d',10,0

section .bss
  count resq 1
  number resq 1
  sum resq 1

section .text
  global main

main:
  push rbp
  mov rbp, rsp

  ; read the count
  xor rax, rax
  mov rdi, prompt_for_count
  call printf
  mov rdi, read_int_fmt
  mov rsi, count
  call scanf

  ; this is safe from unintentional side-effects 
  ; from this program's set of instructions
  xor r14, r14
  mov r14, qword [count]

sumloop:
  xor rax, rax
  mov rdi, prompt_for_number
  call printf
  mov rdi, read_int_fmt
  mov rsi, number
  call scanf

  mov rax, qword [sum]
  mov rbx, qword [number]
  add rax, rbx
  mov qword [sum], rax
  dec r14
  xor rax, rax
  cmp rax, r14
  jl sumloop

  ; print the sum
  xor rax, rax
  mov rdi, print_int_fmt
  mov rsi, [sum]
  call printf

  mov rsp, rbp
  pop rbp
  ret