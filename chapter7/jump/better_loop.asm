; better_loop.asm

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
  mov rcx, [number] ; counter
  xor rax, rax ; accumulator

bloop:
  add rax, rcx
  loop bloop ; continues till [rcx] = 0

  mov rdi, fmt
  mov rsi, [number]
  mov rdx, rax
  xor rax, rax
  call printf

  mov rsp, rbp
  pop rbp
  ret
