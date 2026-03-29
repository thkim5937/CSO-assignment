.section .text
.global findPaymentsSum

findPaymentsSum:


    mov $0, %rax      
    mov $0, %rcx  

loop_start:
    cmp %rsi, %rcx 
    jge loop_end 
    
    add 8(%rdi, %rcx, 4), %eax 
    
    inc %rcx     
    jmp loop_start

loop_end:
    ret