.equ COUNT, 100

.global main 
.type main, @function
main:

	jalr x6,x8,4
	jalr x6,4(x8)

	li s0, 0
	li s1, COUNT
	jal x2,2
loop:
	add s0,s0,s1
	addi s1,s1,-1
	bnez s1, loop 
