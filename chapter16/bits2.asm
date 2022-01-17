; bits2.asm - showcasing correct multiplication usign shl and sal and correct division using sar (correct for unsigned numbers)
; and incorrect division using shr for signed numbers.

extern printf

section .data
  mul_shl db 'SHL 2 = OK multiply by 4',10,0
  mul_sal db 'SAL 2 = OK multiply by 4',10,0
  div_shr_ok db 'SHR 2 = OK divide by 4',10,0
  div_shr_not_ok db 'SHR 2 = wrong divide by 4',10,0
  div_sar db 'SAR 2 = OK divide by 4',10,0

  print_num db 'The original number is %ld',10,0
  print_result db 'The resulting number is %ld',10,10,0
  number1 dq 8
  number2 dq -8

section .text
  global main

main:
  push rbp
  mov rbp, rsp

  ; SHL
  mov rax, [number1]
  shl rax, 2
  mov rdi, mul_shl
  mov rsi, print_num
  mov rdx, [number1]
  mov rcx, print_result
  mov r8, rax
  call print_stats

  mov rax, [number2]
  sal rax, 2
  mov rdi, mul_shl
  mov rsi, print_num
  mov rdx, [number2]
  mov rcx, print_result
  mov r8, rax
  call print_stats

  ; SAL
  mov rax, [number1]
  sal rax, 2
  mov rdi, mul_sal
  mov rsi, print_num
  mov rdx, [number1]
  mov rcx, print_result
  mov r8, rax
  call print_stats

  mov rax, [number2]
  sal rax, 2
  mov rdi, mul_sal
  mov rsi, print_num
  mov rdx, [number2]
  mov rcx, print_result
  mov r8, rax
  call print_stats

  ; SHR
  mov rax, [number1]
  shr rax, 2
  mov rdi, div_shr_ok
  mov rsi, print_num
  mov rdx, [number1]
  mov rcx, print_result
  mov r8, rax
  call print_stats

  mov rax, [number2]
  shr rax, 2
  mov rdi, div_shr_not_ok
  mov rsi, print_num
  mov rdx, [number2]
  mov rcx, print_result
  mov r8, rax
  call print_stats

  ; SAR
  mov rax, [number1]
  sar rax, 2
  mov rdi, div_sar
  mov rsi, print_num
  mov rdx, [number1]
  mov rcx, print_result
  mov r8, rax
  call print_stats

  mov rax, [number2]
  sar rax, 2
  mov rdi, div_sar
  mov rsi, print_num
  mov rdx, [number2]
  mov rcx, print_result
  mov r8, rax
  call print_stats

  leave
  xor rax, rax
  ret

print_stats:
  section .text
    push rbp
    mov rbp, rsp

    ; save and use callee registers
    ; for local manipulation
    push rbx
    mov rbx, rdi
    push r12
    mov r12, rsi
    push r13
    mov r13, rdx
    push r14
    mov r14, rcx
    push r15
    mov r15, r8

    ; print the banner
    xor rax, rax
    mov rdi, rbx
    call printf

    ; print the original number
    xor rax, rax
    mov rdi, r12
    mov rsi, r13
    call printf

    ; print the result
    xor rax, rax
    mov rdi, r14
    mov rsi, r15
    call printf

    ; restore callee saved
    pop r15
    pop r14
    pop r13
    pop r12
    pop rbx

    leave
    ret
