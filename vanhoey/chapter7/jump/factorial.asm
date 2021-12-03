; factorial.asm

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
  mov rbx, 1
  mov rax, 1

jloop:
  mul rbx
  inc rbx
  cmp rbx, [number]
  jle jloop

  mov rdi, fmt
  mov rsi, [number]
  mov rdx, rax
  xor rax, rax
  call printf

  mov rsp, rbp
  pop rbp
  ret
