    AREA asm_func, CODE, READONLY
    EXPORT factorial
factorial
    PUSH    {lr, r1}      ; 리턴 주소와 r1(원래 n)을 스택에 저장
    CMP     r0, #1        ; r0에 저장된 n과 1을 비교
    BLE     factorial_base; n이 1 이하이면 기본 조건으로 분기
    MOV     r1, r0        ; 현재 n 값을 r1에 저장 (보존됨)
    SUB     r0, r0, #1    ; n을 1 감소 (n-1 계산)
    BL      factorial  ; 재귀 호출: factorial(n-1)
    MUL     r0, r1, r0    ; r1(원래 n)과 재귀 호출 결과를 곱함
    POP     {r1, lr}      ; 스택에서 r1과 리턴 주소 복원
    BX      lr            ; 결과가 r0에 있으므로 리턴

factorial_base
    MOV     r0, #1        ; 기본 조건: n이 0 또는 1이면 1을 반환
    POP     {r1, lr}      ; 스택에서 r1과 리턴 주소 복원
    BX      lr            ; 함수 리턴
    END
