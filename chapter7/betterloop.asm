; betterloop.asm - using rcx as the implicit counter which is checked by the loop instruction
;
; Note that this is around 3x-4x slower than using an explicit register counter (as in jumploop.asm).
;

extern printf
extern scanf

section .data
  prompt db 'Enter the count:',10,0
  readintfmt db '%d',0
  sumfmt db 'The sum of numbers from 0 to %ld is %ld',10,0

section .bss
  count resq 1

section .text
  global main

main:
  push rbp
  mov rbp, rsp

  xor rax, rax
  mov rdi, prompt
  call printf
  mov rdi, readintfmt
  mov rsi, count
  call scanf

  xor rax, rax ; accumulator for storing the sum
  mov rcx, qword [count] ; counter
sum_loop:
  add rax, rcx
  loop sum_loop ; continue till rcx = 0, decrementing by 1 at each stage

  ; print the sum
  mov rdi, sumfmt
  mov rsi, [count]
  mov rdx, rax
  call printf

  mov rsp, rbp
  pop rbp
  ret
