; cmdline.asm

extern printf

section .data
  msg db 'The command and arguments:',10,0
  fmtstr db '%s',0
  msglen equ $-msg
  NL db 0xa

section .bss
section .text
  global main

main:
  push rbp
  mov rbp, rsp

  mov r12, rdi ; argc
  mov r13, rsi ; argv[]

  ; print the banner
  xor rax, rax
  mov rdi, msg
  mov rsi, msglen
  call printf

  ; print the arguments
  xor r14, r14 ; counter for argc
argloop:
  xor rax, rax
  mov rdi, fmtstr
  mov rsi, qword [r13 + 8 * r14]
  call printf
  xor rax, rax
  mov rdi, fmtstr
  mov rsi, NL
  call printf
  inc r14
  cmp r14, r12
  jl argloop

  leave
  xor rax, rax
  ret
