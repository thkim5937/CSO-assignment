.section .text
.global compareAges

compareAges:

    mov 4(%rdi), %eax 
    mov 4(%rsi), %edx  

    cmp %edx, %eax
    je  is_equal 

    mov $0, %rax
    ret

is_equal:
    mov $1, %rax
    ret