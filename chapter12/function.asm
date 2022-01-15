; function.asm - calculate the area of a circle with set radius.
;
;
; functions are basically subroutines - use call <func> and <leave>; <ret> to exit from 
; the labeled subroutine.
;
; Note that the function prologue
;
; push rbp
; mov rbp, rso
;
; can be substituted by the enter instruction
; whereas the function epilogue 
;
; mov rsp, rbp
; pop rbp
;
; can be substituted by the leave instruction.
;
; Howeever, `enter` is relatively expensive whereas `leave` is not, so the latter is used more often 
; than the former.
;
; Also note that for 32-bit, there are 8 xmm registers whereas for 64-bit, there are 16 xmm registers
; from xmm0 to xmm15

extern printf

section .data
  radius dq 10.0
  pi dq 3.14
  fmt db 'The area of a circle of radius %lf is %lf',10,0

section .bss
  darea resq 1

section .text
  global main

main:
  push rbp
  mov rbp, rsp

  call area
  mov rax, 2 
  mov rdi, fmt
  movsd xmm0, [radius]
  movsd xmm1, [darea]
  call printf
  
  leave
  ret

area:
  push rbp
  mov rbp, rsp

  movsd xmm0, [radius]
  mulsd xmm0, [radius]
  mulsd xmm0, [pi] ; area stored in darea
  movsd [darea], xmm0
  leave
  ret