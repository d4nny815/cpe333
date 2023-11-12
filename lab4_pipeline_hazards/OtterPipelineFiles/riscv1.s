li x7, 25
li x5, 5
li x3, 64
li x4, 4
li x6, 6
loop:
	add x3, x4, x6
	add x5, x5, x3
	beq x7, x5, end
	j loop

end: addi x7, x3, 10
     li x3, 64
     sw x7, 16(x3)

