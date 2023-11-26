#This file contains tests for R-type RISCV instructions WITH NO HAZARDS (by this I mean I added nops to prevent hazards)
#You can check to see if any of your tests fail using this link: https://piazza.com/class/kbprd1f9gqj5ro?cid=13

.data
	TEST: .word 0x1000770
	
.text

	#Setup stuff
	addi a0, zero, 50 #50 is an arbitrary number, most tests will end up with a result of 50 to keep things simple
	addi a1, zero, 1
	
tests:	
	nop
	nop
	
	#Load upper immediate test
	auipc	t0,0x0 
	nop
	nop
	addi	t0,t0,88 # PC+88= 0x68 <TEST>
	nop
	nop
	lw t1, 0(t0) #t1 should now hold the value 6000
	nop
	nop
	lui t2, 4096 #upper 4 bits of 6000
	nop
	nop
	addi t2, t2, 1904 #this is the lower 12 bits of 6000
	nop
	nop
	bne t1, t2, fail
	nop
	nop
	
	j tests
	nop
	nop

fail:
	j fail