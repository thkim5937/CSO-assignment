.section .text
.global sumOfPowers

sumOfPowers:
    push %rbp
    mov %rsp, %rbp

    mov $0, %rax        # 합계를 저장할 rax를 0으로 초기화
    mov $1, %rcx        # 카운터 i를 1로 시작

loop_start:
    cmp %rdi, %rcx      # i와 n(rdi)을 비교
    jg loop_end         # i > n 이면 종료

    mov %rcx, %rdx      # i를 rdx로 복사
    imul %rcx, %rdx     # rdx = i * i (제곱 계산)
    add %rdx, %rax      # 합계에 더하기

    inc %rcx            # i++
    jmp loop_start      # 다시 루프 시작으로

loop_end:
    pop %rbp
    ret
