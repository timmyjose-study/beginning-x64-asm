; reverse_string.asm - reverse an input string

extern fgets
extern printf
extern strlen
extern stdin ; FILE *stdin

section .data
  prompt db 'Enter a string:',10,0
  readstrfmt db '%[^\n]s',0
  fmt1 db 'The original string is: %s',0
  fmt2 db 'The reversed string is: %s',0
  MAX_STR_LEN equ 80

section .bss
  strng resq MAX_STR_LEN
  strnglen resq 1

section .text
  global main

main:
  push rbp
  mov rbp, rsp

  ; read in the string
  xor rax, rax
  mov rdi, prompt
  call printf
  mov rdi, strng
  mov rsi, MAX_STR_LEN
  mov rdx, [stdin]
  call fgets

  ; print the original string
  xor rax, rax
  mov rdi, fmt1
  mov rsi, strng
  call printf

  ; get the string length
  mov rdi, strng
  call strlen
  dec rax ; return value is stored in rax, rdx etc.et , get rid of the '\n'
  mov [strnglen], rax 

  ; reverse the string
  xor rax, rax
  lea rbx, [strng] ; base address
  xor r12, r12 ; index
  mov rcx, [strnglen] ; counter

push_loop:
  mov al, byte [rbx + r12]
  push rax
  inc r12
  loop push_loop

  ; store back the reversed characters in the same string address
  lea rbx, [strng]
  xor r12, r12
  mov rcx, [strnglen]

pop_loop:
  pop rax
  mov byte [rbx + r12], al
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
