; hello_world_n_times.asm

extern scanf
extern printf

section .data
  prompt db 'Enter count:',10,0
  readintfmt db '%ld',0
  msg db 'Hello, world',10,0

section .bss
  count resq 1

section .text
  global main

main:
  push rbp
  mov rbp, rsp

  ; read the count
  xor rax, rax
  mov rdi, prompt
  call printf
  mov rdi, readintfmt
  mov rsi, count
  call scanf

  xor r14, r14 ; counter
print_loop:
  mov rdi, msg
  call printf
  inc r14
  cmp r14, [count]
  jl print_loop

  mov rsp, rbp
  pop rbp
  ret
