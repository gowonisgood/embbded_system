    AREA asm_func, CODE, READONLY
    EXPORT my_asm
my_asm
    LDR R1, =0x40020400 ; GPIOB 기본 주소 (LED1 은 PB0에 연결)
    CMP R0, #0
    ITE EQ
    MOVEQ R2, #0x00010000 ; if==0, LED1 비트 끄기 (BSRR 레지스터의 상위 부분, 비트 16)
    MOVNE R2, #0x00000001 ; if==1, LED1 비트 켜기 (BSRR 레지스터의 하위부분, 비트 0)
    STR R2, [R1,#0x18] ; BSRR 레지스터에 값 저장 (오프셋 0x18)
    BX LR
    END