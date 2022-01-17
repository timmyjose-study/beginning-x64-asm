; main.asm

extern printf
extern scanf
extern add_ints
extern sub_ints
extern mul_ints
extern div_ints

section .data
section .bss
  number1 resq 1
  number2 resq 1

section .text
  global main

main:
  push rbp
  mov rbp, rsp

  ; read in number 1
  mov rdi, number1
  call read_int

  ; read in number 2
  mov rdi, number2
  call read_int

  ; invoke sum_ints
  mov rdi, [number1]
  mov rsi, [number2]
  call add_ints

  ; invoke sub_ints
  mov rdi, [number1]
  mov rsi, [number2]
  call sub_ints

  ; invoke mul_ints
  mov rdi, [number1]
  mov rsi, [number2]
  call mul_ints

  ; invoke div_ints
  mov rdi, [number1]
  mov rsi, [number2]
  call div_ints

  leave
  xor rax, rax
  ret

read_int:
  section .data
    .prompt_int db 'Enter number:',10,0
    .read_int_fmt db '%d',0

  section .text
    push rbp
    mov rbp, rsp

    ; save the variable's address in rbx before 
    ; calling printf
    push rbx ; callee saved
    and rsp, 0xfffffffffffffff0 ; align the stack 
    mov rbx, rdi

    xor rax, rax
    mov rdi, .prompt_int
    call printf
    mov rdi, .read_int_fmt
    mov rsi, rbx
    call scanf

    pop rbx ; callee restored
    leave
    ret
