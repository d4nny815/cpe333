
.equ test, 0x0044 
.equ SWITCHES, 0x11000000
.equ VGA_READ, 0x11040000
.equ LEDS,0x11080000
.equ SSEG, 0x110C0000
#.equ VGA_ADDR, 0x11100000
#.equ VGA_COLOR, 0x11140000


.text

.global main 
.type main, @function
main:
	li t0, 1		#set the interrupt variable to 1
	la x6, ISR		#sets up the isr block below
	csrw mtvec, x6		#loading the address for the isr
	li x7, SSEG		#put the location of SSEG to x7
	csrw mie, t0		#set the ability to do interrupts 
	li x4, 0		#start counter at 0

loop:	
j loop			#do nothing until the interrupt

ISR:	addi x4, x4, 1		#increment the counter by 1
	sw x4, 0(x7)		#set seven seg display to display counter number
	mret 			#jump back to the looping program

