; compare_floats.asm

extern scanf
extern printf

section .data
  prompt1 db 'Enter first number: ',10,0
  prompt2 db 'Enter second number: ',10,0
  readfmt db '%lf',0 ; be very careful with this format - needs to match decl type
  printfmt1 db '%.5f >= %.5f',10,0
  printfmt2 db '%.5f < %.5f',10,0

section .bss
  number1 resq 1
  number2 resq 1

section .text
  global main

main:
  ; prologue
  push rbp
  mov rbp, rsp

  ; read in the numbers
  xor rax, rax
  mov rdi, prompt1
  call printf
  mov rdi, readfmt
  mov rsi, number1
  call scanf

  xor rax, rax
  mov rdi, prompt2
  call printf
  mov rdi, readfmt
  mov rsi, number2
  call scanf

  ; compare the numbers
  mov rax, [number1]
  mov rbx, [number2]
  cmp rax, rbx
  jge greater

  mov rax, 2
  movq xmm0, [number1]
  movq xmm1, [number2]
  mov rdi, printfmt2
  call printf
  jmp exit

greater:
  mov rax, 2
  movq xmm0, [number1]
  movq xmm1, [number2]
  mov rdi, printfmt1
  call printf

exit:
  ; prologue and return
  mov rsp, rbp
  pop rbp
  ret
