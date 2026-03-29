.section .text
.global findPaymentsSum

findPaymentsSum:
    # rdi = CUSTOMER* c (구조체 시작 주소)
    # rsi = int num_of_payments (더해야 할 배열 요소의 개수)

    mov $0, %rax            # rax를 0으로 초기화 (합계를 저장할 변수)
    mov $0, %rcx            # rcx를 0으로 초기화 (루프 카운터 i = 0)

loop_start:
    cmp %rsi, %rcx          # i(rcx)와 num_of_payments(rsi) 비교
    jge loop_end            # i >= 개수 이면 루프 종료

    # 배열 요소의 주소 계산:
    # payments[i]의 주소 = 구조체 시작(rdi) + 배열 시작 오프셋(8) + (i * 4바이트)
    # 8(%rdi, %rcx, 4)는 rdi + 8 + (rcx * 4)를 의미합니다.
    
    add 8(%rdi, %rcx, 4), %eax  # 현재 payments[i] 값을 eax에 더함
    
    inc %rcx                # i++ (다음 요소로)
    jmp loop_start          # 루프 처음으로 이동

loop_end:
    # 결과값은 이미 rax(eax)에 들어있으므로 바로 리턴
    ret