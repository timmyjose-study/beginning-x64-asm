; bits1.asm

; shr - zero fill
; sal - sign fill

extern printf
extern printb

section .data
  msgn1 db 'Number1',10,0
  msgn2 db 'Number2',10,0
  msg1 db 'XOR',10,0
  msg2 db 'OR',10,0
  msg3 db 'AND',10,0
  msg4 db 'NOT number1',10,0
  msg5 db 'SHL 2 lower byte of number 1',10,0
  msg6 db 'SHR 2 lower byte of number 1',10,0
  msg7 db 'SAL 2 lower byte of number 1',10,0
  msg8 db 'SAR 2 lower byte of number 1',10,0
  msg9 db 'ROL 2 lower byte of number 1',10,0
  msg10 db 'ROL 2 lower byte of number 2',10,0
  msg11 db 'ROR 2 lower byte of number 1',10,0
  msg12 db 'ROR 2 lower byte of number 2',10,0
  number1 dq -72
  number2 dq 1064

section .bss
section .text
  global main

main:
  push rbp
  mov rbp, rsp

  ; print number 1
  mov rsi, msgn1
  call print_msg
  mov rdi, [number1]
  call printb

  ; print number 2
  mov rsi, msgn2
  call print_msg
  mov rdi, [number2]
  call printb

  ; XOR
  mov rsi, msg1
  call print_msg
  mov rax, [number1]
  xor rax, [number2]
  mov rdi, rax
  call printb

  ; OR
  mov rsi, msg2
  call print_msg
  mov rax, [number1]
  or rax, [number2]
  mov rdi, rax
  call printb

  ; AND
  mov rsi, msg3
  call print_msg
  mov rax, [number1]
  and rax, [number2]
  mov rdi, rax
  call printb

  ; NOT (number 1)
  mov rsi, msg4
  call print_msg
  mov rax, [number1]
  not rax
  mov rdi, rax
  call printb

  ; SHL by 2 (number 1)
  mov rsi, msg5
  call print_msg
  mov rax, [number1]
  shl al, 2
  mov rdi, rax
  call printb

  ; SHR by 2 (number 1)
  mov rsi, msg6
  call print_msg
  mov rax, [number1]
  shr al, 2
  mov rdi, rax
  call printb

  ; SAL by 2 (number 1)
  mov rsi, msg7
  call print_msg
  mov rax, [number1]
  sal rax, 2
  mov rdi, rax
  call printb

  ; SAR by 2 (number 1)
  mov rsi, msg8
  call print_msg
  mov rax, [number1]
  sar rax, 2
  mov rdi, rax
  call printb

  ; ROL by 2 (number 1)
  mov rsi, msg9
  call print_msg
  mov rax, [number1]
  rol al, 2
  mov rdi, rax
  call printb

  ; ROL by 2 (number 2)
  mov rsi, msg10
  call print_msg
  mov rax, [number2]
  rol al, 2
  mov rdi, rax
  call printb

  ; ROR by 2 (number 1)
  mov rsi, msg11
  call print_msg
  mov rax, [number1]
  ror al, 2
  mov rdi, rax
  call printb

  ; ROR by 2 (number 2)
  mov rsi, msg12
  call print_msg
  mov rax, [number2]
  ror al, 2
  mov rdi, rax
  call printb 

  leave
  xor rax, rax
  ret

print_msg:
  section .data
    .fmtstr db '%s',0

  section .text
    push rbp
    mov rbp, rsp

    xor rax, rax
    mov rdi, .fmtstr
    call printf

    leave
    ret
