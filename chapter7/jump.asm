; jump.asm

extern printf

section .data
  number1 dq 42
  number2 dq 41
  fmt1 db "Number1 >= Number2",10,0
  fmt2 db "Number1 < Number2",10,0

section .bss
section .text
  global main

main:
  ; prologue
  push rbp
  mov rbp, rsp

  mov rax, [number1]
  mov rbx, [number2]
  cmp rax, rbx
  jge greater

  xor rax, rax ; no xmm registers used
  mov rdi, fmt2
  call printf
  jmp exit

greater:
  xor rax, rax ; no xmm registers used
  mov rdi, fmt1
  call printf

exit:
  ; epilogue and return
  mov rsp, rbp
  pop rbp
  ret
