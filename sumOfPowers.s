.section .text
.global sumOfPowers

sumOfPowers:
    push %rbp
    mov %rsp, %rbp

    mov $0, %rax 
    mov $1, %rcx 

loop_start:
    cmp %rdi, %rcx 
    jg loop_end

    mov %rcx, %rdx 
    imul %rcx, %rdx 
    add %rdx, %rax 

    inc %rcx
    jmp loop_start 

loop_end:
    pop %rbp
    ret
