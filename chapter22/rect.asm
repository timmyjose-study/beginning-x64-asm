; rect.asm - calculate the area and perimeter of a rectangle

global rarea
rarea:
  section .text
    push rbp
    mov rbp, rsp

    mov rax, rdi ; length
    imul rax, rsi ; length * breadth
    
    leave
    ret

global rperimeter
rperimeter:
  section .text
    push rbp
    mov rbp, rsp

    mov rax, rdi ; length
    add rax, rsi ; length + breadth
    imul rax, 2 ; 2 * (length + breadth)

    leave 
    ret
