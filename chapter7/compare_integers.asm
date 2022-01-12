; compare_integers.asm

; All the jump instructions:
; 
; Unsigned:
;   
;   jb
;   jbe
;   ja
;   jae
; 
; Signed/Unsigned:
;   
;   je (ZF = 1)
;   jne (ZF = 0)
;   jl  
;   jle
;   jg
;   jge


extern scanf
extern printf

section .data
  prompt1 db 'Enter the first number',10,0
  prompt2 db 'Enter the second number',10,0
  readintfmt db '%d',0
  fmtle db '%d <= %d',10,0
  fmtgt db '%d > %d',10,0

section .bss
  number1 resq 1
  number2 resq 1

section .text
  global main

main:
  push rbp
  mov rbp, rsp

  ; read number 1 in
  xor rax, rax
  mov rdi, prompt1
  call printf
  mov rdi, readintfmt
  mov rsi, number1
  call scanf

  ; read number 2 in 
  xor rax, rax
  mov rdi, prompt2
  call printf
  mov rdi, readintfmt
  mov rsi, number2
  call scanf

  ; compare them
  mov rax, [number1]
  mov rbx, [number2]
  cmp rax, rbx
  jg greater
  
  xor rax, rax
  mov rdi, fmtle
  mov rsi, [number1]
  mov rdx, [number2]
  call printf
  jmp exit

greater:
  xor rax, rax
  mov rdi, fmtgt
  mov rsi, [number1]
  mov rdx, [number2]
  call printf

exit:
  mov rsp, rbp
  pop rbp
  ret