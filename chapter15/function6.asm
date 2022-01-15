; function6.asm - showcasing calling conventions and callee/caller registers.

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

 fmtstr db 'The value of the string is %s',10,0

section .bss
  strng resb 11 ; including '\0'

section .text
  global main

main:
  push rbp
  mov rbp, rsp

  ; set up the arguments for create_string
  mov rdi, strng ; address of string
  mov rsi, first
  mov rdx, second
  mov rcx, third
  mov r8, fourth
  mov r9, fifth
  push tenth
  push ninth
  push eighth
  push seventh
  push sixth

  ; construct the string and print it
  call create_string
  xor rax, rax
  mov rdi, fmtstr
  mov rsi, strng
  call printf

  leave 
  ret

create_string:
  section .text
    push rbp
    mov rbp, rsp

    xor rax, rax
    mov al, byte [rsi]
    mov byte [rdi], al ; 'A'
    mov al, byte [rdx]
    mov byte [rdi + 1], al ; 'B'
    mov al, byte [rcx]
    mov byte [rdi + 2], al ; 'C'
    mov al, byte [r8]
    mov byte [rdi + 3], al ; 'D'
    mov al, byte [r9]
    mov byte [rdi + 4], al ; 'E'

    ; note - rbx, rbp, rsp, r12, r13, r14, and r15 are "callee registers', and so we must 
    ; save and restore them in the called function (if we use them in the function).

    push  rbx ; callee saved
    xor rbx, rbx
    mov rax, qword [rbp + 16] ; stack frame - rbp + saved rsp + rip
    mov bl, byte [rax]
    mov byte [rdi + 5], bl ; 'F'
    mov rax, qword [rbp + 24]
    mov bl, byte [rax]
    mov byte [rdi + 6], bl ; 'G'
    mov rax, qword [rbp + 32]
    mov bl, byte [rax]
    mov byte [rdi + 7], bl ; 'H'
    mov rax, qword [rbp + 40]
    mov bl, byte [rax]
    mov byte [rdi + 8], bl ; 'I'
    mov rax, qword [rbp + 48]
    mov bl, byte [rax]
    mov byte [rdi + 9], bl ; 'J'
    mov bl, 0
    mov byte [rdi + 10], bl ; '\0'

    pop rbx ; restore callee
    leave
    ret
