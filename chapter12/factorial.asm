; factorial.asm 
;
; Note: It is recommended to rely on the explicit passing (and returning) of values through registers and 
; the stack, not through memory.

extern printf
extern scanf

section .data
  prompt db 'Enter a number:',10,0
  readintfmt db '%d',0
  printfactfmt db 'The factorial of %ld is %ld',10,0

section .bss
  number resq 1
  fact resq 1

section .text
  global main

main:
  push rbp
  mov rbp, rsp

  ; read in the number
  xor rax, rax
  mov rdi, prompt
  call printf
  mov rdi, readintfmt
  mov rsi, number
  call scanf

  ; calculate and print the factorial
  call factorial

  xor rax, rax
  mov rdi, printfactfmt
  mov rsi, [number]
  mov rdx, [fact]
  call printf

  leave
  xor rax, rax
  ret

factorial:
  push rbp
  mov rbp, rsp

  mov rcx, [number]
  mov rax, 1
floop:
  imul rax, rcx
  ;dec rcx
  loop floop

  mov [fact], rax

  leave 
  ret
