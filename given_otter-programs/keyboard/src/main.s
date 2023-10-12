.equ LEDS,0x11080000
.equ SSEG, 0x110C0000
.equ KEY_CHAR_PORT, 0x11200000

.global main
.type main, @function
main:
	li   s2, KEY_CHAR_PORT
	li   s3, SSEG
	li   s4, LEDS

	# register the interrupt handler
	la t0, ISR
	csrw mtvec, t0

	# enable interrupts
	li   t0, 1
	csrw mie, t0

loop:	j loop
	ret

# Interrupt Service Routine for keyboard
ISR:
	#echo code (scancodes) of key pressed on the keyboard to the SSEG
	lw t0, 0(s2)
	sw t0, 0(s3)
	
	#increment binary number displayed on LEDs for tracking number of interrupts/key presses
	lw t0, 0(s4)
	addi t0,t0,1
	sw t0, 0(s4)

	mret

