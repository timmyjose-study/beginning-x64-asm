; jumploop.asm

extern printf

section .data
  number dq 1000000000
  fmt db "Sum of numbers from 0 to %ld is %ld",0x0a,0x0

section .bss
section .text
  global main

main:
  push rbp
  mov rbp, rsp
  mov rbx, 0 ; counter
  xor rax, rax ; accumulator

jloop:
  add rax, rbx
  inc rbx
  cmp rbx, [number]
  jle jloop

  mov rdi, fmt
  mov rsi, [number]
  mov rdx, rax
  xor rax, rax ; no xmm 
  call printf

  mov rsp, rbp
  pop rbp
  ret
