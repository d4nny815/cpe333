# Write a[10]=b[10]+10

# assuming a and b are arrays filled with words
# x10 as base addr of a and x11 has base addr of b
main:
    li t0, 10           # index 10
    slli t0, t0, 2      # index * 4 to get word offset
    add t1, x11, t0     # get addr of b[10]
    lw t1, 0(t1)        # load b[10]
    addi t1, t1, 10     # b[10] + 10
    add t2, x10, t0     # get addr of a[10]
    sw t1, 0(t2)        # a[10] = b[10] + 10
end: j end
