; multiply.asm - multiply numbers using a macro.

extern scanf
extern printf

%macro prologue 0
  push rbp
  mov rbp, rsp
%endmacro

%macro multiply 2 ; takes two arguments
  section .text
    push rbx 
    mov rbx, [%1]
    push r12
    mov r12, [%2]

    imul rbx, r12
    mov rax, rbx

    pop r12
    pop rbx
%endmacro

%macro read_num 2
  section .data
    %%fmtstr db %1,10,0
    %%fmtint db '%ld',0

  section .text
    xor rax, rax
    mov rdi, %%fmtstr
    call printf

    mov rdi, %%fmtint
    mov rsi, %2
    call scanf
%endmacro

%macro print_result 2
  section .data
    %%printfmt db %1,0 ; this is needed for pointer types like strings
    %%intfmt db '%ld',10,0

  section .text
    push rbx
    mov rbx, %2 ; since printf affects rax
    and qword rsp, 0xfffffffffffffff0 ; align the stack

    mov rdi, %%printfmt
    call printf
    mov rdi, %%intfmt
    mov rsi, rbx
    call printf

    pop rbx
%endmacro

section .data
  msg1 db 'Enter number:',10,0
  msg2 db 'Product = %ld',10,0
  fmtint db '%ld',0

section .bss
  number1 resq 1
  number2 resq 2

section .text
  global main

main:
  prologue

  read_num "Enter number:", number1
  read_num "Enter number:", number2

  multiply number1, number2
  print_result "Product is ", rax

  leave 
  ret

    
