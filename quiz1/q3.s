.text
main:
    la s0, a            # addr of a with random numbers
    li sp, 0xFFFC       # setup stack_ptr
    li a0, 20           
    mv a1, s0           # setup regs for func call
    call func
end: j end


# params: a0 - n, a1 - &a
# return: a0 - x 
func:
    addi sp, sp, -16   # save all registers used
    sw ra, 12(sp)
    sw a1, 8(sp)
    sw a6, 4(sp)
    sw a7, 0(sp)
    # dont need to save a0 since returning value in it

    li a7, 0                # x = 0
    li a6, 0                # sum = 0
while_loop:
    bgt a7, a0, func_ret    # if x > n exit loop
    slli t0, a7, 2          # get offset from a
    li t0, a1, t0           # get addr of a[x]
    lw t0, 0(t0)            # get a[x]
    add a6, a6, t0          # sum += a[x]
while_loop_admin:
    addi a7, a7, 1          # x++
    j while_loop
func_ret:
    mv a0, a7               # move x to a0       
    lw ra, 12(sp)   
    lw a1, 8(sp)
    lw a6, 4(sp)
    lw a7, 0(sp)
    addi sp, sp, 20         # restore all registers
    ret