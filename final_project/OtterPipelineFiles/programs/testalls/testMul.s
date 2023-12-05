.text
init:
    li x4, 100
    li x6, 20
    li x7, 5

    mul x6, x6, x7
    bne x4, x6, fail
    nop
    nop
    li x4, 0xFF
    li x7, 0xFFFFF
    mulh x6, x7, x7
    bne x4, x6, fail
    nop
    nop
    li x4, 0xffffe
    li x5, -1
    mulhsu x6, x7, x5
    bne x4, x6, fail
    nop
    nop
    li x4, -2
    mulhu x6, x5, x5
    bne x4, x6, fail 
    nop
    nop
    li x5, 100
    mul x4, x5, zero
    bne zero, x4, fail
    nop
    nop
    
    j init


fail: j fail

