; stack.asm - reverse a string using the stack

extern printf

section .data
  strng db 'ABCDE',0
  strnglen equ $-strng-1
  fmt1 db 'The original string is: %s',10,0
  fmt2 db 'The reversed string is: %s',10,0

section .bss
section .text
  global main

main:
  push rbp
  mov rbp, rsp

  ; print the original string
  xor rax, rax
  mov rdi, fmt1
  mov rsi, strng
  call printf

  ; reverse the string using the 
  ; stack - push one character at a time using rbx as the base pointer and
  ; r12 as the index

  xor rax, rax
  lea rbx, [strng] ; push the base address of strng into rbx
  xor r12, r12 ; index register
  mov rcx, strnglen ; the number of characters to push

push_loop:
  mov al, byte [rbx + r12] ; get the character at the current index 
  inc r12 ; increment the index
  push rax ; push this onto the stack
  loop push_loop ; till rcx = 0

  ; pop and store the characters back into the original
  ; string's memory 
  lea rbx, [strng]
  xor r12, r12
  mov rcx, strnglen

pop_loop:
  pop rax ; pop off the top character into rax
  mov byte [rbx + r12], al ; store that character in the original string
  inc r12
  loop pop_loop

  ; print the reversed string
  xor rax, rax
  mov rdi, fmt2
  mov rsi, strng
  call printf

  mov rsp, rbp
  pop rbp
  xor rax, rax
  ret