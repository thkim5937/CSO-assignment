.section .text
.global findSalariesSum

findSalariesSum:
    # rdi = EMPLOYEE e[] (배열의 시작 주소)
    # rsi = int size (배열의 크기)

    mov $0, %rax            # 합계를 저장할 rax를 0으로 초기화
    mov $0, %rcx            # 루프 카운터 i = 0

loop_start:
    cmp %rsi, %rcx          # i와 size 비교
    jge loop_end            # i >= size 이면 종료

    # 현재 직원(e[i])의 salary 위치 계산:
    # 각 EMPLOYEE 구조체는 12바이트입니다.
    # salary는 구조체 시작으로부터 8바이트 뒤에 있습니다.
    # 주소 = rdi(시작) + (rcx * 12) + 8
    
    # 먼저 rcx * 12를 계산하기 위해 임시 레지스터 사용
    imul $12, %rcx, %rdx    # rdx = i * 12
    add %rdi, %rdx          # rdx = e + (i * 12) -> 현재 구조체의 주소
    
    add 8(%rdx), %eax       # 현재 구조체의 8바이트 오프셋(salary)을 eax에 더함

    inc %rcx                # i++
    jmp loop_start

loop_end:
    ret