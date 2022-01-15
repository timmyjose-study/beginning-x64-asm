; rect.asm

global r_area
r_area:
  section .text
    push rbp
    mov rbp, rsp

    mov rax, rdi
    imul rax, rsi

    leave
    ret

global r_perimeter
r_perimeter:
  section .text
    push rbp
    mov rbp, rsp

    mov rax, rdi
    add rax, rsi
    imul rax, 2

    leave
    ret
