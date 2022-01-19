; add_cmd_args.asm - add the numbers passed in on the command line.

extern printf
extern atoi

section .data
  msg db 'The sum of the arguments is %ld',10,0
  fmtint db '%ld',0

section .bss
  sum resq 1

section .text
  global main

main:
  push rbp
  mov rbp, rsp

  mov r12, rdi ; argc
  mov r13, rsi ; argv[]
  xor r14, r14 ; index into argv[]
  
add_loop:
  mov rax, qword [r13 + 8 * r14]
  mov rdi, rax
  call atoi
  add qword [sum], rax
  inc r14
  cmp r14, r12
  jl add_loop

  xor rax, rax
  mov rdi, msg
  mov rsi, qword [sum]
  call printf

  leave
  xor rax, rax
  ret