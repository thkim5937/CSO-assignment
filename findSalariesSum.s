.section .text
.global findSalariesSum

findSalariesSum:

    mov $0, %rax 
    mov $0, %rcx 

loop_start:
    cmp %rsi, %rcx
    jge loop_end 
 
    imul $12, %rcx, %rdx
    add %rdi, %rdx 
    
    add 8(%rdx), %eax

    inc %rcx  
    jmp loop_start

loop_end:
    ret