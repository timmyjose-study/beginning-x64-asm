; circle.asm

extern pi ; from function4.asm
  
global c_area ; used in function4.asm
c_area:
  section .text
    push rbp
    mov rbp, rsp

    ; xmm0 contains the radius already
    mulsd xmm0, xmm0
    mulsd xmm0, [pi]

    leave
    ret

global c_circumference
c_circumference:
  section .data
    two dq 2.0

  section .text
    push rbp
    mov rbp, rsp

    ; xmm0 contains the radius
    mulsd xmm0, [two]
    mulsd xmm0, [pi]

    leave
    ret
    
    
