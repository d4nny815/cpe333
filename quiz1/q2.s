.text
main:
save_context:
    addi sp, sp, -20
    sw ra, 16(sp)
    sw a0, 12(sp)
    sw a1, 8(sp)
    sw a2, 4(sp)
    sw a3, 0(sp)

    la a0, a            # load addr of a into a0 (a is files with 20 random values) 
    li a1, 0            # sum = 0
    li a2, 0            # x = 0
    li a3, 10           # end count
    
while_loop:
    slli t0, a2, 2      # x * 4 to move to next word in array
    add t0, a0, t0      # addr of a[x]
    lw t0, 0(t0)        # get value from array
    add a1, a1, t0      # sum += a[x]
while_loop_admin:
    addi a2, a2, 1      # x++
    blt a2, a3, while_loop  # if x < 10 continue loop

restore_context:
    lw ra, 16(sp)
    lw a0, 12(sp)
    lw a1, 8(sp)
    lw a2, 4(sp)
    lw a3, 0(sp)
    addi sp, sp, 20
    ret
