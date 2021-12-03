; better_factorial.asm

extern printf

section .data
  number dq 10
  fmt db "factorial of %ld is %ld",0x0a,0x0

section .bss
section .text
  global main

main:
  push rbp
  mov rbp, rsp
  mov rcx, [number]
  mov rax, 1

floop:
  mul rcx,
  loop floop

  mov rdi, fmt
  mov rsi, [number]
  mov rdx, rax
  xor rax, rax
  call printf

  mov rsp, rbp
  pop rbp
  ret

