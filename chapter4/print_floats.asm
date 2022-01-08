; print_floats.asm

; note that there are 16 xmm registers in 64-bit processors.

extern printf

section .data
  fmtflt db 'radius: %.5lf, volume: %.4lf, length: %.3lf, breadth: %.2lf, height: %.1lf',10,0
  radius  dq 110.2345
  volume  dq 19.28
  length  dq 81.99
  breadth dq 4.567
  height  dq 12.3

section .bss
section .text
  global main

main:
  ; prologue
  push rbp
  mov rbp, rsp

  ; print the floats
  mov rax, 5 
  movq xmm0, [radius]
  movq xmm1, [volume]
  movq xmm2, [length]
  movq xmm3, [breadth]
  movq xmm4, [height]
  mov rdi, fmtflt
  call printf

  ; epilogue
  mov rsp, rbp
  pop rbp

  ; return
  xor rax, rax
  ret
