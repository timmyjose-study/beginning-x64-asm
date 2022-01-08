; read_and_print_msg.asm - read a string from stdin and print to stdout

section .data
  prompt db 'Enter a string (max 100 characters): ', 0x0, 0xa
  promptlen equ $-prompt

section .bss
  msg resb 100 ; reserve 100 bytes for the message
  msglen resb 1 ; reserve 1 byte for message length

section .text
  global main

main:
  mov rax, 1  ; sys_wrte
  mov rdi, 1  ; stdout
  mov rsi, prompt
  mov rdx, promptlen
  syscall

  mov rax, 0  ; sys_read
  mov rdi, 0  ; stdin
  mov rsi, msg
  mov rdx, msglen
  syscall

  mov rax, 1  ; sys_write
  mov rdi, 1  ; stdout
  mov rsi, msg
  mov rdx, msglen
  syscall

  mov rax, 60 ; sys_write
  mov rdi, 0  ; exit code
  syscall