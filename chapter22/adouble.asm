; adouble.asm - double the elements of an array of doubles.

global adouble
adouble:
  section .data
    two dq 2.0

  section .text
    push rbp
    mov rbp, rsp

    ; save callee registers
    push rbx
    push r12

    mov rbx, rdi ; base address of array
    mov rcx, rsi ; length of array
    xor r12, r12 ; index

  double_loop:
    movsd xmm0, qword [rbx + r12 * 8]
    movsd xmm1, [two]
    mulsd xmm0, xmm1
    movq qword [rbx + r12 * 8], xmm0
    inc r12
    loop double_loop

    ; restore callee registers
    pop r12
    pop rbx

    leave
    ret
