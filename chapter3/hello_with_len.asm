; hello_with_len.asm

section .data 
  msg db 'Hello, world', 0x0, 0xa
  msglen equ $-msg

section .bss
section .text
  global main

main:
  mov rax, 1  ; sys_write
  mov rdi, 1  ; stdout
  mov rsi, msg
  mov rdx, msglen
  syscall

  mov rax, 60 ; exit
  mov rdi, 0  ; exit code
  syscall