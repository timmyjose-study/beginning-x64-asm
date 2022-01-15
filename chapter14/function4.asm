; function4.asm

extern printf
extern scanf
extern c_area
extern c_circumference
extern r_area
extern r_perimeter

global pi ; makes it visible across other translation units

section .data
  pi dq 3.14159265458793

  read_radius_prompt db 'Enter the radius of the circle:',10,0
  read_radius_fmt db '%lf',0
  read_int_fmt db '%d',0

  read_length_prompt db 'Enter the length of the rectangle:',10,0
  read_breadth_prompt db 'Enter the breadth of the rectangle:',10,0

  print_c_area_fmt db 'The area of the circle is %.3f',10,0
  print_c_circum_fmt db 'The circumference of the circle is %.3f',10,0
  print_r_area_fmt db 'The area of the rectangle is %ld',10,0
  print_r_perimeter_fmt db 'The perimeter of the rectangle is %ld',10,0

section .bss
  radius resq 1
  length resq 1
  breadth resq 1

section .text
  global main

main:
  push rbp
  mov rbp, rsp

  ; read in the radius of the circle
  xor rax, rax
  mov rdi, read_radius_prompt
  call printf
  mov rdi, read_radius_fmt
  mov rsi, radius
  call scanf

  ; print the area of the circle
  movq xmm0, [radius]
  call c_area ; area is in xmm0
  mov rax, 1
  mov rdi, print_c_area_fmt
  call printf

  ; print the circumference of the circle
  movq xmm0, [radius]
  call c_circumference ; circumference is in xmm0
  mov rax, 1
  mov rdi, print_c_circum_fmt
  call printf

  ; read in the length and breadth
  xor rax, rax
  mov rdi, read_length_prompt
  call printf
  mov rdi, read_int_fmt
  mov rsi, length
  call scanf

  xor rax, rax
  mov rdi, read_breadth_prompt
  call printf
  mov rdi, read_int_fmt
  mov rsi, breadth
  call scanf

  ; print the area of the rectangle
  mov rdi, [length]
  mov rsi, [breadth]
  call r_area ; area is in rax
  mov rdi, print_r_area_fmt
  mov rsi, rax
  xor rax, rax
  call printf

  ; print the perimeter of the rectangle
  mov rdi, [length]
  mov rsi, [breadth]
  call r_perimeter ; perimeter is in rax
  mov rdi, print_r_perimeter_fmt
  mov rsi, rax
  xor rax, rax
  call printf

  leave
  xor rax, rax
  ret

