; function5.asm - showcasing the SytemV AMD64 ABI Calling Conventions
;

; Passing arguments:
; 
;   For integer and pointer arguments, in this order - rdi, rsi, rdx, rcx, r8, and r9; the rest on the stack in reverse order
; 
;   For floats, in this order - xmm0, xmm1, xmm2, xmm3, xmm4, xmm5, xmm6, and xmm7; the rest on the stack (not using push though)
; 
; Returning values:
; 
;   For integer and pointer values, using rax.
; 
;   For floats, using xmm0.

extern printf

section .data
  first db 'A',0
  second db 'B',0
  third db 'C',0
  fourth db 'D',0
  fifth db 'E',0
  sixth db 'F',0
  seventh db 'G',0
  eighth db 'H',0
  ninth db 'I',0
  tenth db 'J',0

  print_fmt db '%s%s%s%s%s%s%s%s%s%s',10,0
  print_flt_fmt db '%.5lf',10,0
  pi dq 3.1415358793

section .bss
section .text
  global main

main:
  push rbp
  mov rbp, rsp

  mov rdi, print_fmt
  mov rsi, first
  mov rdx, second
  mov rcx, third
  mov r8, fourth
  mov r9, fifth
  
  ; and the rest on the stack, in reverse order
  push tenth
  push ninth
  push eighth
  push seventh
  push sixth
  xor rax, rax
  call printf

  ; we may need to align the stack along a 16-byte boundary before using floats (or in any case),
  ; but note that any pops after this alignment may be wrong and therefore re-corrected according to 
  ; the original layout
  ;
  ; Also, without this stack alignment to a 16 byte boundary, printing the float results in a 
  ; segmentation fault
  and qword rsp, 0xfffffffffffffff0

  mov rax, 1
  mov rdi, print_flt_fmt
  movsd xmm0, [pi]
  call printf

  leave 
  xor rax, rax
  ret