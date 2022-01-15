; function2.asm - showcasing local variables in functions.
;
; area function - calculates the area of the circle
; circumference function - calculates the circumference of the circle
; circle function - calls the area and circumference functions and prints them

extern printf
extern scanf

section .data
section .bss
  radius resq 1

section .text
  global main

main:
  push rbp
  mov rbp, rsp

  call circle

  leave
  xor rax, rax
  ret

circle:
  section .data
    .prompt_radius db 'Enter the radius:',10,0
    .read_radius db '%lf',0
    .fmt_radius db 'The circle has a radius of %.3lf',10,0
    .fmt_area db 'The are of the circle is %.3lf',10,0 ; local variable
    .fmt_circum db 'The circumference of the circle is %.3lf',10,0 ; local variable

  section .text
    push rbp
    mov rbp, rsp

    ; read in the radius and print it
    xor rax, rax
    mov rdi, .prompt_radius
    call printf
    mov rdi, .read_radius
    mov rsi, radius
    call scanf

    mov rax, 1
    mov rdi, .fmt_radius
    movsd xmm0, [radius]
    call printf

    ; display the area
    call area ; area is in xmm0
    mov rax, 1
    mov rdi, .fmt_area
    call printf

    ; display the circumference
    call circumference ; circum\ is in xmm0
    mov rax, 1
    mov rdi, .fmt_circum
    call printf

    leave
    ret

area:
  section .data
    .pi dq 3.141592654

  section .text
    push rbp
    mov rbp, rsp

    movsd xmm0, [radius]
    mulsd xmm0, [radius]
    mulsd xmm0, [.pi]

    leave
    ret

circumference:
  section .data
    .pi dq 3.14
    .two dq 2.0

  section .text
    push rbp
    mov rbp, rsp

    movsd xmm0, [radius]
    mulsd xmm0, [.two]
    mulsd xmm0, [.pi]

    leave 
    ret
