; alive2.asm

; note that variables created in the data (and bss) sections are
; essentially pointers, hence the need to dereference them as with
; [pi] and [radius]

extern printf

section .data
  msg1 db 'Hello, world!',0
  msg2 db 'Alive and kicking!',0
  radius dd 357
  pi dq 3.14159
  fmtstr  db '%s',10,0
  fmtflt db '%lf',10,0
  fmtint db '%d',10,0

section .bss
section .text
  global main

main:
  ; function prologue
  push rbp
  mov rbp, rsp
  
  ; print the strings
  mov rdi, fmtstr
  mov rsi, msg1
  call printf
  mov rdi, fmtstr
  mov rsi, msg2
  xor rax, rax ; no xmm registers involved
  call printf

  ; print the float
  mov rax, 1 ; using xmm registers - only 1 value 
  movq xmm0, [pi] ; dereference the pointer
  mov rdi, fmtflt
  call printf

  ; print the int
  xor rax, rax
  mov rdi, fmtint
  mov rsi, [radius] ; dereference the pointer
  call printf

  ; function epilogue
  mov rsp, rbp
  pop rbp

  xor rax, rax ; exit code
  ret ; return to the `main` function of the C runtime
