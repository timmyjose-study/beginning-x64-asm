; console2.asm - enter a string from stdin, only lowercase alphabetic (ASCII) characters, and ignore characters 
; beyond the input buffer length, and wait till a NUL character has been encountered, then print the 
; correct string to stdout.

section .data
  msg1 db 'Hello, world',10,0
  msg2 db 'Your turn: ',0
  msg3 db 'You answered: ',0

  SYS_READ equ 0
  STDIN equ 0
  SYS_WRITE equ 1
  STDOUT equ 1
  SYS_EXIT equ 60

  MAX_STR_LEN equ 10
  NL db 0xa
  NUL equ 0x0

section .bss
  input resb MAX_STR_LEN + 1 ; for the NUL character

section .text
  global main

main:
  push rbp
  mov rbp, rsp

  ; print msg1
  mov rdi, msg1
  call prints

  ; print msg2
  mov rdi, msg2
  call prints

  ; read the input
  mov rdi, input
  mov rsi, MAX_STR_LEN
  call reads

  ; print msg3
  mov rdi, msg3
  call prints

  ; print the input string
  mov rdi, input
  call prints

  ; print a newline
  mov rdi, NL
  call prints

  ; exit
  mov rax, SYS_EXIT
  mov rdi, 0 ; exit code
  syscall

; count the length of the passed in string (in rdi) and print it.
; If the string is empty, do nothing and simply return from the 
; subroutine.
prints:
  section .text
    push rbp
    mov rbp, rsp

    push r12 ; save callee register
    mov r12, rdi ; address of string
    xor rdx, rdx ; to store the length

    ; count the length
  .cloop:
    cmp byte [r12], 0
    je .lengthfound
    inc r12 ; next character
    inc rdx ; bump up length
    jmp .cloop

  .lengthfound:
    cmp rdx, 0 ; empty string
    je .done
    ; print the string - rdx has the length
    mov rax, SYS_WRITE
    mov rsi, rdi  ; rdi has the string base address
    mov rdi, STDOUT
    syscall 
  
  .done:
    pop r12 ; restore callee register
    leave
    ret

; We read input one character at a time, and if the character is a NL then we are done - add a NUL and return from the subroutine
; If not, check that the character is a lowercase ASCII character - if not, loop around, if so, increment counters. Before storing
; in the input buffer, check that the max buffer length has not been exceeded - if not, store in input buffer, if so - loop around
; and wait till we encounter a newline character.
reads:
  section .bss
    .inputchar resb 1

  section .text
    push rbp
    mov rbp, rsp

    ; save the callee registers
    push r12
    push r13
    push r14
    
    mov r12, rdi ; base address of input buffer
    mov r13, rsi ; max length of input buffer
    xor r14, r14 ; use this as a character counter

  .readc:
    mov rax, SYS_READ
    mov rdi, STDIN
    lea rsi, [.inputchar]
    mov rdx, 1 ; read one character
    syscall

    mov al, [.inputchar]
    cmp al, byte [NL]; have we reached EOL yet?
    je .done
    cmp r14, r13 ; if we have already reached the buffer length
    jge .readc
    cmp al, 97 
    jl .readc ; c < 'a'
    cmp al, 122
    jg .readc ; c > 'z'
    mov byte [r12], al ; store in input buffer at current position
    inc r14 ; increment read count
    inc r12 ; next character position in input buffer
    jmp .readc

  .done:
    inc r12
    mov byte [r12], NUL ; add '\0'

    ; restore callee registers
    pop r14
    pop r13
    pop r12

    leave
    ret
