; console1.asm - read a string from stdin using syscalls alone (no libc).

section .data
  msg1 db 'Hello, World!',10,0
  msg1len equ $-msg1-1
  msg2 db 'Your turn: ',0
  msg2len equ $-msg2-1
  msg3 db 'You answered: ',0
  msg3len equ $-msg3-1
  SYS_WRITE equ 1
  SYS_READ equ 0
  SYS_EXIT equ 60
  STDIN equ 0
  STDOUT equ 1
  MAX_STR_LEN equ 10

section .bss
  input resb MAX_STR_LEN

section .text
  global main

main:
  push rbp
  mov rbp, rsp

  ; print msg1
  mov rsi, msg1
  mov rdx, msg1len
  call prints

  ; print msg2
  mov rsi, msg2
  mov rdx, msg2len
  call prints

  ; read in input
  mov rsi, input
  mov rdi, MAX_STR_LEN
  call reads

  ; print msg3
  mov rsi, msg3
  mov rdx, msg3len
  call prints

  ; print the entered string
  mov rsi, input
  mov rdx, MAX_STR_LEN
  call prints

  ; exit
  mov rax, SYS_EXIT
  mov rdi, 0 ; exit code
  syscall

prints:
  section .text
    push rbp
    mov rbp, rsp

    ; message is in rsi, message len in rdx
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    syscall

    leave
    ret

reads:
  section .text
    push rbp
    mov rbp, rsp

    ; message is in rsi, message len in rdx
    mov rax, SYS_READ
    mov rdi, STDIN
    syscall

    leave
    ret
