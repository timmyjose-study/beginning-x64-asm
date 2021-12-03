; move.asm

section .data
  bnum db 123
  wnum dw 12345
  dnum dd 1234567890
  qnum1 dq 1234567890123456789
  qnum2 dq 123456
  qnum3 dq 3.14

section .bss
section .text
  global main

main:
  push rbp
  mov rbp, rsp
  mov rax, -1
  mov al, byte [bnum] ; does not clear upper bits of rax
  xor rax, rax ; rax is now cleared
  mov al, byte [bnum] ; now rax has the correct value

  mov rax, -1
  mov ax, word [wnum]
  xor rax, rax
  mov ax, word [wnum]

  mov rax, -1
  mov eax, dword [dnum] ; moving a 32bit value into a 64bit register clears the upper bits, but not otherwise

  mov rax, -1
  mov rax, qword [qnum1]
  mov qword [qnum2], rax
  mov rax, 123456
  
  movq xmm0, [qnum3]

  mov rsp, rbp
  pop rbp
  ret
