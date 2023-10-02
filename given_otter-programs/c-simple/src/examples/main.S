
.text
.equ SWITCHES, 0x11000000
.equ LEDS,0x11080000
.equ SSEG, 0x110C0000

.global _srand
.global _rand

.global main 
.type main, @function
main:
	li s0, SSEG
	li s1, SWITCHES
	li s2, LEDS 

	lw a0, 0(s1)	#switches are used as seed to rand function
	call _srand

	li s3,1

	
1:	sw s3, 0(s2)
	addi s3,s3,1
	li a0,255 	#max of random number as argument to rand()
	call _rand

	sw a0, 0(s0) 	#display random number on SSEG
		
	li a0, 100000000#wait 0.8 seconds
	call wait
	j 1b
	ret

wait:
1:	addi a0,a0,-1		#wait a0*4/50*10^6 seconds 
	bnez a0, 1b		#assuming OTTER_freq is 50MHz
	ret
	
