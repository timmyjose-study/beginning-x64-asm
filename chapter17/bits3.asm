; bits3.asm - showcasing bit operations bts (bit set to 1), btr (bit reset to 0), and bt (testing if bit is 1)

extern printb
extern printf

section .data
  msg1 db 'No bits are set',10,0
  msg2 db 'Set bit #4 (the fifth bit)',10,0
  msg3 db 'Set bit #7 (the eighth bit)',10,0
  msg4 db 'Set bit #8 (the ninth bit)',10,0
  msg5 db 'Set bit #61 (the 62nd bit)',10,0
  msg6 db 'Clear bit #8 (the ninth bit)',10,0
  msg7 db 'Test bit #61 (the 62nd bit), and display RDI',10,0
  msg8 db 'Set bit #62 (the 63nd bit)',10,0
  msg9 db 'Test bit #62 (the 63nd bit), and display RDI',10,0
  bitflags dq 0

section .bss
section .text
  global main

main:
  push rbp
  mov rbp, rsp

  ; print title
  xor rax, rax
  mov rdi, msg1
  call printf

  ; print bitflags
  mov rdi, [bitflags]
  call printb

  ; set the 5th bit
  xor rax, rax
  mov rdi, msg2
  call printf
  
  ; segmentation fault without `qword`. Interesting
  bts qword [bitflags], 4
  mov rdi, [bitflags]
  call printb

  ; set the 8th bit
  xor rax, rax
  mov rdi, msg3
  call printf

  bts qword [bitflags], 7
  mov rdi, [bitflags]
  call printb 

  ; set the 9th bit
  xor rax, rax
  mov rdi, msg4
  call printf

  bts qword [bitflags], 8
  mov rdi, [bitflags]
  call printb

  ; set the 62nd bit
  xor rax, rax
  mov rdi, msg5
  call printf

  bts qword [bitflags], 61
  mov rdi, [bitflags]
  call printb

  ; clear the 9th bit
  xor rax, rax
  mov rdi, msg6
  call printf

  btr qword [bitflags], 8
  mov rdi, [bitflags]
  call printb

  ; test the 62nd bit and print rdi
  xor rax, rax
  mov rdi, msg7
  call printf
  
  xor rdi, rdi
  mov rax, 61
  bt qword [bitflags], rax ; set CF is bit is on
  setc dil ; set dil to 1 if CF = 1, we use rdi here since it's used in printb
  call printb

  ; test the 63rd bit
  xor rax, rax
  mov rdi, msg9
  call printf

  xor rdi, rdi
  bt qword [bitflags], 62
  setc dil 
  call printb

  ; set the 63rd bit
  mov rdi, msg8
  call printf

  bts qword [bitflags], 62
  mov rdi, [bitflags]
  call printb

  ; test the 63rd bit again
  xor rax, rax
  mov rdi, msg9
  call printf

  xor rdi, rdi
  bt qword [bitflags], 62
  setc dil
  call printb

  leave
  xor rax, rax
  ret
