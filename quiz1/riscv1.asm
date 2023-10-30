.data
a: .word 1, 6, 6, 7, 8, 8, 9, 10, 10, 11, 11, 12, 12, 13, 14, 15, 15, 16, 16, 18 # initilize array to random numbers

.text
main:
    la a0, a            # load addr of a into a0 
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

end: j end