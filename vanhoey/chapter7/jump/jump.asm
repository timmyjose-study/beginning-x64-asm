; jump.asm

extern printf

section .data
  number1 dq 42
  number2 dq 41
  fmt1 db "NUMBER 1 >= NUMBER2",0x0a,0x0
  fmt2 db "NUMBER 1 < NUMBER2",0x0a,0x0

section .bss
section .text
  global main

main:
  push rbp
  mov rbp, rsp
  mov rax, [number1]
  mov rbx, [number2]
  cmp rax, rbx
  jge greater
  xor rax, rax
  mov rdi, fmt2
  call printf
  jmp exit
greater:
  xor rax, rax
  mov rdi, fmt1
  call printf
exit:
  mov rsp, rbp
  pop rbp
  ret
