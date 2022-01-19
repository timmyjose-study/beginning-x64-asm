; move_strings.asm

%define SYS_WRITE 1
%define STDOUT 1

%macro prnt 2
  mov rax, SYS_WRITE
  mov rdi, STDOUT
  mov rsi, %1
  mov rdx, %2
  syscall

  mov rax, SYS_WRITE
  mov rdi, STDOUT
  mov rsi, NL
  mov rdx, 1
  syscall
%endmacro

section .data
  string1 db 10,'my_string of ASCII:',0
  string1len equ $-string1-1

  string2 db 10,'my_string of zeroes:',0
  string2len equ $-string2-1

  string3 db 10,'my_string of ones:',0
  string3len equ $-string3-1

  string4 db 10,'again my_string of ASCII:',0
  string4len equ $-string4-1

  string5 db 10,'copy my_string to other_string:',0
  string5len equ $-string5-1

  string6 db 10,'reverse copy my_string to other_string:',0
  string6len equ $-string6-1

  length equ 95
  NL db 0xa

section .bss
  my_string resb length
  other_string resb length

section .text
  global main

main:
  push rbp
  mov rbp, rsp

  ; fill the string with printable ASCII characters (32-126)
  prnt string1, string1len

  mov rax, 32
  mov rdi, my_string
  mov rcx, length

str_loop1:
  mov byte [rdi], al
  inc rdi
  inc al
  loop str_loop1

  prnt my_string, length

  ; fill the string with ASCII 0s
  prnt string2, string2len

  mov rax, 0x30 ; ASCII 0
  mov rdi, my_string
  mov rcx, length

  ; stosb is equivalent to
  ;
  ; mov byte [rdi], al
  ; inc rdi
  ; inc al
str_loop2:
  stosb 
  loop str_loop2

  prnt my_string, length

  ; fill the string with ASCII 1s
  prnt string3, string3len

  mov rax, 0x31 ; // ASCII 1
  mov rdi, my_string
  mov rcx, length
  ; rep stosb is equivalent to
  ;
  ; mov byte [rdi], al
  ; inc rdi
  ; inc al
  ; dec rcx
  ; cmp rcx, 0
  ; ja <loop-label>
  rep stosb 
  prnt my_string, length

  ; fill the string again with printable ASCII characters
  prnt string4, string4len
  mov rax, 32
  mov rdi, my_string
  mov rcx, length

str_loop3:
  mov byte [rdi], al
  inc rdi
  inc al
  loop str_loop3

  prnt my_string, length

  ; copy my_string to other_string
  prnt string5, string5len
  mov rsi, my_string ; source
  mov rdi, other_string ; destination
  mov rcx, length 

  ; rep movsb is equivalent to
  ;
  ; mov byte [rdi], sil
  ; inc rdi
  ; inc sil
  ; dec rcx
  ; cmp rcx, 0
  ; jae <loop-label>
  rep movsb
  prnt other_string, length

  ; reverse copy my_string to other_string
  prnt string6, string6len

  ; first clear other_string (fill with zeroes)
  mov rax, 0x30
  mov rdi, other_string
  mov rcx, length
  rep stosb

  ; just to confirm that other_string is cleared
  prnt other_string, length

  ; now load the high address from both rsi and rdi
  ; and copy length bytes in the reverse direction
  ; using the Direction Flag Register (DF) - when DF 
  ; is set, rsi and rdi are inc'e by 1, and when clear
  ; they are dec'd by 1 so this means that the order of
  ; the characters is the same, but the way in which they
  ; are copied is reversed.
  ; `std` to set DF and `cld` to clear DF
  lea rsi, [my_string + length - 4] ; upto ASCII 122
  lea rdi, [other_string + length]
  std ; DF = 1, so move from right to left
  ; so that only the lowercase alphabetic ASCII character set
  ; and 27 instead of 26 since `rep` reduces rcx first.
  mov rcx, 27 ;
  rep movsb
  prnt other_string, length

  leave
  xor rax, rax
  ret
