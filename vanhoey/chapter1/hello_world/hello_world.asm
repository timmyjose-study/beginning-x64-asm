; hello_world.asm

section .data
  msg db "Hello, world",0

section .bss

section .text
  global main

main:
  mov rax, 1 ; write
  mov rdi, 1 ; sysout
  mov rsi, msg ; string to display
  mov rdx, 12 ; length of string to be displayed
  syscall ; display the string
  mov rax, 60 ; exit
  mov rdi, 0 ; success exit code
  syscall ; exit