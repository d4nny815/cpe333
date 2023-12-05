#This file contains tests for R-type RISCV instructions WITH NO HAZARDS (by this I mean I added nops to prevent hazards)
#You can check to see if any of your tests fail using this link: https://piazza.com/class/kbprd1f9gqj5ro?cid=13

.data
	TEST: .word 50
	
.text
	#Setup stuff
	addi a0, zero, 50 #50 is an arbitrary number, most tests will end up with a result of 50 to keep things simple
	addi a1, zero, 1

tests:	
	#Load test
	la t0, TEST
	lw t1, 0(t0)
	bne t1, a0, fail
	
	nop
	nop
	li t0, 100
	li t1, 2
	li t2, 50
	li t3, 15
	sw t0, 0(t0)
	nop
	nop
	sw t1, 1(t0)
	nop
	nop
	sw t2, 2(t0)
	nop
	nop
	sw t3, 3(t0)
	nop
	nop
	
	j tests

fail:
	j fail
