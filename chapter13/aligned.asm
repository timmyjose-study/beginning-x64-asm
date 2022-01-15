; aligned.asm
;
; call foo pushes the 8 byte return address on the stack, which is used up by the ret instruction.
;
; stack alignment (when a function is called) must be 16 byte alignemnt (not 8 byte, due to SIMD instructions).
; Hence the need for a proper function prologue and epilogue.

extern printf

section .data
  fmt db 'Two times pi is %.5lf',10,0
  pi dq 3.141592653658979

section .bss
section .text
  global main

main:
  push rbp
  call func1
  pop rbp
  ret

func1:
  push rbp
  call func2
  pop rbp
  ret

func2:
  push rbp
  call func3
  pop rbp
  ret

func3:
  push rbp

  movsd xmm0, [pi]
  mulsd xmm0, [pi]
  mov rax, 1
  mov rdi, fmt
  call printf

  pop rbp
  ret