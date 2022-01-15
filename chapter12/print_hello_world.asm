; print_hello_world - print "Hello, world" using a function

extern printf

section .data
  msg db 'Hello, world!',0
  count dq 5
  fmt db '%s',10,0

section .bss
section .text
  global main

main:
  push rbp
  mov rbp, rsp

  call hello_world

  leave
  xor rax, rax
  ret

hello_world:
  push rbp
  mov rbp, rsp

  xor r12, r12
  mov r12, [count]
print_loop:
  xor rax, rax
  mov rdi, fmt
  mov rsi, msg
  call printf
  dec r12
  xor rax, rax
  cmp rax, r12
  jl print_loop

  leave
  ret
