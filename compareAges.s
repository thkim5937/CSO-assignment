.section .text
.global compareAges

compareAges:
    # rdi = CUSTOMER* a (첫 번째 구조체 시작 주소)
    # rsi = CUSTOMER* b (두 번째 구조체 시작 주소)

    # 1. 각 구조체의 age 값을 로드합니다. (Offset 4 사용)
    # int는 4바이트이므로 64비트 rax 대신 32비트 eax/edx를 사용합니다.
    mov 4(%rdi), %eax    # eax = a->age
    mov 4(%rsi), %edx    # edx = b->age

    # 2. 두 값을 비교합니다.
    cmp %edx, %eax
    je  is_equal         # 값이 같으면 is_equal 레이블로 점프

    # 3. 다를 경우 (0 리턴)
    mov $0, %rax
    ret

is_equal:
    # 4. 같을 경우 (1 리턴)
    mov $1, %rax
    ret