; calc.asm - a full-blown calculator using floats and functions.
;
; Note: The System V calling conventions are as follows:

; Passing arguments to function:

; The first 6 integer or pointer arguments are passed in via RDI, RSI, RDX, RCX, R8, and R9. The rest via the stack (in reverse order).
; For floats, XMM0, XMM1, XMM2, XMM3, XMM4, XMM5, XMM6, and XMM7, and the rest via the stack (in reverse order).
;
; Returning from function:
;
; RAX for integers/pointers
; XMM0 for floats.
; 

extern printf
extern scanf

section .data
  number1 dq 0.0
  number2 dq 0.0
  fmt_sum db 'Sum',0
  fmt_diff db 'Difference',0
  fmt_prod db 'Product',0
  fmt_quot db 'Quotient',0

section .bss
section .text
  global main

main:
  push rbp
  mov rbp, rsp

  ; read in the numbers
  lea rdi, [number1]
  call read_number

  lea rdi, [number2]
  call read_number

  ; display the numbers
  mov rdi, 1
  movq xmm0, [number1]
  call print_number

  mov rdi, 2
  movq xmm0, [number2]
  call print_number

  ; display the sum
  lea rdi, [number1]
  lea rsi, [number2]
  call add_nums ; result in xmm0
  mov rdi, fmt_sum
  call print_result

  ; display the difference
  lea rdi, [number1]
  lea rsi, [number2]
  call sub_nums
  mov rdi, fmt_diff
  call print_result

  ; display the product
  lea rdi, [number1]
  lea rsi, [number2]
  call mult_nums
  mov rdi, fmt_prod
  call print_result

  ; display the quotient
  lea rdi, [number1]
  lea rsi, [number2]
  call div_nums
  mov rdi, fmt_quot
  call print_result

  leave
  xor rax, rax
  ret

read_number:
  section .data
    .prompt_number db 'Enter number:',10,0
    .fmt_read_number db '%lf',0

  section .bss
  section .text
    push rbp
    mov rbp, rsp

    xor r12, r12
    mov r12, rdi ; address of number

    xor rax, rax
    mov rdi, .prompt_number
    call printf
    mov rdi, .fmt_read_number
    mov rsi, r12
    call scanf

    leave
    ret

add_nums:
  section .data
    .fmtmsg db 'Here!',10,0

  section .text
    push rbp
    mov rbp, rsp

    movsd xmm0, [rdi]
    addsd xmm0, [rsi]

    leave
    ret

sub_nums:
  section .text
    push rbp
    mov rbp, rsp

    movsd xmm0, [rdi]
    subsd xmm0, [rsi]

    leave 
    ret

mult_nums:
  section .text
    push rbp
    mov rbp, rsp

    movsd xmm0, [rdi]
    mulsd xmm0, [rsi]

    leave 
    ret

div_nums:
  section .text
    push rbp
    mov rbp, rsp

    movsd xmm0, [rdi]
    divsd xmm0, [rsi]

    leave
    ret

print_number:
  section .data
    .fmt_number db 'Argument %d is %lf',10,0

  section .bss
    .argpos resq 1
    .number resq 1

  section .text
    push rbp
    mov rbp, rsp

    mov [.argpos], rdi
    movq [.number], xmm0

    mov rax, 1
    mov rdi, .fmt_number
    mov rsi, [.argpos]
    movq xmm0, [.number]
    call printf

    leave 
    ret

print_result:
  section .data
    .fmt_res db '%s is %.3lf',10,0

  section .text
    push rbp
    mov rbp, rsp

    mov r12, rdi ; result banner

    mov rax, 1
    mov rdi, .fmt_res ; value is in xmm0
    mov rsi, r12
    call printf

    leave
    ret
