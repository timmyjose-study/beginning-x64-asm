; memory.asm

section .data
  bnum db 123
  wnum dw 12345
  warray times 5 dw 0
  dnum dd 12345
  qnum1 dd 12345
  text1 db "abc",0
  qnum2 dq 3.141592654
  text2 db "cde",0

section .bss
  bvar resb 1
  wvar resw 10
  dvar resd 1
  qvar resq 30000 ; memory is allocated at runtime

section .text
  global main

main:
  push rbp
  mov rbp, rsp

  lea rax, [bnum] ; load address of bnum into rax
  mov rax, bnum ; load address of bnum into rax
  mov rax, [bnum] ; load value of bnum into rax

  mov [bvar], rax ; load value from rax into bvar
  lea rax, [bvar] ; load address of bvar into rax

  lea rax, [wnum] ; load address of wnum into rax
  mov rax, [wnum] ; move value of wnum into rax

  lea rax, [text1] ; load address of text1 into rax
  mov rax, text1  ; move address of first character of text1 into rax 
  mov rax, text1 + 1 ; move address of second character of text1 into rax

  lea rax, [text1 + 1] ; load address of second character of text1 into rax
  mov rax, [text1] ; move first character of text1 into rax
  mov rax, [text1 + 1] ; move second character of text1 into rax

  mov rsp, rbp
  pop rbp
  ret
