init:
    li x3, 100
    li x4, -5
    li x5, -20

    div x6, x3, x4
    bne x6, x5, fail

    li x4, 5
    neg x5, x5
    div x6, x3, x4
    bne x6, x5, fail

    li x4, 33
    li x3, -7
    li x5, -4
    div x6, x4, x3
    bne x6, x5, fail

    li x4, 33
    li x3, 7
    li x5, 4
    div x6, x4, x3
    bne x6, x5, fail

    
    li x4, 7
    li x3, 2
    li x5, 1
    remu x6, x4, x3
    bne x6, x5, fail

    li x4, 7
    li x3, -2
    li x5, 1
    rem x6, x4, x3
    bne x6, x5, fail

    # div by 0
    li x3, 100 
    li x5, -1
    div x6, x3, x0
    bne x6, x5, fail

    #divu by 0
    divu x7, x3, x0
    bne x7, x5, fail

    # rem by 0
    li x3, 16
    rem x6, x3, x0
    bne x6, x3, fail
    
    #remu by 0
    remu x7, x3, x0
    bne x7, x3, fail

    # overflow div
    li x3, -2147483648
    li x4, -1
    mv x5, x3
    div x6, x3, x4
    bne x6, x5, fail
    
    # overflow rem
    rem x7, x3, x4
    bne x7, zero, fail



    j init

fail:
    j fail
