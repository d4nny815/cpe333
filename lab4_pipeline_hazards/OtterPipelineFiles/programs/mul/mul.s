init:
    li a0, 233
    li a1, 333
    call mult
end: j end

mult:
    li t0, 0
loop:
    add t0, t0, a1 

loop_admin:
    addi a0, a0, -1
    bne zero, a0, loop
    mv a0, t0
    ret


