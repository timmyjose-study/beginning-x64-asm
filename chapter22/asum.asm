; asum.asm - calculate the sum of an array of doubles.

global asum
asum:
  section .text
    push rbp
    mov rbp, rsp

    mov rbx, rdi ; base address of array
    mov rcx, rsi ; length of array
    xor r12, r12 ; index
    pxor xmm0, xmm0

    sum_loop:
      addsd xmm0, qword [rbx + r12 * 8]
      inc r12
      loop sum_loop 

    ; restore callee registers
    pop r12
    pop rbx

    leave
    ret
