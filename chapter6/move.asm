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
  ; prologue
  push rbp
  mov rbp, rsp

  mov rax, -1 ; fill rax with 1s
  mov al, byte [bnum] ; does not clear upper bits
  xor rax, rax ; clear rax
  mov al, byte [bnum] ; correct value

  mov rax, -1
  mov ax, word [wnum]
  xor rax, rax
  mov ax, word [wnum]

  mov rax, -1
  mov eax, dword [dnum] ; this does clear upper bits

  mov rax, -1
  mov rax, qword [qnum1] ; clears upper bits
  mov qword [qnum2], rax ; this is correct
  mov rax, 123456 ; immediate value

  movq xmm0, [qnum3] ; movq is required for floats
  
  ; epilogue
  mov rsp, rbp
  pop rbp

  ; exit
  mov rax, 60
  mov rdi, 0
  syscall