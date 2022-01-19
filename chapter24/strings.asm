; strings.asm - showcasing cmpsb for comparing strings, and scasb for search within strings

extern printf

section .data
  string1 db 'This is the first string.',10,0
  string2 db 'This is the second string.',10,0
  strlen2 equ $-string2-2
  string21 db 'Comparing strings: the same',10,0
  string22 db 'Compring strings: the strings differ'
           db ' starting at position %d.',10,0
  string3 db 'The quick brown fox jumps over the lazy dog.',0
  strlen3 equ $-string3-1
  string33 db 'Now look at this string: %s',10,0
  string4 db 'z',0
  string44 db 'The character "%s" was found at position: %d.',10,0
  string45 db 'The character "%s" was not found in the string.',10,0
  string46 db 'Scanning for the character "%s".',10,0

section .bss
section .text
  global main

main:
  push rbp
  mov rbp, rsp

  ; print the two strings
  xor rax, rax
  mov rdi, string1
  call printf
  xor rax, rax
  mov rdi, string2
  call printf

  ; compare the two strings
  lea rdi, [string1]
  lea rsi, [string2]
  mov rdx, strlen2
  call compare1
  cmp rax, 0
  jnz not_equal1

  mov rdi, string21
  call printf
  jmp otherversion

not_equal1:
  mov rdi, string22
  mov rsi, rax
  xor rax, rax
  call printf

otherversion:
  lea rdi, [string1]
  lea rsi, [string2]
  mov rdx, strlen2
  call compare2
  cmp rax, 0
  jnz not_equal2

  mov rdi, string21
  call printf
  jmp scanning

not_equal2:
  mov rdi, string22
  mov rsi, rax
  xor rax, rax
  call printf

scanning:
  ; first print the string
  mov rdi, string33
  mov rsi, string3
  call printf

  ; print the search argument
  mov rdi, string46
  mov rsi, string4
  call printf

  lea rdi, [string3]
  lea rsi, [string4]
  mov rdx, strlen3
  call cscan
  cmp rax, 0
  jz char_not_found

  ; character found
  mov rdi, string44
  mov rsi, string4
  mov rdx, rax
  xor rax, rax
  call printf
  jmp exit

char_not_found:
  mov rdi, string45
  mov rsi, string4
  xor rax, rax
  call printf

exit:
  leave
  xor rax, rax
  ret

compare1:
  section .text
    push rbp
    mov rbp, rsp

    mov rcx, rdx
    cld 
  .cmpr:
    cmpsb
    jne .notequal
    loop .cmpr
    jmp .exit
    xor rax, rax

  .notequal:
    mov rax, strlen2
    dec rcx
    sub rax, rcx ; find position at which strings differ
    jmp .exit

  .exit:
    leave
    ret

compare2:
  section .text
    push rbp
    mov rbp, rsp

    mov rcx, rdx
  .cmpr:
    repe cmpsb
    jz .equal
    mov rax, strlen2
    sub rax, rcx
    jmp .exit

  .equal:
    xor rax, rax

  .exit:
    leave
    ret

cscan:
  section .text
    push rbp
    mov rbp, rsp

    mov rcx, rdx
    lodsb ; load byte [rsi] into rax
    cld
    repne scasb ; scascb compares al with byte [rdi]
    jnz .char_not_found
    mov rax, strlen3
    sub rax, rcx ; found character's position
    jmp .exit

  .char_not_found:
    xor rax, rax

  .exit:
    leave
    ret
