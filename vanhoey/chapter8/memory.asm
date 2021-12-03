; memory.asm

section .data
  bnum db 123
  wnum dw 12345
  warray times 5 dw 0 ; an array of 5 words
  dnum dd 12345
  qnum1 dq 12345
  text1 db "abc",0x0
  qnum2 dq 3.141592654
  text2 db "cde",0x0

section .bss
  bvar resb 1
  dvar resd 1
  wvar resw 10
  qvr resq 3

section .text
  global main

main:
  push rbp
  mov rbp, rsp
  lea rax, [bnum] ; load rax with the address of bnum
  mov rax, [bnum] ; load rax with the address of bnum
  mov [bvar], rax ; 

