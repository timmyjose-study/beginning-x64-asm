; simple.asm

section .data
  EXIT_SUCCESS equ 0
  SYS_EXIT equ 60
  
  bvar1 db 17
  bvar2 db 9
  bresult db 0

  wvar1 dw 17000
  wvar2 dw 9000
  wresult dw 0

  dvar1 dd 17000000
  dvar2 dd 9000000
  dresult dd 0

  qvar1 dq 17000000
  qvar2 dq 9000000
  qresult dq 0

section .bss
section .text
  global _start

_start:
  ; function prologue
  push rbp
  mov rbp, rsp

  ; bresult = bvar1 + var2
  mov al, byte [bvar1]
  add al, byte [bvar2]
  mov byte [bresult], al

  ; wresult = wvar1 + wvar2
  mov ax, word [wvar1]
  add ax, word [wvar2]
  mov word [wresult], ax

  ; dresult = dvar1 + dvar2
  mov eax, dword [dvar1]
  add eax, dword [dvar2]
  mov dword [dresult], eax

  ; qresult = qvar1 + qvar2
  mov rax, qword [qvar1]
  add rax, qword [qvar2]
  mov qword [qresult], rax

  ; function epilogue
  mov rsp, rbp
  pop rbp
  mov rax, SYS_EXIT
  mov rdi, EXIT_SUCCESS
  syscall
