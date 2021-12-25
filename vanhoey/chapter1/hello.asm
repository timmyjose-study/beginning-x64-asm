; hello.asm

section .data
  msg db 'Hello, world', 0x0, 0x0a
  
section .bss
section .text
  global main

main:
  mov rax, 1 ; syswrite
  mov rdi, 1 ; stdout
  mov rsi, msg
  mov rdx, 12  ; length of msg
  syscall
  mov rax, 60 ; exit
  mov rdi, 0 ; exit code
  syscall