; macro.asm - showcasing single-line and multi-line macros in nasm.

extern printf

; single-line macro
%define double_it(r) sal r, 1

; multi-line macro
%macro prntf 2 ; takes two arguments
  section .data
    %%arg1 db %1,0 ; macro local variable syntax
    %%fmtint db '%s %ld',10,0

  section .text
    mov rdi, %%fmtint
    mov rsi, %%arg1
    mov rdx, [%2] ; second argument
    xor rax, rax
    call printf
%endmacro

section .data
  number dq 15

section .bss
section .text
  global main

main:
  push rbp
  mov rbp, rsp

  ; invoking the macros
  prntf "The number is ", number
  mov rax, [number]
  double_it(rax)
  mov qword [number], rax
  prntf "The number after doubling is ", number
  
  leave
  xor rax, rax
  ret