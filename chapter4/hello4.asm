; hello4.asm

; Note: to pass arguments in Linux, the following order is used:
;
; rdi, rsi, rdx, r8, r9, r10, and any further arguments are pushed onto the stack in reverse order.

extern printf

section .data
  msg db 'Hello, world!',0
  fmtstr db 'This is our string: %s',10,0

section .bss
section .text
  global main

main:
  ; function prologue
  push rbp
  mov rbp, rsp

  ; print the message
  mov rdi, fmtstr ; first arg to printf
  mov rsi, msg  ; second arg to printf
  mov rax, 0 ; no xmm registers involved
  call printf ; invoke the printf function in libc

  ; function epilogue
  mov rsp, rbp
  pop rbp

  ; exit
  mov rax, 60
  mov rdi, 0
  syscall
