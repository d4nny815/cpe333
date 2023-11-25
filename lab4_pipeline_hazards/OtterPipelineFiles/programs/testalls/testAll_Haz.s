.data
    data: .word 0

.text

loop:
    li t0, 0x1234
    la s0, data
    li t2, 0x1234
    sw t0, 0(s0)
    lw t1, 0(s0)
    bne t1, t2, fail
    j loop
fail:
    j fail
