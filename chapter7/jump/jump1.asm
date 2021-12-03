; jump1.asm

extern printf

section .data
  number1 dq 41
  number2 dq 42
  fmt1 db "NUMBER1 <= NUMBER2",0x0a,0x0
  fmt2 db "NUMBER1 > NUMBER2",0x0a,0x0

section .bss
section .text
  global main

main:
  push rbp
  mov rbp, rsp
  mov rax, [number1]
  mov rbx, [number1]
  cmp rax, rbx
  jle lesser

  xor rax, rax
  mov rdi, fmt2
  call printf
  jmp exit

lesser:
  xor rax, rax
  mov rdi, fmt1
  call printf

exit:
  mov rsp, rbp
  pop rbp
  ret
