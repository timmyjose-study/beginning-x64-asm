; jumploop.asm

extern scanf
extern printf

section .data
  prompt db 'Enter a number:',10,0
  readintfmt db '%d',0
  sumfmt db 'The sum of numbers from 0 to %ld is %ld',10,0

section .bss
  number resq 1

section .text
  global main

main:
  push rbp
  mov rbp, rsp

  xor rax, rax
  mov rdi, prompt
  call printf
  mov rdi, readintfmt
  mov rsi, number
  call scanf

  mov rbx, 0 ; counter
  xor rax, rax ; accumulator for sum
sum_loop:
  add rax, rbx
  inc rbx ; rbx = rbx + 1
  cmp rbx, [number]
  jle sum_loop

  ; print the sum
  mov rdi, sumfmt
  mov rsi, [number]
  mov rdx, rax
  call printf

  mov rsp, rbp
  pop rbp
  ret