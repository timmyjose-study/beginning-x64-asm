; sreverse.asm - reverse a string

global sreverse
sreverse:
  section .data
    MAX_STR_LEN equ 1024

  section .bss
    .input
  section .text
    push rbp
    mov rbp, rsp

    ; save callee register
    push rbx
    push r12

    ; reverse the string using the stack
    mov rbx, rdi ; base address of string
    mov rcx, rsi ; length of string
    xor r12, r12 ; index

  push_loop:
    mov al, byte [rbx + r12]
    push rax
    inc r12
    loop push_loop

    mov rbx, rdi
    mov rcx, rsi
    xor r12, r12

  pop_loop:
    pop rax
    mov byte [rbx + r12], al
    inc r12
    loop pop_loop

    ; restore callee registers
    pop r12
    pop rbx

    leave
    ret
