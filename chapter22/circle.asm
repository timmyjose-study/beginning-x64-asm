; circle.asm - calculate the area and circumference of a circle.

global carea
carea:
  section .data
    .pi dq 3.141592653589793

  section .text
    push rbp
    mov rbp, rsp

    ; radius is already in xmm0
    mulsd xmm0, xmm0
    mulsd xmm0, [.pi]

    leave
    ret

global ccircum
ccircum:
  section .data
    .pi dq 3.141592653589793
    .two dq 2.0

  section .text
    push rbp
    mov rbp, rsp

    ; radius is already in xmm0
    mulsd xmm0, [.pi]
    mulsd xmm0, [.two]

    leave
    ret
