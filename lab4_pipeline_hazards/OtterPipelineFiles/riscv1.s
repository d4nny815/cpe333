addi x10, x0, 10
addi x5, x0, 74
sub x4, x5, x10
sw x5, 0(x4)
nop
nop
nop
lw x7, 0(x4)
slli x6, x7, 1